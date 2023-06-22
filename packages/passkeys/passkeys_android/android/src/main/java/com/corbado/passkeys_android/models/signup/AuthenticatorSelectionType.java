package com.corbado.passkeys_android.models.signup;

import org.json.JSONObject;

import java.util.HashMap;

public class AuthenticatorSelectionType {
    private final String authenticatorAttachment;
    private final boolean requireResidentKey;
    private final String residentKey;
    private final String userVerification;

    public AuthenticatorSelectionType(String authenticatorAttachment, boolean requireResidentKey, String residentKey, String userVerification) {
        this.authenticatorAttachment = authenticatorAttachment;
        this.requireResidentKey = requireResidentKey;
        this.residentKey = residentKey;
        this.userVerification = userVerification;
    }

    public JSONObject toJSON() {
        HashMap<String, String> map = new HashMap<>();
        if (authenticatorAttachment != null)
            map.put("authenticatorAttachment", authenticatorAttachment);
        map.put("requireResidentKey", String.valueOf(requireResidentKey));
        if (residentKey != null) map.put("residentKey", residentKey);
        if (userVerification != null) map.put("userVerification", userVerification);
        return new JSONObject(map);
    }
}
