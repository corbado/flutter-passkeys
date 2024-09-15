// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasskeyInfo _$PasskeyInfoFromJson(Map<String, dynamic> json) => PasskeyInfo(
      json['id'] as String,
      json['aaguid'] as String,
      json['sourceOS'] as String,
      json['sourceBrowser'] as String,
      json['attestationType'] as String,
      (json['transport'] as List<dynamic>).map((e) => e as String).toList(),
      json['backupEligible'] as bool,
      json['backupState'] as bool,
      json['created'] as String,
    );

Map<String, dynamic> _$PasskeyInfoToJson(PasskeyInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'aaguid': instance.aaguid,
      'sourceOS': instance.sourceOS,
      'sourceBrowser': instance.sourceBrowser,
      'attestationType': instance.attestationType,
      'transport': instance.transport,
      'backupEligible': instance.backupEligible,
      'backupState': instance.backupState,
      'created': instance.created,
    };
