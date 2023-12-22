/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import {CallableRequest, onCall, onRequest} from "firebase-functions/v2/https";
import * as logger from "firebase-functions/logger";
import {initializeApp} from "firebase-admin/app";
import {getAuth} from "firebase-admin/auth";
import axios, {AxiosError} from "axios";
import {CorbadoService} from "./corbado_service";


const app = initializeApp();
const auth = getAuth(app);

const CORBADO_PROJECT_ID = "pro-503401103218055321";
const baseUrl = `https://${CORBADO_PROJECT_ID}.frontendapi.corbado.io`;

const corbadoService = new CorbadoService(baseUrl);

/*
const headers = {
    "X-Corbado-ProjectID": projectID,
};

// Set up the request configuration
const config = {
    headers: headers,
};*/

const finishPasskeyLogin = async (request: string): Promise<boolean> => {
    const data = JSON.parse(request);

    try {
        const endpointUrl = `${baseUrl}/v1/users/passkey/login/finish`;
        const response = await axios.post(endpointUrl, data);
        logger.info(response.data.data);
        logger.info(response.data.error);

        return true;
    } catch (e) {
        if (e instanceof AxiosError) {
            logger.info(e.response?.data.error);
            logger.info(e.response?.status);
        }

        logger.error(e);

        return false;
    }

    return false;
};

export type PasskeyRegisterStart = {
    email: string,
    fullName: string,
}

export const test = onRequest(async (request, response) => {
    logger.info("Start request handling", request.body);

    const signInSuccess = await finishPasskeyLogin(request.body);
    logger.info(signInSuccess);

    const token = await auth.createCustomToken("martin");
    logger.info(token);

    response.send(token);
});

export const passkeyRegisterStart = onCall(async (callableRequest: CallableRequest) => {
    const params: PasskeyRegisterStart = callableRequest.data as PasskeyRegisterStart;
    logger.info("Input: ", params);
    const challenge = await corbadoService.passkeyRegisterStart(params.email, params.fullName);
    logger.info("Challenge", challenge);

    return challenge;
});

export const passkeyRegisterFinish = onRequest(async (request, response) => {
    logger.info("Input: ", request.body);
    const signedChallenge = request.body.signedChallenge;

    if (!signedChallenge) {
        return;
    }

    const shortSession = await corbadoService.passkeyRegisterFinish(signedChallenge)

    response.send(shortSession);
});

export const passkeyAssociateStart = onRequest(async (request, response) => {
    const token = request.headers.authorization;
    logger.info("Token", token);

    if (!token) {
        return;
    }

    // check if token is valid

    // is user already existing in Corabdo?

    // call /passkey/register/start or /passkey/append/start
});