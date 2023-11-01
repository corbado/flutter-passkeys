// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkeyLoginRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasskeyLoginRequest _$PasskeyLoginRequestFromJson(Map<String, dynamic> json) =>
    PasskeyLoginRequest(
      PasskeyLoginPublicKey.fromJson(json['publicKey'] as Map<String, dynamic>),
      mediation: json['mediation'] as String? ?? 'conditional',
    );

Map<String, dynamic> _$PasskeyLoginRequestToJson(
        PasskeyLoginRequest instance) =>
    <String, dynamic>{
      'mediation': instance.mediation,
      'publicKey': instance.publicKey.toJson(),
    };

PasskeyLoginPublicKey _$PasskeyLoginPublicKeyFromJson(
        Map<String, dynamic> json) =>
    PasskeyLoginPublicKey(
      challenge: json['challenge'] as String,
      timeout: json['timeout'] as int?,
      rpId: json['rpId'] as String?,
      allowCredentials: (json['allowCredentials'] as List<dynamic>?)
          ?.map((e) => PasskeyLoginAllowCredentialType.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      userVerification: $enumDecodeNullable(
          _$UserVerificationRequirementEnumMap, json['userVerification']),
      loginExtensions: json['loginExtensions'] == null
          ? null
          : LoginExtensions.fromJson(
              json['loginExtensions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PasskeyLoginPublicKeyToJson(
        PasskeyLoginPublicKey instance) =>
    <String, dynamic>{
      'challenge': instance.challenge,
      'timeout': instance.timeout,
      'rpId': instance.rpId,
      'allowCredentials':
          instance.allowCredentials?.map((e) => e.toJson()).toList(),
      'userVerification':
          _$UserVerificationRequirementEnumMap[instance.userVerification],
      'loginExtensions': instance.loginExtensions?.toJson(),
    };

const _$UserVerificationRequirementEnumMap = {
  UserVerificationRequirement.Discouraged: 'discouraged',
  UserVerificationRequirement.Preferred: 'preferred',
  UserVerificationRequirement.Required: 'required',
};

PasskeyLoginAllowCredentialType _$PasskeyLoginAllowCredentialTypeFromJson(
        Map<String, dynamic> json) =>
    PasskeyLoginAllowCredentialType(
      json['type'] as String,
      json['id'] as String,
      (json['transports'] as List<dynamic>)
          .map((e) => $enumDecode(_$AuthenticatorTransportEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$PasskeyLoginAllowCredentialTypeToJson(
        PasskeyLoginAllowCredentialType instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'transports': instance.transports
          .map((e) => _$AuthenticatorTransportEnumMap[e]!)
          .toList(),
    };

const _$AuthenticatorTransportEnumMap = {
  AuthenticatorTransport.Internal: 'internal',
};

LoginExtensions _$LoginExtensionsFromJson(Map<String, dynamic> json) =>
    LoginExtensions(
      json['appid'] as String?,
      json['appidExclude'] as String?,
      json['credProps'] as String?,
    );

Map<String, dynamic> _$LoginExtensionsToJson(LoginExtensions instance) =>
    <String, dynamic>{
      'appid': instance.appid,
      'appidExclude': instance.appidExclude,
      'credProps': instance.credProps,
    };
