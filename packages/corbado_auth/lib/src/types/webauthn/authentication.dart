import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/types.dart';

part 'authentication.g.dart';

/// Response returned when a passkey login is started.
@JsonSerializable()
class StartLoginResponse {
  /// Constructor
  StartLoginResponse(this.publicKey);

  /// Creates a [StartLoginResponse] from json.
  factory StartLoginResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$StartLoginResponseFromJson(json);

  /// Public key options used to assert the credential.
  final StartLoginPublicKey publicKey;

  /// Converts this response into the platform authenticate request type.
  AuthenticateRequestType toPlatformType({
    required bool conditional,
    bool preferImmediatelyAvailableCredentials = true,
  }) {
    return AuthenticateRequestType(
      relyingPartyId: publicKey.rpId,
      challenge: publicKey.challenge,
      timeout: publicKey.timeout,
      userVerification: publicKey.userVerification,
      allowCredentials: publicKey.allowCredentials
          ?.map(
            (e) => CredentialType(
              type: e.type,
              id: e.id,
              transports: e.transports,
            ),
          )
          .toList(),
      mediation: conditional
          ? MediationType.Conditional
          : MediationType.Optional,
      preferImmediatelyAvailableCredentials:
          preferImmediatelyAvailableCredentials,
    );
  }

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$StartLoginResponseToJson(this);
}

/// Public key credential request options.
@JsonSerializable()
class StartLoginPublicKey {
  /// Constructor
  StartLoginPublicKey({
    required this.rpId,
    required this.challenge,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });

  /// Creates a [StartLoginPublicKey] from json.
  factory StartLoginPublicKey.fromJson(
    Map<String, dynamic> json,
  ) => _$StartLoginPublicKeyFromJson(json);

  /// The relying party id
  final String rpId;

  /// Challenge that must be signed by the authenticator
  final String challenge;

  /// Timeout in milliseconds
  final int? timeout;

  /// The user verification
  final String? userVerification;

  /// List of allowed credentials
  final List<AllowCredential>? allowCredentials;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$StartLoginPublicKeyToJson(this);
}

/// A credential the authenticator is allowed to use.
@JsonSerializable()
class AllowCredential {
  /// Constructor
  AllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// Creates an [AllowCredential] from json.
  factory AllowCredential.fromJson(
    Map<String, dynamic> json,
  ) => _$AllowCredentialFromJson(json);

  /// The type
  final String type;

  /// The id
  final String id;

  /// The transports
  final List<String> transports;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$AllowCredentialToJson(this);
}

/// Request sent to complete a passkey login.
@JsonSerializable(explicitToJson: true)
class FinishLoginRequest {
  /// Constructor
  FinishLoginRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

  /// Creates a [FinishLoginRequest] from a platform authenticate response.
  factory FinishLoginRequest.fromPlatformType(
    AuthenticateResponseType r,
  ) {
    return FinishLoginRequest(
      id: r.id,
      rawId: r.rawId,
      response: FinishLoginPlatformResponse(
        clientDataJSON: r.clientDataJSON,
        authenticatorData: r.authenticatorData,
        signature: r.signature,
        userHandle: r.userHandle,
      ),
    );
  }

  /// Creates a [FinishLoginRequest] from json.
  factory FinishLoginRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$FinishLoginRequestFromJson(json);

  /// The id
  final String id;

  /// The raw id
  final String rawId;

  /// The response
  final FinishLoginPlatformResponse response;

  /// The type
  final String type;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$FinishLoginRequestToJson(this);
}

/// Platform assertion response for a login.
@JsonSerializable()
class FinishLoginPlatformResponse {
  /// Constructor
  FinishLoginPlatformResponse({
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  /// Parses a json object
  factory FinishLoginPlatformResponse.fromJson(Map<String, dynamic> json) =>
      _$FinishLoginPlatformResponseFromJson(json);

  /// The client data json
  final String clientDataJSON;

  /// The authenticator data
  final String authenticatorData;

  /// The signature
  final String signature;

  /// The user handle
  final String userHandle;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$FinishLoginPlatformResponseToJson(this);
}
