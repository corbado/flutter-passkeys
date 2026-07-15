// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticator_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticatorSelectionType _$AuthenticatorSelectionTypeFromJson(
  Map<String, dynamic> json,
) => AuthenticatorSelectionType(
  authenticatorAttachment: json['authenticatorAttachment'] as String?,
  requireResidentKey: json['requireResidentKey'] as bool? ?? false,
  residentKey: _readResidentKey(json, 'residentKey') as String,
  userVerification: json['userVerification'] as String? ?? 'preferred',
);

Map<String, dynamic> _$AuthenticatorSelectionTypeToJson(
  AuthenticatorSelectionType instance,
) => <String, dynamic>{
  if (instance.authenticatorAttachment case final value?)
    'authenticatorAttachment': value,
  'requireResidentKey': instance.requireResidentKey,
  'residentKey': instance.residentKey,
  'userVerification': instance.userVerification,
};
