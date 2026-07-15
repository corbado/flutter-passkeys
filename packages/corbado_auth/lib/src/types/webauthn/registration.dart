// ignore_for_file: avoid_positional_boolean_parameters

import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/types.dart';

part 'registration.g.dart';

/// Response returned when a passkey registration is started.
@JsonSerializable()
class StartRegisterResponse {
  /// Constructor
  StartRegisterResponse(this.publicKey);

  /// Creates a [StartRegisterResponse] from json.
  factory StartRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterResponseFromJson(json);

  /// Public key options used to create the credential.
  final StartRegisterPublicKey publicKey;

  /// Converts this response into the platform register request type.
  RegisterRequestType toPlatformType() {
    final rp = RelyingPartyType(name: publicKey.rp.name, id: publicKey.rp.id);
    final user = UserType(
      displayName: publicKey.user.displayName,
      name: publicKey.user.name,
      id: publicKey.user.id,
    );
    final authenticatorSelection = AuthenticatorSelectionType(
      authenticatorAttachment:
          publicKey.authenticatorSelection.authenticatorAttachment,
      requireResidentKey:
          publicKey.authenticatorSelection.requireResidentKey ?? false,
      residentKey: publicKey.authenticatorSelection.residentKey,
      userVerification: publicKey.authenticatorSelection.userVerification,
    );
    return RegisterRequestType(
      challenge: publicKey.challenge,
      relyingParty: rp,
      user: user,
      authSelectionType: authenticatorSelection,
      timeout: publicKey.timeout,
      attestation: publicKey.attestation,
      pubKeyCredParams: publicKey.pubKeyCredParams
          ?.map((e) => PubKeyCredParamType(alg: e.alg, type: e.type))
          .toList(),
      excludeCredentials: [],
    );
  }

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$StartRegisterResponseToJson(this);
}

/// Public key credential creation options.
@JsonSerializable()
class StartRegisterPublicKey {
  /// Constructor
  StartRegisterPublicKey(
    this.rp,
    this.user,
    this.challenge,
    this.authenticatorSelection, {
    this.pubKeyCredParams,
    this.timeout,
    this.attestation,
  });

  /// Creates a [StartRegisterPublicKey] from json.
  factory StartRegisterPublicKey.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterPublicKeyFromJson(json);

  /// The relying party.
  final CorbadoRelyingParty rp;

  /// The user the credential is created for.
  final CorbadoUser user;

  /// Challenge that must be signed by the authenticator.
  final String challenge;

  /// Authenticator selection criteria.
  final CorbadoAuthenticatorSelection authenticatorSelection;

  /// Supported public key credential parameters.
  final List<StartRegisterPubKeyCredParam>? pubKeyCredParams;

  /// Timeout in milliseconds.
  final int? timeout;

  /// Requested attestation conveyance preference.
  final String? attestation;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$StartRegisterPublicKeyToJson(this);
}

/// A supported public key credential parameter.
@JsonSerializable()
class StartRegisterPubKeyCredParam {
  /// Constructor
  StartRegisterPubKeyCredParam(this.type, this.alg);

  /// Creates a [StartRegisterPubKeyCredParam] from json.
  factory StartRegisterPubKeyCredParam.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterPubKeyCredParamFromJson(json);

  /// The credential type.
  final String type;

  /// The COSE algorithm identifier.
  final int alg;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$StartRegisterPubKeyCredParamToJson(this);
}

/// Authenticator selection criteria.
@JsonSerializable()
class CorbadoAuthenticatorSelection {
  /// Constructor
  CorbadoAuthenticatorSelection(
    this.authenticatorAttachment,
    this.requireResidentKey,
    this.residentKey,
    this.userVerification,
  );

  /// Creates a [CorbadoAuthenticatorSelection] from json.
  factory CorbadoAuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      _$CorbadoAuthenticatorSelectionFromJson(json);

  /// Preferred authenticator attachment.
  final String? authenticatorAttachment;

  /// Whether a resident key is required.
  final bool? requireResidentKey;

  /// Resident key requirement.
  final String residentKey;

  /// User verification requirement.
  final String userVerification;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$CorbadoAuthenticatorSelectionToJson(this);
}

/// The relying party that requests the credential.
@JsonSerializable()
class CorbadoRelyingParty {
  /// Constructor
  CorbadoRelyingParty(this.name, this.id);

  /// Creates a [CorbadoRelyingParty] from json.
  factory CorbadoRelyingParty.fromJson(Map<String, dynamic> json) =>
      _$CorbadoRelyingPartyFromJson(json);

  /// Human readable name of the relying party.
  final String name;

  /// Identifier of the relying party.
  final String id;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$CorbadoRelyingPartyToJson(this);
}

/// The user a credential is created for.
@JsonSerializable()
class CorbadoUser {
  /// Constructor
  CorbadoUser(this.displayName, this.name, this.id);

  /// Creates a [CorbadoUser] from json.
  factory CorbadoUser.fromJson(Map<String, dynamic> json) =>
      _$CorbadoUserFromJson(json);

  /// Display name of the user.
  final String displayName;

  /// Name of the user.
  final String name;

  /// Identifier of the user.
  final String id;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$CorbadoUserToJson(this);
}

/// Request sent to complete a passkey registration.
@JsonSerializable(explicitToJson: true)
class FinishRegisterRequest {
  /// Constructor
  FinishRegisterRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

  /// Creates a [FinishRegisterRequest] from a platform register response.
  factory FinishRegisterRequest.fromRegisterCompleteRequest(
    RegisterResponseType r,
  ) {
    final response = FinishRegisterPlatformResponse(
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );

    return FinishRegisterRequest(
      id: r.id,
      rawId: r.rawId,
      response: response,
    );
  }

  /// Creates a [FinishRegisterRequest] from json.
  factory FinishRegisterRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$FinishRegisterRequestFromJson(json);

  /// The credential id.
  final String id;

  /// The raw credential id.
  final String rawId;

  /// The platform attestation response.
  final FinishRegisterPlatformResponse response;

  /// The credential type.
  final String type;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$FinishRegisterRequestToJson(this);
}

/// Platform attestation response for a registration.
@JsonSerializable()
class FinishRegisterPlatformResponse {
  /// Constructor
  FinishRegisterPlatformResponse({
    required this.clientDataJSON,
    required this.attestationObject,
    this.transports = const ['internal'],
  });

  /// Creates a [FinishRegisterPlatformResponse] from json.
  factory FinishRegisterPlatformResponse.fromJson(
    Map<String, dynamic> json,
  ) => _$FinishRegisterPlatformResponseFromJson(json);

  /// The client data json.
  final String clientDataJSON;

  /// The attestation object.
  final String attestationObject;

  /// Transports supported by the authenticator.
  final List<String> transports;

  /// Serializes object to json
  Map<String, dynamic> toJson() => _$FinishRegisterPlatformResponseToJson(this);
}
