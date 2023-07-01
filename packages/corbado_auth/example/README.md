# Corbado Auth for Flutter: Example (custom backend)

## Getting Started
This example demonstrates how you can use Corbado Authentication to setup Passkey based authentication in a matter of minutes.

### Android

### iOS
#### 1. Setup Corbado project
Create a free Corbado project at https://corbado.com if you haven't got one yet.

#### 2. Setup an iOS app
Setup an iOS app at https://app.corbado.com/app/settings/credentials/native-apps by clicking "Add New". 
You will need your **App ID Prefix** and your **Bundle ID**.

#### 3. Configure your iOS project
In your Xcode workspace, you need to configure the following settings:
- In `Signing & Capabilities` tab, add the `Associated Domains` capability and add the following domain: `applinks:{PROJECT_ID}.frontend.api.corbado.io`

#### 4. Start the example
```flutter run --dart-define=CORBADO_PROJECT_ID=PROJECT_ID lib/main.dart```