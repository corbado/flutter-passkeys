/// The version of this SDK, reported to Corbado in telemetry events and in the
/// `X-Corbado-SDK` header sent by the frontend API client.
///
/// Kept in sync with the `corbado_auth` `pubspec.yaml` version by
/// `scripts/update_sdk_version.dart`, which runs automatically from the melos
/// version hook.
const String sdkVersion = '3.8.0';

/// The name of this SDK reported to Corbado.
const String sdkName = 'Flutter SDK';
