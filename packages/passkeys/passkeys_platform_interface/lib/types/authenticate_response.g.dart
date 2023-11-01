// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateResponseType _$AuthenticateResponseTypeFromJson(
        Map<String, dynamic> json) =>
    AuthenticateResponseType(
      id: json['id'] as String,
      rawId: json['rawId'] as String,
      clientDataJSON: json['clientDataJSON'] as String,
      authenticatorData: json['authenticatorData'] as String,
      signature: json['signature'] as String,
      userHandle: json['userHandle'] as String,
    );

Map<String, dynamic> _$AuthenticateResponseTypeToJson(
        AuthenticateResponseType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'clientDataJSON': instance.clientDataJSON,
      'authenticatorData': instance.authenticatorData,
      'signature': instance.signature,
      'userHandle': instance.userHandle,
    };
