// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialType _$CredentialTypeFromJson(Map<String, dynamic> json) =>
    CredentialType(
      type: json['type'] as String,
      id: json['id'] as String,
      transports: (json['transports'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CredentialTypeToJson(CredentialType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'transports': instance.transports,
    };
