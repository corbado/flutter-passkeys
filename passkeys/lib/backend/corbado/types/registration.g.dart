// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorbadoRegisterChallenge _$CorbadoRegisterChallengeFromJson(
        Map<String, dynamic> json) =>
    CorbadoRegisterChallenge(
      CorbadoPublicKey.fromJson(json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CorbadoRegisterChallengeToJson(
        CorbadoRegisterChallenge instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
    };

CorbadoPublicKey _$CorbadoPublicKeyFromJson(Map<String, dynamic> json) =>
    CorbadoPublicKey(
      CorbadoRelyingParty.fromJson(json['rp'] as Map<String, dynamic>),
      CorbadoUser.fromJson(json['user'] as Map<String, dynamic>),
      json['challenge'] as String,
    );

Map<String, dynamic> _$CorbadoPublicKeyToJson(CorbadoPublicKey instance) =>
    <String, dynamic>{
      'rp': instance.rp,
      'user': instance.user,
      'challenge': instance.challenge,
    };

CorbadoRelyingParty _$CorbadoRelyingPartyFromJson(Map<String, dynamic> json) =>
    CorbadoRelyingParty(
      json['name'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$CorbadoRelyingPartyToJson(
        CorbadoRelyingParty instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

CorbadoUser _$CorbadoUserFromJson(Map<String, dynamic> json) => CorbadoUser(
      json['name'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$CorbadoUserToJson(CorbadoUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

CorbadoRegisterSignedChallengeRequest
    _$CorbadoRegisterSignedChallengeRequestFromJson(
            Map<String, dynamic> json) =>
        CorbadoRegisterSignedChallengeRequest(
          id: json['id'] as String,
          rawId: json['rawId'] as String,
          response: CorbadoRegisterSignedChallengeRequestResponse.fromJson(
              json['response'] as Map<String, dynamic>),
          type: json['type'] as String? ?? "public-key",
        );

Map<String, dynamic> _$CorbadoRegisterSignedChallengeRequestToJson(
        CorbadoRegisterSignedChallengeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response.toJson(),
      'type': instance.type,
    };

CorbadoRegisterSignedChallengeRequestResponse
    _$CorbadoRegisterSignedChallengeRequestResponseFromJson(
            Map<String, dynamic> json) =>
        CorbadoRegisterSignedChallengeRequestResponse(
          clientDataJSON: json['clientDataJSON'] as String,
          attestationObject: json['attestationObject'] as String,
          transports: (json['transports'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const ["internal"],
        );

Map<String, dynamic> _$CorbadoRegisterSignedChallengeRequestResponseToJson(
        CorbadoRegisterSignedChallengeRequestResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'attestationObject': instance.attestationObject,
      'transports': instance.transports,
    };
