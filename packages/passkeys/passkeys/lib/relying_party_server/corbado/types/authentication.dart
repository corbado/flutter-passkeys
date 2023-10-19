import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/relying_party_server/types/authentication.dart';

part 'authentication.g.dart';

@JsonSerializable()
class CorbadoAuthenticationInitResponse {
  CorbadoAuthenticationInitResponse(this.publicKey);

  factory CorbadoAuthenticationInitResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationInitResponseFromJson(json);

  final CorbadoAuthenticationResponsePublicKey publicKey;

  AuthenticationInitResponse toAuthenticationInitResponse() {
    return AuthenticationInitResponse(
      rpId: publicKey.rpId,
      challenge: publicKey.challenge,
      timeout: publicKey.timeout,
      userVerification: publicKey.userVerification,
      allowCredentials: publicKey.allowCredentials
          ?.map(
            (e) => AllowCredential(
              type: e.type,
              id: e.id,
              transports: e.transports,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationInitResponseToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticationResponsePublicKey {
  /// Constructor
  CorbadoAuthenticationResponsePublicKey({
    required this.rpId,
    required this.challenge,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });

  factory CorbadoAuthenticationResponsePublicKey.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationResponsePublicKeyFromJson(json);

  /// The relying party id
  final String rpId;

  /// Challenge that must be signed by the authenticator
  final String challenge;

  /// Timeout in milliseconds
  final int? timeout;

  /// The user verification
  final String? userVerification;

  /// List of allowed credentials
  final List<CorbadoAllowCredential>? allowCredentials;

  /// Serializes object to json
  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationResponsePublicKeyToJson(this);
}

@JsonSerializable()
class CorbadoAllowCredential {
  /// Constructor
  CorbadoAllowCredential({
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

  factory CorbadoAllowCredential.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAllowCredentialFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoAllowCredentialToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CorbadoAuthenticationCompleteRequest {
  /// Constructor
  CorbadoAuthenticationCompleteRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

  factory CorbadoAuthenticationCompleteRequest.fromAuthenticationCompleteRequest(
    AuthenticationCompleteRequest r,
  ) {
    return CorbadoAuthenticationCompleteRequest(
      id: r.id,
      rawId: r.rawId,
      response: CorbadoAuthenticationComplete(
        clientDataJSON: r.clientDataJSON,
        authenticatorData: r.authenticatorData,
        signature: r.signature,
        userHandle: r.userHandle,
      ),
    );
  }

  factory CorbadoAuthenticationCompleteRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoAuthenticationCompleteRequestFromJson(json);

  /// The id
  final String id;

  /// The raw id
  final String rawId;

  /// The response
  final CorbadoAuthenticationComplete response;

  /// The type
  final String type;

  Map<String, dynamic> toJson() =>
      _$CorbadoAuthenticationCompleteRequestToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticationComplete {
  /// Constructor
  CorbadoAuthenticationComplete({
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
  factory CorbadoAuthenticationComplete.fromJson(Map<String, dynamic> json) =>
      _$CorbadoAuthenticationCompleteFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoAuthenticationCompleteToJson(this);
}
