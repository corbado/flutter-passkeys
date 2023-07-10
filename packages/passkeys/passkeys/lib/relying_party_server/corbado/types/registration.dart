// TODO: this whole file can be removed as we better type open api spec
import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/relying_party_server/types/registration.dart';

part 'registration.g.dart';

@JsonSerializable()
class CorbadoRegisterChallenge {
  CorbadoRegisterChallenge(this.publicKey);

  factory CorbadoRegisterChallenge.fromJson(Map<String, dynamic> json) =>
      _$CorbadoRegisterChallengeFromJson(json);

  final CorbadoPublicKey publicKey;

  RegistrationInitResponse toRegisterInitResponse() {
    final rp = RelyingParty(publicKey.rp.name, publicKey.rp.id);
    final user = User(
      publicKey.user.displayName,
      publicKey.user.name,
      publicKey.user.id,
    );
    final authenticatorSelection = AuthenticatorSelection(
      publicKey.authenticatorSelection.authenticatorAttachment,
      publicKey.authenticatorSelection.requireResidentKey,
      publicKey.authenticatorSelection.residentKey,
      publicKey.authenticatorSelection.userVerification,
    );
    return RegistrationInitResponse(
      rp,
      user,
      publicKey.challenge,
      authenticatorSelection,
      timeout: publicKey.timeout,
      attestation: publicKey.attestation,
      pubKeyCredParams: publicKey.pubKeyCredParams
          ?.map((e) => PubKeyCredParam(e.alg, e.type))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => _$CorbadoRegisterChallengeToJson(this);
}

@JsonSerializable()
class CorbadoPublicKey {
  CorbadoPublicKey(
      this.rp, this.user, this.challenge, this.authenticatorSelection,
      {this.pubKeyCredParams, this.timeout, this.attestation});

  factory CorbadoPublicKey.fromJson(Map<String, dynamic> json) =>
      _$CorbadoPublicKeyFromJson(json);
  final CorbadoRelyingParty rp;
  final CorbadoUser user;
  final String challenge;
  final CorbadoAuthenticatorSelection authenticatorSelection;
  final List<CorbadoPubKeyCredParam>? pubKeyCredParams;
  final int? timeout;
  final String? attestation;

  Map<String, dynamic> toJson() => _$CorbadoPublicKeyToJson(this);
}

@JsonSerializable()
class CorbadoPubKeyCredParam {
  CorbadoPubKeyCredParam(this.type, this.alg);

  factory CorbadoPubKeyCredParam.fromJson(Map<String, dynamic> json) =>
      _$CorbadoPubKeyCredParamFromJson(json);
  final String type;
  final int alg;

  Map<String, dynamic> toJson() => _$CorbadoPubKeyCredParamToJson(this);
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
class CorbadoRegisterSignedChallengeRequest {
  CorbadoRegisterSignedChallengeRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = 'public-key',
  });

  factory CorbadoRegisterSignedChallengeRequest.fromRegisterCompleteRequest(
    RegistrationCompleteRequest r,
  ) {
    final response = CorbadoRegisterSignedChallengeRequestResponse(
      clientDataJSON: r.clientDataJSON,
      attestationObject: r.attestationObject,
    );

    return CorbadoRegisterSignedChallengeRequest(
      id: r.id,
      rawId: r.rawId,
      response: response,
    );
  }

  factory CorbadoRegisterSignedChallengeRequest.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoRegisterSignedChallengeRequestFromJson(json);
  final String id;
  final String rawId;
  final CorbadoRegisterSignedChallengeRequestResponse response;
  final String type;

  Map<String, dynamic> toJson() =>
      _$CorbadoRegisterSignedChallengeRequestToJson(this);
}

@JsonSerializable()
class CorbadoRegisterSignedChallengeRequestResponse {
  CorbadoRegisterSignedChallengeRequestResponse({
    required this.clientDataJSON,
    required this.attestationObject,
    this.transports = const ['internal'],
  });

  factory CorbadoRegisterSignedChallengeRequestResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$CorbadoRegisterSignedChallengeRequestResponseFromJson(json);
  final String clientDataJSON;
  final String attestationObject;
  final List<String> transports;

  Map<String, dynamic> toJson() =>
      _$CorbadoRegisterSignedChallengeRequestResponseToJson(this);
}
