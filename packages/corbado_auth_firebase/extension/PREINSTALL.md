Use this extension to add passkey authentication to your Firebase project.
As a relying party server to extension makes use of [Corbado](https://app.corbado.com).

#### Use cases

The extension supports multiple use cases:
- Allow new users to sign up and login with passkeys.
- Allow existing users to append a passkey to their account and then log in to use it.

##### New users
When a new user signs up, you can allow him directly to create a passkey.
In that case, all you need to ask for is the user's email address and a passkey can be created right away.
Using this passkey the user can than log in to your app.
The private part of this passkey will reside on the user's device and the public part will be stored in your Corbado project.
Should a user lose access to his device or log in on a new device, he can use his email address to receive an email OTP code.

Depending on your security requirements you can also require users to first authenticate with another type of authentication (e.g. with their phone number) before they create a passkey.
To achieve this, first create the user account like you normally would using Firebase Authentication.
Then, when the user has successfully authenticated with the other type of authentication, you can append a passkey to the user's account (see the second use case for more details).

##### Existing users
When a user already has an account in your Firebase project, you can allow him to append a passkey to his account.
For the user this simplifies the login process because he can now login using his biometrics (e.g. fingerprint or face recognition) and he no longer has to remember a password.
To achieve this, the user first needs to log in to your application using his current authentication method (e.g. email and password).
Then, when the user has successfully logged in, you can append a passkey to the user's account.

#### Client SDK

Installing this extension in your Firebase project is only half the work.
It will create a number of Firebase functions in your project that are responsible for mediating between Firebase auth and Corbado.
To call those functions you should use our client SDK.
Currently, we only support [Flutter](https://pub.dev/packages/corbado_auth_firebase) for that.
Find more information including a code example in the [README](https://pub.dev/packages/corbado_auth_firebase).

#### Billing

This extension uses the following Firebase services which may have associated charges:
- Cloud Functions
- Authentication

This extension also uses the following third-party services:
- Corbado authentication ([pricing information](https://www.corbado.com/pricing))

You are responsible for any costs associated with your use of these services.


