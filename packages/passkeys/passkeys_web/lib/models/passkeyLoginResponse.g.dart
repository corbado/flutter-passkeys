// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkeyLoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasskeyLoginResponse _$PasskeyLoginResponseFromJson(
        Map<String, dynamic> json) =>
    PasskeyLoginResponse(
      json['id'] as String,
      json['rawId'] as String,
      AssertionResponse.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PasskeyLoginResponseToJson(
        PasskeyLoginResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response,
    };

AssertionResponse _$AssertionResponseFromJson(Map<String, dynamic> json) =>
    AssertionResponse(
      json['clientDataJSON'] as String,
      json['authenticatorData'] as String,
      json['signature'] as String,
      json['userHandle'] as String?,
    );

Map<String, dynamic> _$AssertionResponseToJson(AssertionResponse instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'authenticatorData': instance.authenticatorData,
      'signature': instance.signature,
      'userHandle': instance.userHandle,
    };
