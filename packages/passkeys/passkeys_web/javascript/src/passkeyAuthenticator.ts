// Import the basic request/response conversions and the base64url helpers
// directly from their modules (rather than the "@github/webauthn-json/extended"
// aggregate) so the bundle does not pull in the unused extended schema.
import {
    createRequestFromJSON,
    createResponseToJSON,
    getRequestFromJSON,
    getResponseToJSON,
} from "@github/webauthn-json/src/webauthn-json/basic/api";
import {
    base64urlToBuffer,
    bufferToBase64url,
} from "@github/webauthn-json/src/webauthn-json/base64url";
import {
    CredentialCreationOptionsJSON,
    CredentialRequestOptionsJSON,
    PublicKeyCredentialWithAssertionJSON,
    PublicKeyCredentialWithAttestationJSON,
} from "@github/webauthn-json";

const ABORTED_BY_USER = 'operation aborted by user.';

export class PasskeyAuthenticator {
    #abortController: AbortController | undefined;

    constructor() {
    }

    async register(params: string): Promise<string> {
        try {
            const typedParams: CredentialCreationOptionsJSON = JSON.parse(params);
            const request = createRequestFromJSON(typedParams);
            applyPrfInput(request.publicKey, (typedParams.publicKey as any)?.extensions);

            const credential = await navigator.credentials.create(request) as PublicKeyCredential;
            const out: PublicKeyCredentialWithAttestationJSON = createResponseToJSON(credential);

            return JSON.stringify(withPrfResults(out, credential));
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
            const request = getRequestFromJSON(typedParams);
            applyPrfInput(request.publicKey, (typedParams.publicKey as any)?.extensions);

            const credential = await navigator.credentials.get(request) as PublicKeyCredential;
            const out: PublicKeyCredentialWithAssertionJSON = getResponseToJSON(credential);

            return JSON.stringify(withPrfResults(out, credential));
        } catch (e) {
            let error: PlatformError;
            if (e instanceof DOMException) {
                error = PlatformError.fromDOMException(e)
            } else if (e instanceof String) {
                error = PlatformError.unknownError(e.toString())
            } else if (e === ABORTED_BY_USER) {
                error = PlatformError.suppressedError(e);
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

// The @github/webauthn-json schema does not know about the PRF extension, so
// it drops the salts on the way in and the results on the way out. We convert
// those base64url values ourselves and splice them back in.

function applyPrfInput(publicKey: any, extensions: any): void {
    const evalInput = extensions?.prf?.eval;
    if (!evalInput) {
        return;
    }

    const prf: { eval: { first: ArrayBuffer; second?: ArrayBuffer } } = {
        eval: {first: base64urlToBuffer(evalInput.first)},
    };
    if (evalInput.second) {
        prf.eval.second = base64urlToBuffer(evalInput.second);
    }

    publicKey.extensions = {...(publicKey.extensions || {}), prf};
}

function withPrfResults<T extends { clientExtensionResults?: any }>(
    out: T,
    credential: PublicKeyCredential,
): T {
    const prf = (credential.getClientExtensionResults() as any)?.prf;
    if (!prf) {
        return out;
    }

    const prfJson: { enabled?: boolean; results?: { first: string; second?: string } } = {};
    if (typeof prf.enabled === 'boolean') {
        prfJson.enabled = prf.enabled;
    }
    if (prf.results?.first) {
        prfJson.results = {first: bufferToBase64url(prf.results.first)};
        if (prf.results.second) {
            prfJson.results.second = bufferToBase64url(prf.results.second);
        }
    }

    out.clientExtensionResults = {...(out.clientExtensionResults || {}), prf: prfJson};
    return out;
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

    static suppressedError(error: string): PlatformError {
        return new PlatformError('suppressed', error, '');
    }
}
