import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User({required this.idToken, required this.decoded});

  String get email => decoded.email;

  String get username => decoded.name;

  final String idToken;
  final IdToken decoded;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromIdToken(String idToken) {
    final decodedToken = JwtDecoder.decode(idToken);
    final decodedIdToken = IdToken.fromJson(decodedToken);
    return User(idToken: idToken, decoded: decodedIdToken);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class IdToken {
  IdToken(this.iss, this.sub, this.exp, this.nbf, this.iat, this.name,
      this.orig, this.email, this.version);

  final String iss;
  final String sub;
  final int exp;
  final int nbf;
  final int iat;
  final String name;
  final String orig;
  final String email;
  final int version;

  factory IdToken.fromJson(Map<String, dynamic> json) =>
      _$IdTokenFromJson(json);

  Map<String, dynamic> toJson() => _$IdTokenToJson(this);
}
