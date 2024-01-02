import {RawAxiosRequestConfig} from "axios";

export type PasskeyRegisterStart = {
    username: string,
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
