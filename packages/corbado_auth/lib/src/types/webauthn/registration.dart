import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/types.dart';

part 'registration.g.dart';

@JsonSerializable()
class StartRegisterResponse {
  StartRegisterResponse(this.publicKey);

  factory StartRegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterResponseFromJson(json);

  final StartRegisterPublicKey publicKey;

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
      requireResidentKey: publicKey.authenticatorSelection.requireResidentKey,
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
    );
  }

  Map<String, dynamic> toJson() => _$StartRegisterResponseToJson(this);
}

@JsonSerializable()
class StartRegisterPublicKey {
  StartRegisterPublicKey(
      this.rp, this.user, this.challenge, this.authenticatorSelection,
      {this.pubKeyCredParams, this.timeout, this.attestation});

  factory StartRegisterPublicKey.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterPublicKeyFromJson(json);
  final CorbadoRelyingParty rp;
  final CorbadoUser user;
  final String challenge;
  final CorbadoAuthenticatorSelection authenticatorSelection;
  final List<StartRegisterPubKeyCredParam>? pubKeyCredParams;
  final int? timeout;
  final String? attestation;

  Map<String, dynamic> toJson() => _$StartRegisterPublicKeyToJson(this);
}

@JsonSerializable()
class StartRegisterPubKeyCredParam {
  StartRegisterPubKeyCredParam(this.type, this.alg);

  factory StartRegisterPubKeyCredParam.fromJson(Map<String, dynamic> json) =>
      _$StartRegisterPubKeyCredParamFromJson(json);
  final String type;
  final int alg;

  Map<String, dynamic> toJson() => _$StartRegisterPubKeyCredParamToJson(this);
}

@JsonSerializable()
class CorbadoAuthenticatorSelection {
  CorbadoAuthenticatorSelection(this.authenticatorAttachment,
      this.requireResidentKey, this.residentKey, this.userVerification);

  factory CorbadoAuthenticatorSelection.fromJson(Map<String, dynamic> json) =>
      _$CorbadoAuthenticatorSelectionFromJson(json);
  final String authenticatorAttachment;
  final bool requireResidentKey;
  final String residentKey;
  final String userVerification;

  Map<String, dynamic> toJson() => _$CorbadoAuthenticatorSelectionToJson(this);
}

@JsonSerializable()
class CorbadoRelyingParty {
  CorbadoRelyingParty(this.name, this.id);

  factory CorbadoRelyingParty.fromJson(Map<String, dynamic> json) =>
      _$CorbadoRelyingPartyFromJson(json);
  final String name;
  final String id;

  Map<String, dynamic> toJson() => _$CorbadoRelyingPartyToJson(this);
}

@JsonSerializable()
class CorbadoUser {
  CorbadoUser(this.displayName, this.name, this.id);

  factory CorbadoUser.fromJson(Map<String, dynamic> json) =>
      _$CorbadoUserFromJson(json);

  final String displayName;
  final String name;
  final String id;

  Map<String, dynamic> toJson() => _$CorbadoUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FinishRegisterRequest {
  FinishRegisterRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

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

  factory FinishRegisterRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FinishRegisterRequestFromJson(json);
  final String id;
  final String rawId;
  final FinishRegisterPlatformResponse response;
  final String type;

  Map<String, dynamic> toJson() => _$FinishRegisterRequestToJson(this);
}

@JsonSerializable()
class FinishRegisterPlatformResponse {
  FinishRegisterPlatformResponse({
    required this.clientDataJSON,
    required this.attestationObject,
    this.transports = const ['internal'],
  });

  factory FinishRegisterPlatformResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$FinishRegisterPlatformResponseFromJson(json);
  final String clientDataJSON;
  final String attestationObject;
  final List<String> transports;

  Map<String, dynamic> toJson() => _$FinishRegisterPlatformResponseToJson(this);
}
