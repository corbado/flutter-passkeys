# passkeys_android

The Android implementation of `passkeys`.

## Usage

This package is [endorsed][endorsed_link], which means you can simply use `passkeys`
normally. This package will be automatically included in your app when you do.

**Note:**

- The minimum supported `minSdkVersion` is now 23, but passkey-related APIs require Android API 28+ at runtime.
- If you call any passkey-related API on devices running below API 28, a `PasskeyUnsupportedException` will be thrown.
- This allows you to support older Android versions in your app, but you must handle this exception appropriately.

[endorsed_link]: https://flutter.dev/docs/development/packages-and-plugins/developing-packages#endorsed-federated-plugin
