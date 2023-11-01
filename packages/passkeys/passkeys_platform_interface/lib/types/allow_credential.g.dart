// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allow_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllowCredentialType _$AllowCredentialTypeFromJson(Map<String, dynamic> json) =>
    AllowCredentialType(
      type: json['type'] as String,
      id: json['id'] as String,
      transports: (json['transports'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AllowCredentialTypeToJson(
        AllowCredentialType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'transports': instance.transports,
    };
