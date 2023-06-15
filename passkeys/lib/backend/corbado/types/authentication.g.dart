// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorbadoAuthenticationInitResponse _$CorbadoAuthenticationInitResponseFromJson(
        Map<String, dynamic> json) =>
    CorbadoAuthenticationInitResponse(
      CorbadoAuthenticationResponsePublicKey.fromJson(
          json['publicKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CorbadoAuthenticationInitResponseToJson(
        CorbadoAuthenticationInitResponse instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
    };

CorbadoAuthenticationResponsePublicKey
    _$CorbadoAuthenticationResponsePublicKeyFromJson(
            Map<String, dynamic> json) =>
        CorbadoAuthenticationResponsePublicKey(
          rpId: json['rpId'] as String,
          challenge: json['challenge'] as String,
        );

Map<String, dynamic> _$CorbadoAuthenticationResponsePublicKeyToJson(
        CorbadoAuthenticationResponsePublicKey instance) =>
    <String, dynamic>{
      'rpId': instance.rpId,
      'challenge': instance.challenge,
    };

CorbadoAuthenticationCompleteRequest
    _$CorbadoAuthenticationCompleteRequestFromJson(Map<String, dynamic> json) =>
        CorbadoAuthenticationCompleteRequest(
          id: json['id'] as String,
          rawId: json['rawId'] as String,
          response: CorbadoAuthenticationComplete.fromJson(
              json['response'] as Map<String, dynamic>),
          type: json['type'] as String? ?? 'public-key',
        );

Map<String, dynamic> _$CorbadoAuthenticationCompleteRequestToJson(
        CorbadoAuthenticationCompleteRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rawId': instance.rawId,
      'response': instance.response.toJson(),
      'type': instance.type,
    };

CorbadoAuthenticationComplete _$CorbadoAuthenticationCompleteFromJson(
        Map<String, dynamic> json) =>
    CorbadoAuthenticationComplete(
      clientDataJSON: json['clientDataJSON'] as String,
      authenticatorData: json['authenticatorData'] as String,
      signature: json['signature'] as String,
    );

Map<String, dynamic> _$CorbadoAuthenticationCompleteToJson(
        CorbadoAuthenticationComplete instance) =>
    <String, dynamic>{
      'clientDataJSON': instance.clientDataJSON,
      'authenticatorData': instance.authenticatorData,
      'signature': instance.signature,
    };
