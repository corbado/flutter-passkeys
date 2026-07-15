import 'package:json_annotation/json_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'user.g.dart';

/// The central user object of the Corbado Auth SDK.
@JsonSerializable(explicitToJson: true)
class User {
  /// Constructor
  User({required this.idToken, required this.decoded});

  /// Creates user from json (needed to retrieve it from persistent storage).
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Creates user from idToken,
  factory User.fromIdToken(String idToken) {
    final decodedToken = JwtDecoder.decode(idToken);
    final decodedIdToken = IdToken.fromJson(decodedToken);
    return User(idToken: idToken, decoded: decodedIdToken);
  }

  /// Email address (null, if the user has not yet validated the email).
  String? get email => decoded.email;

  /// Username that has been set during sign up.
  String? get username => decoded.name;

  /// JWT token that encodes the user object (encoded).
  final String idToken;

  /// Decoded JWT token (idToken).
  final IdToken decoded;

  /// Serialize user
  Map<String, dynamic> toJson() => _$UserToJson(this);

  /// Whether the idToken has not yet expired.
  bool hasValidToken() {
    final t = DateTime.fromMillisecondsSinceEpoch(decoded.exp * 1000);
    return t.isAfter(DateTime.now());
  }
}

/// JWT token that is returned from Corbado's API after signIn and signUp.
@JsonSerializable()
class IdToken {
  /// Constructor
  IdToken(
    this.iss,
    this.sub,
    this.exp,
    this.nbf,
    this.iat,
    this.name,
    this.orig,
    this.version, {
    this.email = '',
  });

  /// Deserialize token.
  factory IdToken.fromJson(Map<String, dynamic> json) =>
      _$IdTokenFromJson(json);

  /// Issuer of the token
  final String iss;

  /// Subject (unique user id) of the token.
  final String sub;

  /// Expiration time of the token (seconds since epoch).
  final int exp;

  /// Time before which the token is not valid (seconds since epoch).
  final int nbf;

  /// Time at which the token was issued (seconds since epoch).
  final int iat;

  /// Username
  final String? name;

  /// Origin of the token.
  final String orig;

  /// Null if the email has not been verified by the user.
  final String? email;

  /// Version of the token format.
  final int version;

  /// Serialize token.
  Map<String, dynamic> toJson() => _$IdTokenToJson(this);
}
