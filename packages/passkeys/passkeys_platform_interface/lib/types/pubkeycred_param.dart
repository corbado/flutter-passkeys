import 'package:json_annotation/json_annotation.dart';

part 'pubkeycred_param.g.dart';

/// The [PubKeyCredParamType] class wraps the data of a public key credential
/// parameter.
/// It is used to specify the type and algorithm of the public key credential
/// that is being requested.
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

  /// The type of the public key credential.
  final String type;

  /// The algorithm used for the public key credential, i.e. `-7` for `ES256` or
  /// `-257` for RS256.
  /// See [IANA COSE](https://www.iana.org/assignments/cose/cose.xhtml#algorithms) for a list of all options.
  final int alg;

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() => _$PubKeyCredParamTypeToJson(this);
}
