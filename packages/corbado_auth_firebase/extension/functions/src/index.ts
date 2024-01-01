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
import {DecodedIdToken, getAuth} from "firebase-admin/auth";
import {CorbadoService} from "./corbado_service";
import {NoPasskeyAvailableError, UnknownUserError} from "./exceptions";
import {RawAxiosRequestConfig} from "axios";


const app = initializeApp();
const auth = getAuth(app);

const CORBADO_PROJECT_ID = "pro-4268394291597054564";
const CORBADO_API_SECREET = "corbado1_UJ6igcNQWH5se5SwjZFMP2J2bBT7wo";
const baseUrl = `https://${CORBADO_PROJECT_ID}.frontendapi.corbado.io`;

const corbadoService = new CorbadoService(baseUrl, CORBADO_PROJECT_ID, CORBADO_API_SECREET);

export type PasskeyRegisterStart = {
    username: string,
    fullName: string,
}

export type PasskeyRegisterFinish = {
    signedChallenge: string,
}

export type PasskeyLoginStart = {
    username: string,
}

export type PasskeyLoginFinish = {
    signedChallenge: string,
}

export type WithFirebaseToken = {
    firebaseToken: string,
}

export type PasskeyAppendFinish = {
    signedChallenge: string,
} & WithFirebaseToken;

export type PasskeyDelete = {
    passkeyId: string,
} & WithFirebaseToken;

export class RequestMetadata {
    userAgent: string;
    remoteAddress: string;

    constructor(userAgent: string, remoteAddress: string) {
        this.userAgent = userAgent;
        this.remoteAddress = remoteAddress;
    }

    toRawAxiosRequestConfig(): RawAxiosRequestConfig {
        return {
            headers: {
                "user-agent": this.userAgent,
                "x-forwarded-for": this.remoteAddress,
            }
        }
    }

    toClientInfo() {
        return {
            remoteAddress: this.remoteAddress,
            userAgent: this.userAgent,
        };
    }
}

enum ErrorCodes {
    NO_PASSKEY_AVAILABLE = "NO_PASSKEY_AVAILABLE",
    USER_ALREADY_EXISTS = "USER_ALREADY_EXISTS",
    UNKNOWN_USER = "UNKNOWN_USER",
    UNKNOWN_ERROR ="UNKNOWN_ERROR",
}

const parseRequestMetadata = (callableRequest: CallableRequest): RequestMetadata => {
    const userAgent = callableRequest.rawRequest.headers["user-agent"] as string;
    const remoteAddress = callableRequest.rawRequest.headers["x-forwarded-for"] as string;

    return new RequestMetadata(userAgent, remoteAddress);
}

export const passkeyRegisterStart = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyRegisterStart;
    const metadata = parseRequestMetadata(callableRequest);
    return await corbadoService.passkeyRegisterStart(params.username, params.fullName, metadata);
});

export const passkeyRegisterFinish = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyRegisterFinish;
    const metadata = parseRequestMetadata(callableRequest);
    const corbadoUser = await corbadoService.passkeyRegisterFinish(params.signedChallenge, metadata)

    return await auth.createCustomToken(corbadoUser.name, {
        corbadoUserId: corbadoUser.sub,
        email: corbadoUser.name,
    });
});

export const passkeyLoginStart = onCall(async (callableRequest: CallableRequest) => {
    try {
        const params = callableRequest.data as PasskeyLoginStart;
        const metadata = parseRequestMetadata(callableRequest);
        logger.info(`Input: ${JSON.stringify(metadata)}`);

        return await corbadoService.passkeyLoginStart(params.username, metadata);
    } catch (e) {
        if (e instanceof UnknownUserError) {
            throw new HttpsError("unknown", ErrorCodes.UNKNOWN_USER);
        }

        if (e instanceof NoPasskeyAvailableError) {
            throw new HttpsError("unknown", ErrorCodes.NO_PASSKEY_AVAILABLE);
        }

        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }
});

export const passkeyLoginFinish = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyLoginFinish;
    const metadata = parseRequestMetadata(callableRequest);
    const corbadoUser = await corbadoService.passkeyLoginFinish(params.signedChallenge, metadata)

    return await auth.createCustomToken(corbadoUser.name, {
        corbadoUserId: corbadoUser.sub,
        email: corbadoUser.name,
    });
});

export const passkeyAppendStart = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as WithFirebaseToken
    const metadata = parseRequestMetadata(callableRequest);

    let validatedToken: DecodedIdToken;
    try {
        validatedToken = await auth.verifyIdToken(params.firebaseToken);
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }

    if (!validatedToken.email) {
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR, "No email in token");
    }

    return await corbadoService.passkeyAppendStart(validatedToken.email, metadata);
});

export const passkeyAppendFinish = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyAppendFinish;
    const metadata = parseRequestMetadata(callableRequest);
    try {
        const verifiedToken = await auth.verifyIdToken(params.firebaseToken);
        const corbadoUserId = await corbadoService.passkeyAppendFinish(params.signedChallenge, metadata);

        // we now must update the firebase user to include the corabdoUserId
        await auth.setCustomUserClaims(verifiedToken.uid, {
            corbadoUserId: corbadoUserId
        });

        const user = await auth.getUser(verifiedToken.uid);
        logger.info(`User: ${JSON.stringify(user)}`);

        return;
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }
});

export const passkeyList = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as WithFirebaseToken;
    try {
        const validatedToken = await auth.verifyIdToken(params.firebaseToken);
        const res = await corbadoService.passkeyList(validatedToken.corbadoUserId);
        return JSON.stringify(res);
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }
});

export const passkeyDelete = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as PasskeyDelete;
    try {
        const validatedToken = await auth.verifyIdToken(params.firebaseToken);
        await corbadoService.passkeyDelete(validatedToken.corbadoUserId, params.passkeyId);
        return;
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }

});

export const userDelete = onCall(async (callableRequest: CallableRequest) => {
    const params = callableRequest.data as WithFirebaseToken;
    try {
        const validatedToken = await auth.verifyIdToken(params.firebaseToken);
        logger.info(`Input: ${JSON.stringify(validatedToken)}`);
        await corbadoService.userDelete(validatedToken.corbadoUserId);
        return;
    } catch (e) {
        logger.error(e);
        throw new HttpsError("unknown", ErrorCodes.UNKNOWN_ERROR);
    }
});