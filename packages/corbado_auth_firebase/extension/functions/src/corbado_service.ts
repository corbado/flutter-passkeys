import {UsersApi} from "./api";


export class CorbadoService {
    #userApi: UsersApi;

    constructor(basePath: string) {
        this.#userApi = new UsersApi(undefined, basePath);
    }


    async passkeyRegisterStart(email: string, fullName: string): Promise<string> {
        const res = await this.#userApi.passKeyRegisterStart({username: email, fullName: fullName});

        return res.data.data.challenge;
    }

    async passkeyRegisterFinish(signedChallenge: string): Promise<string> {
        const res = await this.#userApi.passKeyRegisterFinish({signedChallenge: signedChallenge});
        const shortSession = res.data.data.shortSession;

        return shortSession!.value;
    }

    passkeyAppendStart() {

    }

    passkeyAppendFinish() {

    }

    passkeyLoginStart() {

    }

    passkeyLoginFinish() {

    }

    async userExists(): Promise<boolean> {
        return false;
    }
}