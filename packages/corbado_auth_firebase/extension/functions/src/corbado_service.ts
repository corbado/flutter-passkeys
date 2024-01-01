import {UsersApi} from "./frontendapi";
import {Configuration, PasskeysBiometricsApi, UserApi, WebAuthnCredentialItemRsp} from "./backendapi";
import axios, {AxiosError} from "axios";
import {CorbadoError} from "./exceptions";
import {RequestMetadata} from "./index";

type User = {
    email: string;
    name: string;
    orig: string;
    sub: string;
    exp: number;
}

export class CorbadoService {
    #usersApi: UsersApi;
    #userApi: UserApi;
    #passkeyApi: PasskeysBiometricsApi;

    constructor(basePath: string, projectId: string, apiSecret: string) {
        const axiosInstance = axios.create({
            timeout: 10000,
            withCredentials: true,
        });

        // We transform AxiosErrors into CorbadoErrors using axios interceptors.
        axiosInstance.interceptors.response.use(
            response => {
                return response;
            },
            (error: AxiosError) => {
                const e = CorbadoError.fromAxiosError(error);
                return Promise.reject(e);
            },
        );

        this.#usersApi = new UsersApi(undefined, basePath, axiosInstance);

        const backendApiConfig = new Configuration({
            username: projectId,
            password: apiSecret,
        });
        this.#userApi = new UserApi(backendApiConfig);
        this.#passkeyApi = new PasskeysBiometricsApi(backendApiConfig);
    }


    async passkeyRegisterStart(email: string, fullName: string, metadata: RequestMetadata): Promise<string> {
        try {
            const res = await this.#usersApi.passKeyRegisterStart({username: email, fullName: fullName}, metadata.toRawAxiosRequestConfig());

            return res.data.data.challenge;
        } catch (e) {
            console.log(e);
            throw e;
        }
    }

    async passkeyRegisterFinish(signedChallenge: string, metadata: RequestMetadata): Promise<User> {
        const res = await this.#usersApi.passKeyRegisterFinish({signedChallenge: signedChallenge}, metadata.toRawAxiosRequestConfig());
        const shortSession = res.data.data.shortSession;
        const splits = shortSession!.value.split('.');

        return JSON.parse(atob(splits[1]));
    }

    async passkeyAppendStart(username: string, metadata: RequestMetadata) {
        const res = await this.#passkeyApi.webAuthnRegisterStart({
            clientInfo: metadata.toClientInfo(),
            username: username,
            credentialStatus: "active",
        });

        return res.data.publicKeyCredentialCreationOptions;
    }

    async passkeyAppendFinish(signedChallenge: string, metadata: RequestMetadata): Promise<string> {
        const res = await this.#passkeyApi.webAuthnRegisterFinish({
            publicKeyCredential: signedChallenge,
            clientInfo: metadata.toClientInfo(),
        });

        return res.data.userID;
    }

    async passkeyLoginStart(email: string, metadata: RequestMetadata): Promise<string> {
        try {
            const res = await this.#usersApi.passKeyLoginStart({username: email}, metadata.toRawAxiosRequestConfig());

            return res.data.data.challenge;
        } catch (e) {
            // user has not been registered with Corbado yet => he must sign in with firebase
            // if (e instanceof UnknownUserError) {
            //     throw e;
            // }

            // user is known to Corbado, but he has not set up a passkey yet => he should sign in with email OTP
            // if (e instanceof NoPasskeyAvailableError) {
            //
            // }

            throw e;
        }
    }

    async passkeyLoginFinish(signedChallenge: string, metadata: RequestMetadata): Promise<User> {
        const res = await this.#usersApi.passKeyLoginFinish({signedChallenge: signedChallenge}, metadata.toRawAxiosRequestConfig());
        const shortSession = res.data.data.shortSession;
        const splits = shortSession!.value.split('.');

        return JSON.parse(atob(splits[1]));
    }

    async userDelete(userId: string): Promise<void> {
        await this.#userApi.userDelete(userId, {});
    }

    async passkeyList(userId: string): Promise<Array<WebAuthnCredentialItemRsp>> {
        const res = await this.#passkeyApi.webAuthnCredentialList(undefined, undefined, undefined, [`userID:eq:${userId}`]);
        return res.data.rows;
    }

    async passkeyDelete(userId: string, passkeyId: string): Promise<void> {
        await this.#passkeyApi.webAuthnCredentialDelete(userId, passkeyId, {});
    }

    async userExists(): Promise<boolean> {
        return false;
    }
}