package com.corbado.passkeys_android;

import android.app.Activity;
import android.os.CancellationSignal;
import android.util.Base64;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.credentials.CreateCredentialResponse;
import androidx.credentials.CreatePublicKeyCredentialRequest;
import androidx.credentials.Credential;
import androidx.credentials.CredentialManager;
import androidx.credentials.CredentialManagerCallback;
import androidx.credentials.GetCredentialRequest;
import androidx.credentials.GetCredentialResponse;
import androidx.credentials.GetPublicKeyCredentialOption;
import androidx.credentials.PublicKeyCredential;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialNoCreateOptionException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;

import com.corbado.passkeys_android.models.login.AllowCredentialType;
import com.corbado.passkeys_android.models.login.GetCredentialOptions;
import com.corbado.passkeys_android.models.signup.AuthenticatorSelectionType;
import com.corbado.passkeys_android.models.signup.CreateCredentialOptions;
import com.corbado.passkeys_android.models.signup.ExcludeCredentialType;
import com.corbado.passkeys_android.models.signup.PubKeyCredParamType;
import com.corbado.passkeys_android.models.signup.RelyingPartyType;
import com.corbado.passkeys_android.models.signup.UserType;
import com.google.android.gms.fido.Fido;
import com.google.android.gms.fido.fido2.Fido2ApiClient;
import com.google.android.gms.tasks.Task;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

public class MessageHandler implements Messages.PasskeysApi {

    private static final String TAG = "MessageHandler";
    private static final String SYNC_ACCOUNT_NOT_AVAILABLE_ERROR = "Sync account could not be accessed. If you are running on an emulator, please restart that device (select 'Could boot now').";
    private static final String MISSING_GOOGLE_SIGN_IN_ERROR = "Please sign in with a Google account first to create a new passkey.";
    private static final String EXCLUDE_CREDENTIALS_MATCH_ERROR = "You can not create a credential on this device because one of the excluded credentials exists on the local device.";
    private static final String MISSING_CREATION_OPTIONS = "Please make sure you enable a passwords or passkeys provider in your device settings.";
    private static final String TIMEOUT_ERROR = "Passkey operation timed out, please try again";

    private final FlutterPasskeysPlugin plugin;

    private CancellationSignal currentCancellationSignal;

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

    @Override
    public void hasPasskeySupport(@NonNull Messages.Result<Boolean> result) {
        // Passkeys are supported on Android API 28 (Android 9.0) and above
        boolean hasSupport = android.os.Build.VERSION.SDK_INT >= 28;
        result.success(hasSupport);
    }

