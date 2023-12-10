import {
    create,
    CredentialCreationOptionsJSON,
    CredentialRequestOptionsJSON, get,
    PublicKeyCredentialWithAssertionJSON
} from "@github/webauthn-json";
import {PublicKeyCredentialWithAttestationJSON} from "@github/webauthn-json/src/webauthn-json/basic/json";

const ABORTED_BY_USER = 'operation aborted by user.';

export class PasskeyAuthenticator {
    #abortController: AbortController | undefined;

    constructor() {
    }

    async register(params: string): Promise<string> {
        try {
            const typedParams: CredentialCreationOptionsJSON = JSON.parse(params);
            const out: PublicKeyCredentialWithAttestationJSON = await create(typedParams);

            return JSON.stringify(out);
        } catch (e) {
            let error: PlatformError;
            if (e instanceof DOMException) {
                error = PlatformError.fromDOMException(e)
            } else if (e instanceof String) {
                error = PlatformError.unknownError(e.toString())
            } else {
                error = PlatformError.unknownError('-')
            }

            const serializedError = JSON.stringify(error);
            console.log(serializedError);
            return Promise.reject(serializedError);
        }
    }

    async login(params: string): Promise<string> {
        try {
            this.#abortController = new AbortController();
            const typedParams: CredentialRequestOptionsJSON = JSON.parse(params);
            typedParams.signal = this.#abortController.signal;

            const out: PublicKeyCredentialWithAssertionJSON = await get(typedParams);

            return JSON.stringify(out);
        } catch (e) {
            let error: PlatformError;
            if (e instanceof DOMException) {
                error = PlatformError.fromDOMException(e)
            } else if (e instanceof String) {
                error = PlatformError.unknownError(e.toString())
            } else if (e === ABORTED_BY_USER) {
                error = PlatformError.cancelled();
            } else {
                error = PlatformError.unknownError('-')
            }

            const serializedError = JSON.stringify(error);
            return Promise.reject(serializedError);
        }
    }

    abortCurrentWebAuthnOperation() {
        if (!this.#abortController) {
            return;
        }

        this.#abortController.abort(ABORTED_BY_USER);
    }
}

class PlatformError {
    code: string;
    message: string;
    details: string;

    constructor(code: string, message: string, details: string) {
        this.code = code;
        this.message = message;
        this.details = details;
    }

    static fromDOMException(error: Error): PlatformError {
        switch (error.name) {
            case 'NotAllowedError':
                return PlatformError.cancelled();
            default:
                return new PlatformError(error.name, error.message, '');
        }
    }

    static unknownError(error: string): PlatformError {
        return new PlatformError('unknown', error, '');
    }

    static cancelled(): PlatformError {
        return new PlatformError('cancelled', 'operation was cancelled by the user.', '');
    }
}

