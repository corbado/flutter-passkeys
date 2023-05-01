// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      idToken: json['idToken'] as String,
      decoded: IdToken.fromJson(json['decoded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'idToken': instance.idToken,
      'decoded': instance.decoded.toJson(),
    };

IdToken _$IdTokenFromJson(Map<String, dynamic> json) => IdToken(
      json['iss'] as String,
      json['sub'] as String,
      json['exp'] as int,
      json['nbf'] as int,
      json['iat'] as int,
      json['name'] as String,
      json['orig'] as String,
      json['email'] as String?,
      json['version'] as int,
    );

Map<String, dynamic> _$IdTokenToJson(IdToken instance) => <String, dynamic>{
      'iss': instance.iss,
      'sub': instance.sub,
      'exp': instance.exp,
      'nbf': instance.nbf,
      'iat': instance.iat,
      'name': instance.name,
      'orig': instance.orig,
      'email': instance.email,
      'version': instance.version,
    };
