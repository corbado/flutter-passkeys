# iOS

1. [Create an iOS app and configure the example in XCode](#1-create-an-ios-app-and-configure-the-example-in-xcode)
2. [Set up Corbado project](#2-set-up-corbado-project)
3. [Set up an iOS app in Corbado](#3-set-up-an-ios-app-in-corbado)
4. [Configure your iOS project](#4-configure-your-ios-project)
5. [Start the example](#5-start-the-example)

## 1. Create an iOS app and configure the example in XCode

We need to establish trust between your iOS app and the relying party server.
Your app will be identified through your **Application Identifier Prefix** (e.g. `9RF9KY77B2`) and your **Bundle Identifier** (e.g. `com.corbado.passkeys`).
You need an Apple developer account to set up both.
If you haven't got one yet, set up a new account.

**Note:** When creating your Bundle Identifier, make sure that the "Associated Domains" capability is enabled.

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/bundleId.png" style="width: 100%" alt="xcode-associated-domains">

Open the example in Xcode now by opening `packages/passkeys/passkeys/example/ios`.
In *Runner* -> *Signing & Capabilites* enter your *Application Identifier Prefix* and your *Bundle Identifier*.

## 2. Set up Corbado project

Create a free Corbado project at the [Corbado developer panel](https://app.corbado.com/signin#register) if you haven't got one yet.
It will act as your relying party server.

After successful sign up, in the wizard, select 'Integration guide', 'Native / mobile app' and 'No existing users'.

## 3. Set up an iOS app in Corbado

Make sure that under [*Settings* -> *User interface* -> *Identity verification*](https://app.corbado.com/app/settings/userinterface) "Option 2: No verification required" is selected. This should be set by default, when selecting 'Native / mobile app' in the [previous step](#2-set-up-corbado-project).

Set up an iOS app at [*Settings* -> *Credentials* -> *Native apps*](https://app.corbado.com/app/settings/credentials/native-apps) by clicking "Add New".
You will need your **Application Identifier Prefix** and your **Bundle Identifier** that we set up in [step 1](#1-create-an-ios-app-and-configure-the-example-in-xcode).

Afterwards, your relying party server will host an `apple-app-site-association` file at `https://{PROJECT_ID}}.frontendapi.corbado.io/.well-known/apple-app-site-association`.
This file will by downloaded by iOS when you install your app.
To tell iOS where to look for the file, we need the next step in our setup.

## 4. Configure your iOS project

In your Xcode workspace, you need to configure the following settings:
In `Signing & Capabilities` tab, add the `Associated Domains` capability and add the following domain: `webcredentials:{PROJECT_ID}.frontendapi.corbado.io`
Now, iOS knows where to download the `apple-app-site-association` file from.

If you forget about this step, the example will show you an error message like `Your app is not associated with your relying party server. You have to add...`.
Your configuration inside Xcode should look something like in the screenshot below (you will have your own Corbado project ID and a different Bundle Identifier).

<img src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/packages/passkeys/passkeys/doc/passkeys_example_ios_associated_domains.png" style="width: 100%" alt="xcode-associated-domains">

## 5. Start the example

`flutter run --dart-define=CORBADO_PROJECT_ID=<your-corbado-project-id> lib/main.dart`

Now you are fully set and you can start signing up with your first passkey in the example.

If you want to run the example from your IDE, please make sure to either
- set the CORBADO_PROJECT_ID environment variable to your Corbado project ID
- replace `const String.fromEnvironment('CORBADO_PROJECT_ID')` directly in the example with your Corbado project ID