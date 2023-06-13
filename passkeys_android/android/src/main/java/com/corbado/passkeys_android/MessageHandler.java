package com.corbado.passkeys_android;

import android.app.Activity;

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

public class MessageHandler implements Messages.PasskeysApi {

    Activity activity;

    public MessageHandler(Activity activity) {
        this.activity = activity;
    }

    @Override
    public Boolean canAuthenticate() {
        return true;
    }

    @Override
    public void register(String options, Messages.Result<Messages.RegisterResponse> result) {
        CredentialManager credentialManager = CredentialManager.create(activity);
        CreatePublicKeyCredentialRequest createPublicKeyCredentialRequest =
                new CreatePublicKeyCredentialRequest(
                        options, false);

        if (activity == null) throw new IllegalStateException("Activity not found");

        credentialManager.createCredentialAsync(
                createPublicKeyCredentialRequest,
                activity,
                null,
                Runnable::run,
                new CredentialManagerCallback<CreateCredentialResponse, CreateCredentialException>() {

                    @Override
                    public void onResult(CreateCredentialResponse res) {
                        String resp = res.getData().getString("androidx.credentials.BUNDLE_KEY_REGISTRATION_RESPONSE_JSON");

                        //TODO: parse resp and return the right object
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
        CredentialManager credentialManager = CredentialManager.create(activity);
        GetPublicKeyCredentialOption getPublicKeyCredentialOption =
                new GetPublicKeyCredentialOption(options, false);

        GetCredentialRequest getCredRequest = new GetCredentialRequest.Builder()
                .addCredentialOption(getPublicKeyCredentialOption)
                .build();

        if (activity == null) throw new IllegalStateException("Activity not found");

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
}
