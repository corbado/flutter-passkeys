/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {CallableRequest, HttpsError, onCall} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import {initializeApp} from "firebase-admin/app";
import {DecodedIdToken, getAuth, UserRecord} from "firebase-admin/auth";
import {CorbadoService, User} from "./corbado_service";
import {
    InvalidEmailError,
    InvalidOtpInputError,
    NoPasskeyAvailableError,
    PasskeyAlreadyExists,
    UnknownUserError,
    UserAlreadyExistsError
} from "./exceptions";
import {
    EmailOTPLoginFinish,
    EmailOTPLoginStart,
    PasskeyAppendFinish,
    PasskeyDelete,
    PasskeyLoginFinish,
    PasskeyLoginStart,
    PasskeyRegisterFinish,
    PasskeyRegisterStart,
    RequestMetadata,
    WithFirebaseToken, WithUserAgent
} from "./types";

// ongoing syncing situations:
// 1. user has a firebase account, but no corbado account
// => Corbado account will be created in the passkeyAppend or the signupWithPasskey call
// => FB user will be updated with the corbadoUserId (this id is needed to fetch passkeys)
//
// 2. user has a Corbado account, but no firebase account
// FB account will be created in all login calls if it does not exist

const app = initializeApp();
const auth = getAuth(app);

const CORBADO_PROJECT_ID = process.env.CORBADO_PROJECT_ID;
const CORBADO_API_SECRET = process.env.CORBADO_API_SECRET;
const baseUrl = `https://${CORBADO_PROJECT_ID}.frontendapi.corbado.io`;

if (!CORBADO_PROJECT_ID || !CORBADO_API_SECRET) {
    throw new Error("Missing environment variables. You must set CORBADO_PROJECT_ID and CORBADO_API_SECRET");
}

const corbadoService = new CorbadoService(baseUrl, CORBADO_PROJECT_ID, CORBADO_API_SECRET);

enum ErrorCodes {
    NO_PASSKEY_AVAILABLE = "NO_PASSKEY_AVAILABLE",
    USER_ALREADY_EXISTS = "USER_ALREADY_EXISTS",
    INVALID_USERNAME = "INVALID_USERNAME",
    INVALID_OTP_CODE = "INVALID_OTP_CODE",
    UNKNOWN_USER = "UNKNOWN_USER",
    INVALID_AUTH_TOKEN = "INVALID_AUTH_TOKEN",
    UNKNOWN_ERROR ="UNKNOWN_ERROR",
    PASSKEY_ALREADY_EXISTS = "PASSKEY_ALREADY_EXISTS",
}

const parseRequestMetadata = (callableRequest: CallableRequest): RequestMetadata => {
    let userAgent = callableRequest.rawRequest.headers["user-agent"] as string;
    const remoteAddress = callableRequest.rawRequest.headers["x-forwarded-for"] as string|undefined;

    try {
        const ua = callableRequest.data as WithUserAgent;
        userAgent = ua.userAgent;
    } catch (e) {
        logger.debug(`No user agent in request: ${e}`);
    }

    logger.info(`User agent: ${userAgent}`);
    logger.info(`Remote address1: ${remoteAddress}`);

    return new RequestMetadata(userAgent, remoteAddress ?? '127.0.0.1');
}

export const startSignUpWithPasskey = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as PasskeyRegisterStart;
        const metadata = parseRequestMetadata(callableRequest);
        return await corbadoService.startSignUpWithPasskey(params.username, metadata);
    } catch (e) {
        if (e instanceof UserAlreadyExistsError) {
            throw new HttpsError("unknown", ErrorCodes.USER_ALREADY_EXISTS);
        }

        if (e instanceof InvalidEmailError) {
            throw new HttpsError("unknown", ErrorCodes.INVALID_USERNAME);
        }

        throw handleUnknownError(e);
    }
});

