# General flow of passkeys

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/register_flow.png" style="width: 100%" alt="signup">

Like with traditional password-based authentication flows, a user has to sign up first, i.e. set up a passkey.
The flow is shown in the image above.

At first, the user will provide his email address to your app.
This email address will be sent to the relying party server.
You can implement that server yourself, or you can rely on prebuilt ones (e.g. provided by Corbado).
The relying party server's response will contain *publicKeyCredentialCreationOptions*.
It contains all information required by the user's device to set up a passkey.

Your app will now interact with your native device's OS (no worries, the actual work is abstracted by this Flutter package) to ask the user to set up a passkey.
All he has to do is to provide his biometrics once (e.g. via Face ID or Touch ID).
After this setup, a private key and a public key are created.
The private key is stored securely on the user's device.
The public key is sent to the relying party server.
For this to work, the app has to be associated with the relying party server.
This involves a bit of configuration in your app and on the relying party server (find more details below where we explain how to set up the example).
The relying party server will validate and store the private key.
Afterwards, it will respond with a success message (e.g. a JWT token).

From now on, the user can log into your app using this biometric information.
On each login, your app will ask the relying party server for a *challenge*.
The relying party server generates this challenge using the public key that was stored during the sign up flow.
Therefore, this task can only be solved by someone who has access to the private key.
To solve the challenge, the app asks once again the user for his biometrics (another call to your native device's OS).
After the user has provided his biometrics (e.g. by putting his finger on the fingerprint reader), the challenge is signed and the signed challenge is sent to the relying party server.
If the signed challenge is correct, the server will answer with a success message (e.g. a JWT token).