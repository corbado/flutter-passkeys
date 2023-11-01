import 'package:json_annotation/json_annotation.dart';

part 'pubkeycred_param.g.dart';

@JsonSerializable()
class PubKeyCredParamType {
  /// Constructs a new instance.
  PubKeyCredParamType({
    required this.type,
    required this.alg,
  });

  /// Constructs a new instance from a JSON map.
  factory PubKeyCredParamType.fromJson(Map<String, dynamic> json) =>
      _$PubKeyCredParamTypeFromJson(json);

  ///
  final String type;

  ///
  final int alg;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$PubKeyCredParamTypeToJson(this);
}