    @Override
    public void register(
            @NonNull String challenge,
            @NonNull Messages.RelyingParty relyingParty,
            @NonNull Messages.User user,
            @Nullable Messages.AuthenticatorSelection authenticatorSelection,
            @Nullable List<Messages.PubKeyCredParam> pubKeyCredParams,
            @Nullable Long timeout,
            @Nullable String attestation,
            @NonNull List<Messages.ExcludeCredential> excludeCredentials,
            @Nullable String salt,
            @NonNull Messages.Result<Messages.RegisterResponse> result
            ) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("android-passkey-unsupported",
                    "Passkeys are only supported on Android API 28 and above.", null));
            return;
        }

        UserType userType = new UserType(user.getName(), user.getDisplayName(), user.getId(), user.getIcon());
        RelyingPartyType relyingPartyType = new RelyingPartyType(relyingParty.getId(), relyingParty.getName());
        AuthenticatorSelectionType authSelectionType = null;
        if (authenticatorSelection != null) {
            authSelectionType = new AuthenticatorSelectionType(
                    authenticatorSelection.getAuthenticatorAttachment(), authenticatorSelection.getRequireResidentKey(),
                    authenticatorSelection.getResidentKey(), authenticatorSelection.getUserVerification());
        }
        List<PubKeyCredParamType> pubKeyCredParamsType = new ArrayList<>();
        if (pubKeyCredParams != null) {
            pubKeyCredParamsType = pubKeyCredParams.stream().map(p -> new PubKeyCredParamType(p.getType(), p.getAlg()))
                    .collect(Collectors.toList());
        }
        final List<ExcludeCredentialType> excludeCredentialsType = excludeCredentials.stream()
                .map(c -> new ExcludeCredentialType(c.getType(), c.getId())).collect(Collectors.toList());

        CreateCredentialOptions createCredentialOptions = new CreateCredentialOptions(
                challenge,
                relyingPartyType,
                userType,
                pubKeyCredParamsType,
                timeout,
                authSelectionType,
                attestation,
                excludeCredentialsType);

        try {
            JSONObject optionsJson = createCredentialOptions.toJSON();

            // PRF extension if salt provided
            if (salt != null && !salt.isEmpty()) {
                String saltBase64Url = hexToBase64Url(salt);
                JSONObject extensions = optionsJson.optJSONObject("extensions");
                if (extensions == null) extensions = new JSONObject();

                JSONObject prf = new JSONObject();
                JSONObject eval = new JSONObject();
                eval.put("first", saltBase64Url);
                prf.put("eval", eval);

                extensions.put("prf", prf);
                optionsJson.put("extensions", extensions);
            }
            String options = optionsJson.toString();
            Log.i("Passkeys", "options = " + options);

            Activity activity = plugin.requireActivity();
            CredentialManager credentialManager = CredentialManager.create(activity);
            CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest = new CreatePublicKeyCredentialRequest(
                    options);
            currentCancellationSignal = new CancellationSignal();
            credentialManager.createCredentialAsync(activity, createPublicKeyCredentialRequest,
                    currentCancellationSignal, Runnable::run,
                    new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {

                        @Override
                        public void onResult(CreateCredentialResponse res) {
                            String resp = res.getData()
                                    .getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                            try {
                                JSONObject json = new JSONObject(resp);
                                JSONObject response = json.getJSONObject("response");

                                // Note: The "transports" field can be optional in the authenticator response.
                                // While the WebAuthn spec
                                // (https://www.w3.org/TR/webauthn-2/#dom-authenticatorattestationresponse-gettransports)
                                // does not strictly specify that "transports" must be omitted, we have observed
                                // several cases
                                // where authenticators do not return it.
                                List<String> typedTransports = new ArrayList<>();
                                JSONArray transports = response.optJSONArray("transports");
                                if (transports != null) {
                                    for (int i = 0; i < transports.length(); i++) {
                                        typedTransports.add(transports.getString(i));
                                    }
                                } else {
                                    typedTransports.add("");
                                }

                                JSONObject ext = json.optJSONObject("clientExtensionResults");
                                Map<String, Object> extMap = null;

                                if (ext != null) {
                                    extMap = new HashMap<>();

                                    JSONObject prf = ext.optJSONObject("prf");
                                    if (prf != null) {
                                        JSONObject results = prf.optJSONObject("results");
                                        if (results != null) {
                                            String first = results.optString("first", "");
                                            Map<String, Object> resultsMap = new HashMap<>();
                                            resultsMap.put("first", first);
                                            Map<String, Object> prfMap = new HashMap<>();
                                            prfMap.put("results", resultsMap);
                                            extMap.put("prf", prfMap);
                                        }
                                    }
                                }
                                result.success(new Messages.RegisterResponse.Builder()
                                        .setId(json.getString("id"))
                                        .setRawId(json.getString("rawId"))
                                        .setClientDataJSON(response.getString("clientDataJSON"))
                                        .setAttestationObject(response.getString("attestationObject"))
                                        .setTransports(typedTransports)
                                        .setClientExtensionResults(extMap)
                                        .build());
                            } catch (JSONException e) {
                                Log.e(TAG, "Error parsing response: " + resp, e);
                                result.error(e);
                            }
                        }

                        @Override
                        public void onError(CreateCredentialException e) {
                            Exception platformException = e;
                            if (Objects.equals(e.getMessage(), "Unable to create key during registration")) {
                                // currently, Android throws this error when users skip the fingerPrint
                                // animation => we interpret this as a cancellation for now
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            } else if (e instanceof CreateCredentialCancellationException) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            } else if (e instanceof CreatePublicKeyCredentialDomException) {
                                if (Objects.equals(e.getMessage(), "User is unable to create passkeys.")) {
                                    platformException = new Messages.FlutterError("android-missing-google-sign-in",
                                            e.getMessage(), MISSING_GOOGLE_SIGN_IN_ERROR);
                                } else if (Objects.equals(e.getMessage(), "Unable to get sync account.")) {
                                    platformException = new Messages.FlutterError("android-sync-account-not-available",
                                            e.getMessage(), SYNC_ACCOUNT_NOT_AVAILABLE_ERROR);
                                } else if (Objects.equals(e.getMessage(),
                                        "One of the excluded credentials exists on the local device")) {
                                    platformException = new Messages.FlutterError("exclude-credentials-match",
                                            e.getMessage(), EXCLUDE_CREDENTIALS_MATCH_ERROR);
                                } else if (Objects.equals(e.getMessage(), "[15] Flow has timed out.")) {
                                    platformException = new Messages.FlutterError("android-timeout", e.getMessage(),
                                            TIMEOUT_ERROR);
                                } else {
                                    platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                            e.getMessage(), e.getErrorMessage());
                                }
                            } else if (e instanceof CreateCredentialNoCreateOptionException) {
                                platformException = new Messages.FlutterError("android-no-create-option",
                                        e.getMessage(), MISSING_CREATION_OPTIONS);
                            } else {
                                platformException = new Messages.FlutterError("android-unhandled" + e.getType(),
                                        e.getMessage(), e.getErrorMessage());
                            }

                            result.error(platformException);
                        }
                    });
        } catch (JSONException e) {
            Log.e(TAG, "Error creating JSON", e);
            result.error(e);
        }
    }

    @Override
    public void authenticate(@NonNull String relyingPartyId, @NonNull String challenge, @Nullable Long timeout,
            @Nullable String userVerification, @Nullable List<Messages.AllowCredential> allowCredentials,
            @Nullable Boolean preferImmediatelyAvailableCredentials,
            @Nullable String salt,
            @NonNull Messages.Result<Messages.AuthenticateResponse> result) {
        if (android.os.Build.VERSION.SDK_INT < 28) {
            result.error(new Messages.FlutterError("android-passkey-unsupported",
                    "Passkeys are only supported on Android API 28 and above.", null));
            return;
        }

        List<AllowCredentialType> allowCredentialsType = new ArrayList<>();
        if (allowCredentials != null) {
            allowCredentialsType = allowCredentials.stream()
                    .map(c -> new AllowCredentialType(c.getType(), c.getId(), c.getTransports()))
                    .collect(Collectors.toList());
        }
        GetCredentialOptions getCredentialOptions = new GetCredentialOptions(challenge, timeout, relyingPartyId,
                allowCredentialsType, userVerification);
        try {
            JSONObject optionsJson = getCredentialOptions.toJSON();
            // PRF extension if salt provided
            if (salt != null && !salt.isEmpty()) {
                String saltBase64Url = hexToBase64Url(salt);
                Log.i("Passkey", "salt provided auth" + saltBase64Url);
                JSONObject extensions = optionsJson.optJSONObject("extensions");
                if (extensions == null) extensions = new JSONObject();

                JSONObject prf = new JSONObject();
                JSONObject eval = new JSONObject();
                eval.put("first", saltBase64Url);
                prf.put("eval", eval);

                extensions.put("prf", prf);
                optionsJson.put("extensions", extensions);
            }
            String options = optionsJson.toString();
            Log.i("Passkeys", "options = " + options);
            Activity activity = plugin.requireActivity();

            CredentialManager credentialManager = CredentialManager.create(activity);

            GetPublicKeyCredentialOption getPublicKeyCredentialOption = new GetPublicKeyCredentialOption(options);

            GetCredentialRequest.Builder builder = new GetCredentialRequest.Builder()
                    .addCredentialOption(getPublicKeyCredentialOption);

            if (preferImmediatelyAvailableCredentials != null) {
                builder.setPreferImmediatelyAvailableCredentials(preferImmediatelyAvailableCredentials);
            }

            GetCredentialRequest getCredRequest = builder.build();
            currentCancellationSignal = new CancellationSignal();

            credentialManager.getCredentialAsync(activity, getCredRequest, currentCancellationSignal, Runnable::run,
                    new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                        @Override
                        public void onResult(GetCredentialResponse res) {
                            Credential credential = res.getCredential();
                            if (credential instanceof PublicKeyCredential) {
                                String responseJson = ((PublicKeyCredential) credential)
                                        .getAuthenticationResponseJson();
                                try {
                                    final JSONObject json = new JSONObject(responseJson);
                                    final JSONObject response = json.getJSONObject("response");

                                    final String id = json.getString("id");
                                    final String rawId = json.getString("rawId");

                                    final String clientDataJSON = response.getString("clientDataJSON");
                                    // userHandle is optional because some authenticators may return it as a null
                                    // (exp: cross-platform QR between two android devices)
                                    final String userHandle = response.optString("userHandle");
                                    final String signature = response.getString("signature");
                                    final String authenticatorData = response.getString("authenticatorData");

                                    JSONObject ext = json.optJSONObject("clientExtensionResults");
                                    Map<String, Object> extMap = null;

                                    if (ext != null) {
                                        extMap = new HashMap<>();

                                        JSONObject prf = ext.optJSONObject("prf");
                                        if (prf != null) {
                                            JSONObject results = prf.optJSONObject("results");
                                            if (results != null) {
                                                String first = results.optString("first", "");
                                                Map<String, Object> resultsMap = new HashMap<>();
                                                resultsMap.put("first", first);
                                                Map<String, Object> prfMap = new HashMap<>();
                                                prfMap.put("results", resultsMap);
                                                extMap.put("prf", prfMap);
                                            }
                                        }
                                    }
                                    final Messages.AuthenticateResponse msg = new Messages.AuthenticateResponse.Builder()
                                            .setId(id).setRawId(rawId).setClientDataJSON(clientDataJSON)
                                            .setAuthenticatorData(authenticatorData)
                                            .setSignature(signature)
                                            .setClientExtensionResults(extMap)
                                            .setUserHandle(userHandle).build();

                                    result.success(msg);
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
                            Exception platformException = e;
                            Log.e(TAG, "onError called", e);

                            // currently, Android throws this error when users skip the fingerPrint
                            // animation => we interpret this as a cancellation for now
                            if (Objects.equals(e.getMessage(),
                                    "None of the allowed credentials can be authenticated")) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            } else if (e instanceof GetCredentialCancellationException) {
                                platformException = new Messages.FlutterError("cancelled", e.getMessage(), "");
                            } else if (e instanceof NoCredentialException) {
                                platformException = new Messages.FlutterError("android-no-credential", e.getMessage(),
                                        "");
                            } else if (e instanceof GetPublicKeyCredentialDomException) {
                                if (Objects.equals(e.getMessage(), "Failed to decrypt credential.")) {
                                    platformException = new Messages.FlutterError("android-sync-account-not-available",
                                            e.getMessage(), SYNC_ACCOUNT_NOT_AVAILABLE_ERROR);
                                } else if (Objects.equals(e.getMessage(), "[15] Flow has timed out.")) {
                                    platformException = new Messages.FlutterError("android-timeout", e.getMessage(),
                                            TIMEOUT_ERROR);
                                } else {
                                    platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                            e.getMessage(), e.getErrorMessage());
                                }
                            } else {
                                platformException = new Messages.FlutterError("android-unhandled: " + e.getType(),
                                        e.getMessage(), e.getErrorMessage());
                            }

                            result.error(platformException);
                        }
                    });
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void cancelCurrentAuthenticatorOperation(@NonNull Messages.Result<Void> result) {
        if (currentCancellationSignal != null) {
            currentCancellationSignal.cancel();
            currentCancellationSignal = null;
        }

        result.success(null);
    }

    ///  `hexToBase64Url`
    public static String hexToBase64Url(String hex) {
        int len = hex.length();
        byte[] bytes = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            bytes[i / 2] = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
        }
        return Base64.encodeToString(
                bytes,
                Base64.URL_SAFE | Base64.NO_PADDING | Base64.NO_WRAP
        );
    }
}
