import {PasskeyAuthenticator} from "./passkeyAuthenticator";

let passkeyAuthenticator = new PasskeyAuthenticator();

export async function isUserVerifyingPlatformAuthenticatorAvailable(): Promise<boolean|undefined> {
    if (!window.PublicKeyCredential) {
        return undefined;
    }

    try {
        return await window.PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable();
    } catch (e) {
        return undefined;
    }
}

export async function isConditionalMediationAvailable(): Promise<boolean|undefined> {
    if (!window.PublicKeyCredential) {
      return undefined;
    }

    try {
      return await window.PublicKeyCredential.isConditionalMediationAvailable();
    } catch (e) {
      return undefined;
    }
}

export function hasPasskeySupport(): boolean {
    return Boolean(window.PublicKeyCredential);
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