export const finishSignUpWithPasskey = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyRegisterFinish;
    const metadata = parseRequestMetadata(callableRequest);

    try {
        const corbadoUser = await corbadoService.finishSignUpWithPasskey(params.signedChallenge, metadata);
        // remove the "usr-" prefix from the corbadoUserId
        const corbadoUserId = corbadoUser.sub.substring(4);
        await auth.createUser({
            uid: corbadoUserId,
            email: corbadoUser.orig,
        });

        await auth.setCustomUserClaims(corbadoUserId, {
            corbadoUserId: corbadoUser.sub,
        });

        return await auth.createCustomToken(corbadoUserId);
    } catch (e) {
        throw handleUnknownError(e);
    }
});

export const startLoginWithPasskey = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as PasskeyLoginStart;
        const metadata = parseRequestMetadata(callableRequest);
        logger.debug(`Input: ${JSON.stringify(metadata)}`);

        return await corbadoService.startLoginWithPasskey(params.username, metadata);
    } catch (e) {
        if (e instanceof InvalidEmailError) {
            throw new HttpsError("unknown", ErrorCodes.INVALID_USERNAME);
        }

        if (e instanceof UnknownUserError) {
            throw new HttpsError("unknown", ErrorCodes.UNKNOWN_USER);
        }

        if (e instanceof NoPasskeyAvailableError) {
            throw new HttpsError("unknown", ErrorCodes.NO_PASSKEY_AVAILABLE);
        }

        throw handleUnknownError(e);
    }
});

export const finishLoginWithPasskey = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as PasskeyLoginFinish;
        const metadata = parseRequestMetadata(callableRequest);
        const corbadoUser = await corbadoService.finishLoginWithPasskey(params.signedChallenge, metadata)
        const firebaseUid = await getFirebaseUid(corbadoUser);

        return await auth.createCustomToken(firebaseUid);
    } catch (e) {
        throw handleUnknownError(e);
    }
});

export const startLoginWithEmailOTP = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as EmailOTPLoginStart;
        const metadata = parseRequestMetadata(callableRequest);
        return await corbadoService.startLoginWithEmailOTP(params.username, metadata);
    } catch (e) {
        if (e instanceof InvalidEmailError) {
            throw new HttpsError("unknown", ErrorCodes.INVALID_USERNAME);
        }

        if (e instanceof UnknownUserError) {
            throw new HttpsError("unknown", ErrorCodes.UNKNOWN_USER);
        }

        throw handleUnknownError(e);
    }
});

export const finishLoginWithEmailOTP = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as EmailOTPLoginFinish;
        const metadata = parseRequestMetadata(callableRequest);
        const corbadoUser = await corbadoService.finishLoginWithEmailOTP(params.emailCodeID, params.code, metadata)
        const firebaseUid = await getFirebaseUid(corbadoUser);


        return await auth.createCustomToken(firebaseUid);
    } catch (e) {
        if (e instanceof InvalidOtpInputError) {
            throw new HttpsError("unknown", ErrorCodes.INVALID_OTP_CODE);
        }

        throw handleUnknownError(e);
    }
});

export const startPasskeyAppend = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as WithFirebaseToken
        const metadata = parseRequestMetadata(callableRequest);

        const verifiedToken = await verifyIdToken(params.firebaseToken);
        if (!verifiedToken.email) {
            throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR, "No email in token");
        }

        const res = await corbadoService.startPasskeyAppend(verifiedToken.email, verifiedToken.email, metadata);
        if (res == "") {
            throw new PasskeyAlreadyExists();
        }

        return res;
    } catch (e) {
        if (e instanceof PasskeyAlreadyExists) {
            throw new HttpsError("unknown", ErrorCodes.PASSKEY_ALREADY_EXISTS);
        }

        throw handleUnknownError(e);
    }
});

