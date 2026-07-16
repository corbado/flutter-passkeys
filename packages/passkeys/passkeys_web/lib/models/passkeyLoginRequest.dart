// ignore_for_file: file_names, constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeyLoginRequest.g.dart';

/// Request payload sent to the Web SDK to authenticate with a passkey.
@JsonSerializable(explicitToJson: true)
class PasskeyLoginRequest {
  /// Creates a request from a [publicKey] and a [mediation] preference.
  PasskeyLoginRequest(this.publicKey, this.mediation);

  /// Creates a request from a decoded JSON map.
  factory PasskeyLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginRequestFromJson(json);

  /// Builds a request from the platform interface authentication parameters.
  factory PasskeyLoginRequest.fromPlatformType(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? platformUserVerification,
    List<CredentialType>? platformAllowCredentials,
    MediationType platformMediation,
  ) {
    final allowCredentials =
        platformAllowCredentials?.map((e) {
          return PasskeyLoginAllowCredentialType(
            e.type,
            e.id,
            e.transports.map(AuthenticatorTransport.fromPlatformType).toList(),
          );
        }).toList() ??
        [];

    final publicKey = PasskeyLoginPublicKey(
      challenge: challenge,
      timeout: timeout,
      rpId: relyingPartyId,
      userVerification: platformUserVerification != null
          ? UserVerificationRequirement.fromPlatformType(
              platformUserVerification,
            )
          : null,
      allowCredentials: allowCredentials,
    );

    final mediation = PasskeyLoginMediationType.fromPlatformType(
      platformMediation,
    );
    return PasskeyLoginRequest(publicKey, mediation);
  }

  /// The mediation requirement for this authentication.
  final PasskeyLoginMediationType mediation;

  /// The public key credential request options.
  final PasskeyLoginPublicKey publicKey;

  /// Serializes this request to a JSON map.
  Map<String, dynamic> toJson() => _$PasskeyLoginRequestToJson(this);
}

/// Public key credential request options for a passkey login.
@JsonSerializable(explicitToJson: true)
class PasskeyLoginPublicKey {
  /// Creates the public key request options.
  PasskeyLoginPublicKey({
    required this.challenge,
    this.timeout,
    this.rpId,
    this.allowCredentials,
    this.userVerification,
    this.loginExtensions,
  });

  /// Creates the public key request options from a decoded JSON map.
  factory PasskeyLoginPublicKey.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginPublicKeyFromJson(json);

  /// The server-generated challenge to be signed.
  final String challenge;

  /// The time in milliseconds the caller is willing to wait for the operation.
  final int? timeout;

  /// The relying party identifier.
  final String? rpId;

  /// The credentials the user is allowed to authenticate with.
  final List<PasskeyLoginAllowCredentialType>? allowCredentials;

  /// The user verification requirement for the operation.
  final UserVerificationRequirement? userVerification;

  /// Optional WebAuthn extensions for the login request.
  final LoginExtensions? loginExtensions;

  /// Serializes these options to a JSON map.
  Map<String, dynamic> toJson() => _$PasskeyLoginPublicKeyToJson(this);
}

/// A credential descriptor allowed for a passkey login.
@JsonSerializable(explicitToJson: true)
class PasskeyLoginAllowCredentialType {
  /// Creates an allowed credential from its [type], [id] and [transports].
  PasskeyLoginAllowCredentialType(this.type, this.id, this.transports);

  /// Creates an allowed credential from a decoded JSON map.
  factory PasskeyLoginAllowCredentialType.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginAllowCredentialTypeFromJson(json);

  /// The credential type, typically `public-key`.
  final String type;

  /// The base64url encoded credential identifier.
  final String id;

  /// The transports supported by the credential.
  final List<AuthenticatorTransport> transports;

  /// Serializes this credential descriptor to a JSON map.
  Map<String, dynamic> toJson() =>
      _$PasskeyLoginAllowCredentialTypeToJson(this);
}

/// The transports an authenticator can use to communicate.
enum AuthenticatorTransport {
  /// Hybrid transport (cross-device authentication).
  @JsonValue('hybrid')
  Hybrid,

  /// The authenticator is built into the platform.
  @JsonValue('internal')
  Internal,

  /// Near-field communication transport.
  @JsonValue('nfc')
  Nfc,

  /// Universal serial bus transport.
  @JsonValue('usb')
  Usb,

  /// Bluetooth low energy transport.
  @JsonValue('bluetooth')
  Bluetooth;

  /// Maps a platform interface transport string to an [AuthenticatorTransport].
  factory AuthenticatorTransport.fromPlatformType(String value) =>
      switch (value) {
        'hybrid' => AuthenticatorTransport.Hybrid,
        'internal' => AuthenticatorTransport.Internal,
        'usb' => AuthenticatorTransport.Usb,
        'nfc' => AuthenticatorTransport.Nfc,
        'bluetooth' => AuthenticatorTransport.Bluetooth,
        _ => throw ArgumentError.value(value),
      };
}

/// The mediation requirement controlling how the browser prompts the user.
enum PasskeyLoginMediationType {
  /// Conditional mediation (passkey autofill).
  @JsonValue('conditional')
  Conditional,

  /// Optional mediation, the browser may prompt the user.
  @JsonValue('optional')
  Optional,

  /// Required mediation, the browser must prompt the user.
  @JsonValue('required')
  Required,

  /// Silent mediation, no user interaction is requested.
  @JsonValue('silent')
  Silent;

  /// Maps a platform [MediationType] to a [PasskeyLoginMediationType].
  factory PasskeyLoginMediationType.fromPlatformType(MediationType value) =>
      switch (value) {
        MediationType.Conditional => PasskeyLoginMediationType.Conditional,
        MediationType.Optional => PasskeyLoginMediationType.Optional,
        MediationType.Required => PasskeyLoginMediationType.Required,
        MediationType.Silent => PasskeyLoginMediationType.Silent,
      };
}

/// The relying party's requirement for user verification during an operation.
enum UserVerificationRequirement {
  /// User verification is discouraged.
  @JsonValue('discouraged')
  Discouraged,

  /// User verification is preferred but not required.
  @JsonValue('preferred')
  Preferred,

  /// User verification is required.
  @JsonValue('required')
  Required;

  /// Maps a platform interface string to a [UserVerificationRequirement].
  factory UserVerificationRequirement.fromPlatformType(String value) =>
      switch (value) {
        'discouraged' => UserVerificationRequirement.Discouraged,
        'preferred' => UserVerificationRequirement.Preferred,
        'required' => UserVerificationRequirement.Required,
        _ => throw ArgumentError.value(value),
      };
}

/// Optional WebAuthn client extensions for a login request.
@JsonSerializable(explicitToJson: true)
class LoginExtensions {
  /// Creates the extensions from [appid], [appidExclude] and [credProps].
  LoginExtensions(this.appid, this.appidExclude, this.credProps);

  /// Creates the extensions from a decoded JSON map.
  factory LoginExtensions.fromJson(Map<String, dynamic> json) =>
      _$LoginExtensionsFromJson(json);

  /// The legacy FIDO AppID extension value.
  final String? appid;

  /// The FIDO AppID exclusion extension value.
  final String? appidExclude;

  /// The credential properties extension value.
  final String? credProps;

  /// Serializes these extensions to a JSON map.
  Map<String, dynamic> toJson() => _$LoginExtensionsToJson(this);
}
