import {RawAxiosRequestConfig} from "axios";

export type PasskeyRegisterStart = {
    username: string,
} & WithUserAgent;

export type PasskeyRegisterFinish = {
    signedChallenge: string,
} & WithUserAgent;

export type PasskeyLoginStart = {
    username: string,
} & WithUserAgent;

export type PasskeyLoginFinish = {
    signedChallenge: string,
} & WithUserAgent;

export type EmailOTPLoginStart = {
    username: string,
}

export type EmailOTPLoginFinish = {
    emailCodeID: string,
    code: string,
}

export type WithFirebaseToken = {
    firebaseToken: string,
}

export type WithUserAgent = {
    userAgent: string,
}

export type PasskeyAppendFinish = {
    signedChallenge: string,
} & WithFirebaseToken & WithUserAgent;

export type PasskeyDelete = {
    passkeyId: string,
} & WithFirebaseToken & WithUserAgent;

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