export const finishPasskeyAppend = onCall(async (callableRequest: CallableRequest): Promise<boolean> => {
    const params = callableRequest.data as PasskeyAppendFinish;
    const metadata = parseRequestMetadata(callableRequest);
    try {
        const verifiedToken = await verifyIdToken(params.firebaseToken);
        const corbadoUserId = await corbadoService.finishPasskeyAppend(params.signedChallenge, metadata);

        await auth.setCustomUserClaims(verifiedToken.uid, {
            corbadoUserId: corbadoUserId,
        });

        // for now, we just always force a refresh
        return true;
    } catch (e) {
        throw handleUnknownError(e);
    }
});

export const getPasskeys = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as WithFirebaseToken;
    try {
        const verifiedToken = await verifyIdToken(params.firebaseToken);
        const corbadoUserId = verifiedToken.corbadoUserId;
        if (!corbadoUserId) {
            // this firebase user has never been connected to a Corabdo user => no passkeys can exist
            return JSON.stringify([]);
        }
        const res = await corbadoService.getPasskeys(corbadoUserId);
        return JSON.stringify(res);
    } catch (e) {
        throw handleUnknownError(e);
    }
});

export const deletePasskey = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyDelete;
    try {
        const corbadoUserId = await verifyIdTokenAndGetCorbadoUserId(params.firebaseToken);
        await corbadoService.deletePasskey(corbadoUserId, params.passkeyId);
        return;
    } catch (e) {
        throw handleUnknownError(e);
    }
});

export const deleteUser = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as WithFirebaseToken;
    try {
        const verifiedToken = await verifyIdToken(params.firebaseToken);
        const corbadoUserId = verifiedToken.corbadoUserId;
        if (!corbadoUserId) {
            // this firebase user has never been connected to a Corabdo user => we don't have to delete anything
            return;
        }

        await corbadoService.deleteUser(corbadoUserId);
        return;
    } catch (e) {
        throw handleUnknownError(e);
    }
});


const verifyIdToken = async (token: string): Promise<DecodedIdToken> => {
    try {
        return await auth.verifyIdToken(token);
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.INVALID_AUTH_TOKEN);
    }
}

const verifyIdTokenAndGetCorbadoUserId = async (token: string): Promise<string> => {
    const verifiedToken = await verifyIdToken(token);
    if (!verifiedToken.corbadoUserId) {
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR, "No corbadoUserId in token");
    }

    return verifiedToken.corbadoUserId;
}

const handleUnknownError = (e: unknown) => {
    logger.error(JSON.stringify(e));
    return new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
}

const maybeGetUser = async (firebaseUid: string) => {
    try {
        return await auth.getUser(firebaseUid);
    } catch (e) {
        return null;
    }
}

const maybeGetUserByEmail = async (firebaseEmail: string) => {
    try {
        return await auth.getUserByEmail(firebaseEmail);
    } catch (e) {
        return null;
    }
}

const getFirebaseUid = async (corbadoUser: User) => {
    const corbadoId = corbadoUser.sub.substring(4);

    const maybeUserByEmail = await maybeGetUserByEmail(corbadoUser.orig);
    logger.debug(`maybeUserByEmail ${JSON.stringify(maybeUserByEmail)}`);
    if (maybeUserByEmail) {
        await maybeUpdateClaims(maybeUserByEmail, corbadoId);
        return maybeUserByEmail.uid;
    }

    const maybeUserById = await maybeGetUser(corbadoId);
    logger.debug(`maybeUserById ${JSON.stringify(maybeUserById)}`);
    if (maybeUserById) {
        await maybeUpdateClaims(maybeUserById, corbadoId);
        return maybeUserById.uid;
    }

    const newUser = await auth.createUser({
        uid: corbadoId,
        email: corbadoUser.orig,
    });

    await maybeUpdateClaims(newUser, corbadoId);

    return corbadoId;
}

const maybeUpdateClaims = async (firebaseUser: UserRecord, corbadoUserId: string) => {
    if (!firebaseUser.customClaims?.corbadoUserId) {
        logger.debug(`Setting custom claims for ${firebaseUser.uid}`);

        await auth.setCustomUserClaims(firebaseUser.uid, {
            corbadoUserId: corbadoUserId,
        });
    }
}