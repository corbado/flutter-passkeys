package com.corbado.passkeys_android;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CreatePublicKeyCredentialRequest;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetPublicKeyCredentialOption;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.GetCredentialException;

import com.google.android.gms.fido.Fido;
import com.google.android.gms.fido.fido2.Fido2ApiClient;
import com.google.android.gms.tasks.Task;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MessageHandler implements Messages.PasskeysApi {

    private static final String TAG = "MessageHandler";

    FlutterPasskeysPlugin plugin;

    public MessageHandler(FlutterPasskeysPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public void canAuthenticate(@NonNull Messages.Result<Boolean> result) {

        Activity activity = plugin.requireActivity();

        Fido2ApiClient fido2ApiClient = Fido.getFido2ApiClient(activity.getApplicationContext());

        Task<Boolean> isAvailable = fido2ApiClient.isUserVerifyingPlatformAuthenticatorAvailable();
        isAvailable.addOnSuccessListener(result::success);
        isAvailable.addOnFailureListener(result::error);
    }

    //{
    //  "rp": {
    //    "name": "Widget",
    //    "id": "pro-4458631100550777696.auth.corbado.com"
    //  },
    //  "user": {
    //    "name": "ugabaer2@gmail.com",
    //    "icon": "https://pics.com/avatar.png",
    //    "displayName": "ugabaer2@gmail.com",
    //    "id": "dXNyLTE0NTA4MjcwNTc5NzI1Mzc5Njc3"
    //  },
    //  "challenge": "p8Aa-Va6z4NhxoFFGs_crdmplO25bkt4QzMEYqHGeXA",
    //  "pubKeyCredParams": [
    //    {
    //      "type": "public-key",
    //      "alg": -7
    //    },
    //    {
    //      "type": "public-key",
    //      "alg": -257
    //    }
    //  ],
    //  "timeout": 300000,
    //  "authenticatorSelection": {
    //    "authenticatorAttachment": "platform",
    //    "requireResidentKey": false,
    //    "residentKey": "required",
    //    "userVerification": "required"
    //  },
    //  "attestation": "none"
    //}
    @Override
    public void register(@NonNull String challenge, @NonNull Messages.RelyingParty relyingParty,
                         @NonNull Messages.User user, @NonNull Messages.Result<Messages.RegisterResponse> result) {
        try {
            JSONObject rpObj = new JSONObject();
            rpObj.put("name", relyingParty.getName());
            rpObj.put("id", relyingParty.getId());

            JSONObject userObj = new JSONObject();
            userObj.put("id", user.getId());
            userObj.put("name", user.getName());
            userObj.put("displayName", user.getDisplayName());

            JSONArray pubKeyCredParams = new JSONArray();
            pubKeyCredParams.put(new JSONObject().put("type", "public-key").put("alg", -7));
            pubKeyCredParams.put(new JSONObject().put("type", "public-key").put("alg", -257));
/*
            JSONObject authenticatorSelection = new JSONObject();
            authenticatorSelection.put("authenticatorAttachment", "platform");
            authenticatorSelection.put("requireResidentKey", false);
            authenticatorSelection.put("residentKey", "required");
            authenticatorSelection.put("userVerification", "required");
*/
            JSONObject optionsObj = new JSONObject();
            optionsObj.put("challenge", challenge);
            optionsObj.put("rp", rpObj);
            optionsObj.put("user", userObj);
            optionsObj.put("pubKeyCredParams", pubKeyCredParams);

            String options = optionsObj.toString();

            Log.e(TAG, "options: " + options);
            Activity activity = plugin.requireActivity();

            CredentialManager credentialManager = CredentialManager.create(activity);
            CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest =
                    new CreatePublicKeyCredentialRequest(
                            options, null, false);

            Log.e(TAG, "pubkey options: " + createPublicKeyCredentialRequest.getRequestJson());

            credentialManager.createCredentialAsync(
                    activity,
                    createPublicKeyCredentialRequest,
                    null,
                    Runnable::run,
                    new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {

                        @Override
                        public void onResult(CreateCredentialResponse res) {
                            String resp = res.getData().getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                            try {
                                JSONObject json = new JSONObject(resp);
                                JSONObject response = json.getJSONObject("response");
                                result.success(new Messages.RegisterResponse.Builder()
                                        .setId(json.getString("id"))
                                        .setRawId(json.getString("rawId"))
                                        .setClientDataJSON(response.getString("clientDataJSON"))
                                        .setAttestationObject(response.getString("attestationObject"))
                                        .build());
                            } catch (JSONException e) {
                                Log.e(TAG, "Error parsing response: " + resp, e);
                                result.error(e);
                            }
                        }

                        @Override
                        public void onError(CreateCredentialException e) {
                            result.error(e);
                        }
                    }
            );
        } catch (JSONException e) {
            Log.e(TAG, "Error parsing rp: " + relyingParty, e);
            result.error(e);
        }
    }

    @Override
    public void authenticate(@NonNull String relyingPartyId, @NonNull String challenge, @NonNull Messages.Result<Messages.AuthenticateResponse> result) {
        JSONObject optionsObj = new JSONObject();
        try {
            optionsObj.put("challenge", challenge);
            optionsObj.put("rpId", relyingPartyId);

        String options = optionsObj.toString();
        Log.e(TAG, "options: " + options);
        Activity activity = plugin.requireActivity();

        CredentialManager credentialManager = CredentialManager.create(activity);
        GetPublicKeyCredentialOption getPublicKeyCredentialOption =
                new GetPublicKeyCredentialOption(options);

        GetCredentialRequest getCredRequest = new GetCredentialRequest.Builder()
                .addCredentialOption(getPublicKeyCredentialOption)
                .build();

        credentialManager.getCredentialAsync(
                activity,
                getCredRequest,
                null,
                Runnable::run,
                new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                    @Override
                    public void onResult(GetCredentialResponse res) {
                        Credential credential = res.getCredential();
                        if (credential instanceof PublicKeyCredential) {
                            String responseJson = ((PublicKeyCredential) credential)
                                    .getAuthenticationResponseJson();
                            try {
                                JSONObject json = new JSONObject(responseJson);
                                JSONObject response = json.getJSONObject("response");
                                result.success(new Messages.AuthenticateResponse.Builder()
                                        .setId(json.getString("id"))
                                        .setRawId(json.getString("rawId"))
                                        .setClientDataJSON(response.getString("clientDataJSON"))
                                        .setAuthenticatorData(response.getString("authenticatorData"))
                                        .setSignature(response.getString("signature"))
                                        .build());
                            } catch (JSONException e) {
                                Log.e(TAG, "Error parsing response: " + responseJson, e);
                                result.error(e);
                            }
                        } else {
                            result.error(new Exception("Credential is of type " + credential.getClass().getName()
                                    + ", but should be of type PublicKeyCredential"));
                        }
                    }

                    @Override
                    public void onError(GetCredentialException e) {
                        result.error(e);
                    }
                }
        );
        } catch (JSONException e) {
            result.error(e);
        }
    }

    @Override
    public void getSignatureFingerprint(@NonNull Messages.Result<String> result) {
        Activity activity = plugin.requireActivity();
        if (activity == null) throw new IllegalStateException("Activity not found");
        Signature[] signs;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                signs = activity.getPackageManager().getPackageInfo(activity.getPackageName(),
                        PackageManager.GET_SIGNING_CERTIFICATES).signingInfo.getApkContentsSigners();
            } else {
                signs = activity.getPackageManager().getPackageInfo(activity.getPackageName(),
                        PackageManager.GET_SIGNATURES).signatures;
            }
            if (signs.length == 0) {
                result.error(new Exception("No signatures found"));
            }

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(signs[0].toByteArray());
            byte[] digest = md.digest();
            StringBuilder toRet = new StringBuilder();
            for (int x = 0; x < digest.length; x++) {
                toRet.append(String.format("%02x", digest[x]).toUpperCase());
                if (x < digest.length - 1) {
                    toRet.append(":");
                }
            }

            result.success(toRet.toString());
        } catch (PackageManager.NameNotFoundException | NoSuchAlgorithmException e) {
            result.error(e);
        }
    }
}
