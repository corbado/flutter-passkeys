// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exceptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackendMessage _$BackendMessageFromJson(Map<String, dynamic> json) =>
    BackendMessage(
      type: json['type'] as String,
      validation: (json['validation'] as List<dynamic>?)
          ?.map(
              (e) => BackendValidationError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BackendMessageToJson(BackendMessage instance) =>
    <String, dynamic>{
      'type': instance.type,
      'validation': instance.validation?.map((e) => e.toJson()).toList(),
    };

BackendValidationError _$BackendValidationErrorFromJson(
        Map<String, dynamic> json) =>
    BackendValidationError(
      field: json['field'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$BackendValidationErrorToJson(
        BackendValidationError instance) =>
    <String, dynamic>{
      'field': instance.field,
      'message': instance.message,
    };
