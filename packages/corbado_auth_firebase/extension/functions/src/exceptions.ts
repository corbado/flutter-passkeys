import type { AxiosError } from 'axios';
import {ErrorRsp} from "./frontendapi";

export class CorbadoError extends Error {
    recoverable: boolean;

    constructor(message: string, recoverable: boolean) {
        super(message);
        this.name = 'CorbadoError';
        this.recoverable = recoverable;
    }

    static fromAxiosError(error: AxiosError): RecoverableError | NonRecoverableError {
        if (!error.response || !error.response.data) {
            return NonRecoverableError.unknown();
        }

        if (error.response.status >= 500 || error.response.status === 422) {
            try {
                const errorRespRaw = error.response.data as ErrorRsp;
                const message = errorRespRaw.error.details ?? error.message;
                return NonRecoverableError.server(
                    message,
                    errorRespRaw.requestData.requestID,
                    errorRespRaw.error.links.pop() ?? '',
                    errorRespRaw.error.type,
                    errorRespRaw.requestData.link,
                );
            } catch (e) {
                return NonRecoverableError.server(error.message, '', '', '');
            }
        }

        const errorRespRaw = error.response.data as ErrorRsp;
        const errorResp = errorRespRaw.error;
        switch (errorResp.type) {
            case 'validation_error': {
                if (!errorResp.validation?.length) {
                    return RecoverableError.unknown();
                }

                // we only care about the first error
                const firstError = errorResp.validation[0];

                if (firstError.field === 'username') {
                    switch (firstError.message) {
                        case 'user already exists':
                            return new UserAlreadyExistsError();
                        case 'cannot be blank':
                            return new InvalidEmailError();
                        case "user doesn't exist":
                            return new UnknownUserError();
                        case 'Invalid email address':
                        case 'Invalid / unreachable email address':
                            return new InvalidEmailError();
                    }
                }

                break;
            }
            case 'not_found':
                if (errorResp.details === "user doesn't exist") {
                    return new UnknownUserError();
                }

                if (errorResp.details === 'Used invalid credentials') {
                    return new InvalidPasskeyError();
                }

                if (errorResp.details === 'Email code not valid') {
                    return new InvalidOtpInputError();
                }
        }

        return NonRecoverableError.unknown();
    }

    static fromDOMException(e: DOMException): CorbadoError {
        switch (e.name) {
            case 'NotAllowedError':
            case 'AbortError':
                return new PasskeyChallengeCancelledError();
            case 'SecurityError':
                return new NonRecoverableError(
                    'server',
                    'The relying party ID is not a registrable domain suffix of, nor equal to the current domain.',
                    'https://docs.corbado.com',
                );
            default:
                return NonRecoverableError.unknown();
        }
    }

    static fromUnknownException(e: unknown): CorbadoError {
        return NonRecoverableError.unknown();
    }

    static illegalState(message: string, link: string): CorbadoError {
        return NonRecoverableError.client(message, link);
    }

    static noPasskeyAvailable(): CorbadoError {
        return new NoPasskeyAvailableError();
    }

    static unknown(): CorbadoError {
        return new UnknownError();
    }
}

/**
 * RecoverableError can be handled by either showing an error message to the user, by retrying the operation or by calling a fallback function.
 * Most errors fall into this category.
 */
export class RecoverableError extends CorbadoError {
    constructor(message: string) {
        super(message, true);
        this.name = 'RecoverableError';
    }

    static unknown() {
        return new RecoverableError('An unknown error occurred');
    }
}

/**
 * NonRecoverableErrors are only thrown when there is a big problem with the application (e.g. the application is misconfigured).
 * We can not recover from such an error.
 * Therefore, these errors are handled by showing a central error page.
 * Only a few errors should fall into this category.
 */
export class NonRecoverableError extends CorbadoError {
    readonly type: 'client' | 'server';
    readonly link: string;
    readonly details?: string;
    readonly detailedType?: string;
    readonly requestId?: string;

    constructor(
        type: 'client' | 'server',
        message: string,
        link: string,
        details?: string,
        detailedType?: string,
        requestId?: string,
    ) {
        super(message, false);
        this.name = 'Integration error';
        this.type = type;
        this.link = link;
        this.details = details;
        this.detailedType = detailedType;
        this.requestId = requestId;
    }

    static unknown() {
        return new NonRecoverableError('server', 'An unknown error occurred', 'https://docs.corbado.com');
    }

    static invalidConfig(message: string) {
        // TODO: add link to docs
        return NonRecoverableError.client(message, 'https://docs.corbado.com');
    }

    static server(message: string, requestId: string, link: string, detailedType: string, details?: string) {
        return new NonRecoverableError('server', message, link, details, detailedType, requestId);
    }

    static client(message: string, link: string) {
        return new NonRecoverableError('client', message, link);
    }
}

export class UserAlreadyExistsError extends RecoverableError {
    constructor() {
        super('User already exists');
        this.name = 'errors.userAlreadyExists';
    }
}

export class UnknownUserError extends RecoverableError {
    constructor() {
        super('User does not exist');
        this.name = 'errors.unknownUser';
    }
}

export class NoPasskeyAvailableError extends RecoverableError {
    constructor() {
        super('No passkey available');
        this.name = 'errors.noPasskeyAvailable';
    }
}

export class InvalidPasskeyError extends RecoverableError {
    constructor() {
        super('The provided passkey is no longer valid.');
        this.name = 'errors.invalidPasskey';
    }
}

export class PasskeyChallengeCancelledError extends RecoverableError {
    constructor() {
        super('Passkey challenge cancelled');
        this.name = 'errors.passkeyChallengeCancelled';
    }
}

export class InvalidFullnameError extends RecoverableError {
    constructor() {
        super('Invalid fullName');
        this.name = 'errors.invalidFullname';
    }
}

export class InvalidEmailError extends RecoverableError {
    constructor() {
        super('Invalid email');
        this.name = 'errors.invalidName';
    }
}

export class InvalidOtpInputError extends RecoverableError {
    constructor() {
        super('The provided OTP is no longer valid');
        this.name = 'errors.invalidOtp';
    }
}

export class UnknownError extends RecoverableError {
    constructor() {
        super('An unknown error occurred');
        this.name = 'errors.unknownError';
    }
}
