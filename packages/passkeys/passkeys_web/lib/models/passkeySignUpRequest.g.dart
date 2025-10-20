// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkeySignUpRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PasskeySignUpRequestToJson(
        PasskeySignUpRequest instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey.toJson(),
    };

Map<String, dynamic> _$PublicKeyToJson(PublicKey instance) => <String, dynamic>{
      'rp': instance.rp.toJson(),
      'user': instance.user.toJson(),
      'challenge': instance.challenge,
      'pubKeyCredParams':
          instance.pubKeyCredParams.map((e) => e.toJson()).toList(),
      'authenticatorSelection': instance.authenticatorSelection?.toJson(),
      'excludeCredentials':
          instance.excludeCredentials.map((e) => e.toJson()).toList(),
      'timeout': instance.timeout,
      'attestation': instance.attestation,
    };
