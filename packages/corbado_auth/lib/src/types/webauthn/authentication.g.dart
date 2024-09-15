// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartLoginResponse _$StartLoginResponseFromJson(Map<String, dynamic> json) =>
    StartLoginResponse(
      StartLoginPublicKey.fromJson(json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StartLoginResponseToJson(StartLoginResponse instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
    };

StartLoginPublicKey _$StartLoginPublicKeyFromJson(Map<String, dynamic> json) =>
    StartLoginPublicKey(
      rpId: json['rpId'] as String,
      challenge: json['challenge'] as String,
      timeout: (json['timeout'] as num?)?.toInt(),
      userVerification: json['userVerification'] as String?,
      allowCredentials: (json['allowCredentials'] as List<dynamic>?)
          ?.map((e) => AllowCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StartLoginPublicKeyToJson(
        StartLoginPublicKey instance) =>
    <String, dynamic>{
      'rpId': instance.rpId,
      'challenge': instance.challenge,
      'timeout': instance.timeout,
      'userVerification': instance.userVerification,
      'allowCredentials': instance.allowCredentials,
    };

AllowCredential _$AllowCredentialFromJson(Map<String, dynamic> json) =>
    AllowCredential(
      type: json['type'] as String,
      id: json['id'] as String,
      transports: (json['transports'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AllowCredentialToJson(AllowCredential instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'transports': instance.transports,
    };

FinishLoginRequest _$FinishLoginRequestFromJson(Map<String, dynamic> json) =>
    FinishLoginRequest(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      response: FinishLoginPlatformResponse.fromJson(
          json['response'] as Map<String, dynamic>),
      type: json['type'] as String? ?? 'public-key',
    );

Map<String, dynamic> _$FinishLoginRequestToJson(FinishLoginRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response.toJson(),
      'type': instance.type,
    };

FinishLoginPlatformResponse _$FinishLoginPlatformResponseFromJson(
        Map<String, dynamic> json) =>
    FinishLoginPlatformResponse(
      clientDataJSON: json['clientDataJSON'] as String,
      authenticatorData: json['authenticatorData'] as String,
      signature: json['signature'] as String,
      userHandle: json['userHandle'] as String,
    );

Map<String, dynamic> _$FinishLoginPlatformResponseToJson(
        FinishLoginPlatformResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'authenticatorData': instance.authenticatorData,
      'signature': instance.signature,
      'userHandle': instance.userHandle,
    };
