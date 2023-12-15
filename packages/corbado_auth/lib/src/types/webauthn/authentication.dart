import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/authenticator/types.dart';

part 'authentication.g.dart';

@JsonSerializable()
class StartLoginResponse {
  StartLoginResponse(this.publicKey);

  factory StartLoginResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StartLoginResponseFromJson(json);

  final StartLoginPublicKey publicKey;

  AuthenticateRequestType toPlatformType({
    required bool conditional,
  }) {
    return AuthenticateRequestType(
      relyingPartyId: publicKey.rpId,
      challenge: publicKey.challenge,
      timeout: publicKey.timeout,
      userVerification: publicKey.userVerification,
      allowCredentials: publicKey.allowCredentials
          ?.map(
            (e) => AllowCredentialType(
              type: e.type,
              id: e.id,
              transports: e.transports,
            ),
          )
          .toList(),
      mediation:
          conditional ? MediationType.Conditional : MediationType.Optional,
    );
  }

  Map<String, dynamic> toJson() =>
      _$StartLoginResponseToJson(this);
}

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

  factory StartLoginPublicKey.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StartLoginPublicKeyFromJson(json);

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
  Map<String, dynamic> toJson() =>
      _$StartLoginPublicKeyToJson(this);
}

@JsonSerializable()
class AllowCredential {
  /// Constructor
  AllowCredential({
    required this.type,
    required this.id,
    required this.transports,
  });

  /// The type
  final String type;

  /// The id
  final String id;

  /// The transports
  final List<String> transports;

  factory AllowCredential.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$AllowCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$AllowCredentialToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FinishLoginRequest {
  /// Constructor
  FinishLoginRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

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

  factory FinishLoginRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FinishLoginRequestFromJson(json);

  /// The id
  final String id;

  /// The raw id
  final String rawId;

  /// The response
  final FinishLoginPlatformResponse response;

  /// The type
  final String type;

  Map<String, dynamic> toJson() =>
      _$FinishLoginRequestToJson(this);
}

@JsonSerializable()
class FinishLoginPlatformResponse {
  /// Constructor
  FinishLoginPlatformResponse({
    required this.clientDataJSON,
    required this.authenticatorData,
    required this.signature,
    required this.userHandle,
  });

  /// The client data json
  final String clientDataJSON;

  /// The authenticator data
  final String authenticatorData;

  /// The signature
  final String signature;

  final String userHandle;

  /// Parses a json object
  factory FinishLoginPlatformResponse.fromJson(Map<String, dynamic> json) =>
      _$FinishLoginPlatformResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FinishLoginPlatformResponseToJson(this);
}
