// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartRegisterResponse _$StartRegisterResponseFromJson(
        Map<String, dynamic> json) =>
    StartRegisterResponse(
      StartRegisterPublicKey.fromJson(
          json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartRegisterResponseToJson(
        StartRegisterResponse instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
    };

StartRegisterPublicKey _$StartRegisterPublicKeyFromJson(
        Map<String, dynamic> json) =>
    StartRegisterPublicKey(
      CorbadoRelyingParty.fromJson(json['rp'] as Map<String, dynamic>),
      CorbadoUser.fromJson(json['user'] as Map<String, dynamic>),
      json['challenge'] as String,
      CorbadoAuthenticatorSelection.fromJson(
          json['authenticatorSelection'] as Map<String, dynamic>),
      pubKeyCredParams: (json['pubKeyCredParams'] as List<dynamic>?)
          ?.map((e) =>
              StartRegisterPubKeyCredParam.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeout: (json['timeout'] as num?)?.toInt(),
      attestation: json['attestation'] as String?,
    );

Map<String, dynamic> _$StartRegisterPublicKeyToJson(
        StartRegisterPublicKey instance) =>
    <String, dynamic>{
      'rp': instance.rp,
      'user': instance.user,
      'challenge': instance.challenge,
      'authenticatorSelection': instance.authenticatorSelection,
      'pubKeyCredParams': instance.pubKeyCredParams,
      'timeout': instance.timeout,
      'attestation': instance.attestation,
    };

StartRegisterPubKeyCredParam _$StartRegisterPubKeyCredParamFromJson(
        Map<String, dynamic> json) =>
    StartRegisterPubKeyCredParam(
      json['type'] as String,
      (json['alg'] as num).toInt(),
    );

Map<String, dynamic> _$StartRegisterPubKeyCredParamToJson(
        StartRegisterPubKeyCredParam instance) =>
    <String, dynamic>{
      'type': instance.type,
      'alg': instance.alg,
    };

CorbadoAuthenticatorSelection _$CorbadoAuthenticatorSelectionFromJson(
        Map<String, dynamic> json) =>
    CorbadoAuthenticatorSelection(
      json['authenticatorAttachment'] as String?,
      json['requireResidentKey'] as bool?,
      json['residentKey'] as String,
      json['userVerification'] as String,
    );

Map<String, dynamic> _$CorbadoAuthenticatorSelectionToJson(
        CorbadoAuthenticatorSelection instance) =>
    <String, dynamic>{
      'authenticatorAttachment': instance.authenticatorAttachment,
      'requireResidentKey': instance.requireResidentKey,
      'residentKey': instance.residentKey,
      'userVerification': instance.userVerification,
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
      json['displayName'] as String,
      json['name'] as String,
      json['id'] as String,
    );

Map<String, dynamic> _$CorbadoUserToJson(CorbadoUser instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'name': instance.name,
      'id': instance.id,
    };

FinishRegisterRequest _$FinishRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    FinishRegisterRequest(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      response: FinishRegisterPlatformResponse.fromJson(
          json['response'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'public-key',
    );

Map<String, dynamic> _$FinishRegisterRequestToJson(
        FinishRegisterRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response.toJson(),
      'type': instance.type,
    };

FinishRegisterPlatformResponse _$FinishRegisterPlatformResponseFromJson(
        Map<String, dynamic> json) =>
    FinishRegisterPlatformResponse(
      clientDataJSON: json['clientDataJSON'] as String,
      attestationObject: json['attestationObject'] as String,
      transports: (json['transports'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const ['internal'],
    );

Map<String, dynamic> _$FinishRegisterPlatformResponseToJson(
        FinishRegisterPlatformResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'attestationObject': instance.attestationObject,
      'transports': instance.transports,
    };
