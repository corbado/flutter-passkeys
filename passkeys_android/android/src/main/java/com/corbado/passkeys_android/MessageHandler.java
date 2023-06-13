package com.corbado.passkeys_android;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;

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

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MessageHandler implements Messages.PasskeysApi {

    FlutterPasskeysPlugin plugin;

    public MessageHandler(FlutterPasskeysPlugin plugin) {
        this.plugin = plugin;
    }

    @Override
    public Boolean canAuthenticate() {
        return true;
    }

    @Override
    public void register(String options, Messages.Result<Messages.RegisterResponse> result) {

        Activity activity = plugin.getCustomActivity();
        if (activity == null) throw new IllegalStateException("Activity not found");

        CredentialManager credentialManager = CredentialManager.create(activity);
        CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest =
                new CreatePublicKeyCredentialRequest(
                        options, false);

        credentialManager.createCredentialAsync(
                createPublicKeyCredentialRequest,
                activity,
                null,
                Runnable::run,
                new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {

                    @Override
                    public void onResult(CreateCredentialResponse res) {
                        String resp = res.getData().getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");
                        result.success(new Messages.RegisterResponse.Builder().setResponseJSON(resp).build());
                    }

                    @Override
                    public void onError(CreateCredentialException e) {
                        result.error(e);
                    }
                }
        );
    }

    @Override
    public void authenticate(String options, Messages.Result<Messages.AuthenticateResponse> result) {

        Activity activity = plugin.getCustomActivity();
        if (activity == null) throw new IllegalStateException("Activity not found");

        CredentialManager credentialManager = CredentialManager.create(activity);
        GetPublicKeyCredentialOption getPublicKeyCredentialOption =
                new GetPublicKeyCredentialOption(options, false);

        GetCredentialRequest getCredRequest = new GetCredentialRequest.Builder()
                .addCredentialOption(getPublicKeyCredentialOption)
                .build();

        credentialManager.getCredentialAsync(
                getCredRequest,
                activity,
                null,
                Runnable::run,
                new CredentialManagerCallback<GetCredentialResponse, GetCredentialException>() {
                    @Override
                    public void onResult(GetCredentialResponse res) {
                        Credential credential = res.getCredential();
                        if (credential instanceof PublicKeyCredential) {
                            String responseJson = ((PublicKeyCredential) credential)
                                    .getAuthenticationResponseJson();
                            result.success(new Messages.AuthenticateResponse.Builder().setResponseJSON(responseJson).build());
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
    }

    @Override
    public void getSignatureFingerprint(@NonNull Messages.Result<String> result) {
        System.out.println("getSignatureFingerprint called for android  #########################################");
        Activity activity = plugin.getCustomActivity();
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
