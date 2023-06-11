// TODO: this whole file can be removed as we better type open api spec
import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys/backend/types/registration.dart';

part 'registration.g.dart';

@JsonSerializable()
class CorbadoRegisterChallenge {
  final CorbadoPublicKey publicKey;

  CorbadoRegisterChallenge(this.publicKey);

  RegistrationInitResponse toRegisterInitResponse() {
    final rp = RelyingParty(publicKey.rp.name, publicKey.rp.id);
    final user = User(publicKey.user.name, publicKey.user.id);
    return RegistrationInitResponse(rp, user, publicKey.challenge);
  }

  factory CorbadoRegisterChallenge.fromJson(Map<String, dynamic> json) =>
      _$CorbadoRegisterChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoRegisterChallengeToJson(this);
}

@JsonSerializable()
class CorbadoPublicKey {
  final CorbadoRelyingParty rp;
  final CorbadoUser user;
  final String challenge;

  CorbadoPublicKey(this.rp, this.user, this.challenge);

  factory CorbadoPublicKey.fromJson(Map<String, dynamic> json) =>
      _$CorbadoPublicKeyFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoPublicKeyToJson(this);
}

@JsonSerializable()
class CorbadoRelyingParty {
  final String name;
  final String id;

  CorbadoRelyingParty(this.name, this.id);

  factory CorbadoRelyingParty.fromJson(Map<String, dynamic> json) =>
      _$CorbadoRelyingPartyFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoRelyingPartyToJson(this);
}

@JsonSerializable()
class CorbadoUser {
  final String name;
  final String id;

  CorbadoUser(this.name, this.id);

  factory CorbadoUser.fromJson(Map<String, dynamic> json) =>
      _$CorbadoUserFromJson(json);

  Map<String, dynamic> toJson() => _$CorbadoUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CorbadoRegisterSignedChallengeRequest {
  final String id;
  final String rawId;
  final CorbadoRegisterSignedChallengeRequestResponse response;
  final String type;

  factory CorbadoRegisterSignedChallengeRequest.fromRegisterCompleteRequest(
      RegistrationCompleteRequest r) {
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

  CorbadoRegisterSignedChallengeRequest({
    required this.id,
    required this.rawId,
    required this.response,
    this.type = "public-key",
  });

  factory CorbadoRegisterSignedChallengeRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CorbadoRegisterSignedChallengeRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CorbadoRegisterSignedChallengeRequestToJson(this);
}

@JsonSerializable()
class CorbadoRegisterSignedChallengeRequestResponse {
  final String clientDataJSON;
  final String attestationObject;
  final List<String> transports;

  CorbadoRegisterSignedChallengeRequestResponse({
    required this.clientDataJSON,
    required this.attestationObject,
    this.transports = const ["internal"],
  });

  factory CorbadoRegisterSignedChallengeRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CorbadoRegisterSignedChallengeRequestResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CorbadoRegisterSignedChallengeRequestResponseToJson(this);
}
