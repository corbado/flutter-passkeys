// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkeySignUpResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasskeySignUpResponse _$PasskeySignUpResponseFromJson(
        Map<String, dynamic> json) =>
    PasskeySignUpResponse(
      json['id'] as String,
      json['rawId'] as String,
      AttestationResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PasskeySignUpResponseToJson(
        PasskeySignUpResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response,
    };

AttestationResponse _$AttestationResponseFromJson(Map<String, dynamic> json) =>
    AttestationResponse(
      json['clientDataJSON'] as String,
      json['attestationObject'] as String,
      (json['transports'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AttestationResponseToJson(
        AttestationResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'attestationObject': instance.attestationObject,
      'transports': instance.transports,
    };
