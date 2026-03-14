// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pubkeycred_param.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PubKeyCredParamType _$PubKeyCredParamTypeFromJson(Map<String, dynamic> json) =>
    PubKeyCredParamType(
      type: json['type'] as String,
      alg: (json['alg'] as num).toInt(),
    );

Map<String, dynamic> _$PubKeyCredParamTypeToJson(
  PubKeyCredParamType instance,
) => <String, dynamic>{'type': instance.type, 'alg': instance.alg};
