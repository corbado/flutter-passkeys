import {PasskeyAuthenticator} from "./passkeyAuthenticator";

let passkeyAuthenticator = new PasskeyAuthenticator();

export async function canAuthenticate(): Promise<boolean> {
    return await PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable();
}

export function init(): void {
     passkeyAuthenticator = new PasskeyAuthenticator();
}

export function register(params: string): Promise<string> {
    return passkeyAuthenticator.register(params);
}

export function login(params: string): Promise<string> {
    return passkeyAuthenticator.login(params);
}

export function cancelCurrentAuthenticatorOperation(): void {
    passkeyAuthenticator.abortCurrentWebAuthnOperation();
}