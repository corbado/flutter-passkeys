import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/allow_credential.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeyLoginRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class PasskeyLoginRequest {
  factory PasskeyLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginRequestFromJson(json);

  factory PasskeyLoginRequest.fromPlatformType(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? platformUserVerification,
    List<AllowCredentialType>? platformAllowCredentials,
  ) {
    final allowCredentials = platformAllowCredentials?.map((e) {
      return PasskeyLoginAllowCredentialType(
        e.type,
        e.id,
        e.transports.map(AuthenticatorTransport.fromPlatformType).toList(),
      );
    }).toList();

    final publicKey = PasskeyLoginPublicKey(
      challenge: challenge,
      timeout: timeout,
      rpId: relyingPartyId,
      userVerification: platformUserVerification != null
          ? UserVerificationRequirement.fromPlatformType(
              platformUserVerification)
          : null,
      allowCredentials: allowCredentials,
    );

    return PasskeyLoginRequest(publicKey);
  }

  PasskeyLoginRequest(this.publicKey, {this.mediation = 'conditional'});

  final String mediation;
  final PasskeyLoginPublicKey publicKey;

  Map<String, dynamic> toJson() => _$PasskeyLoginRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PasskeyLoginPublicKey {
  factory PasskeyLoginPublicKey.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginPublicKeyFromJson(json);

  PasskeyLoginPublicKey(
      {required this.challenge,
      this.timeout,
      this.rpId,
      this.allowCredentials,
      this.userVerification,
      this.loginExtensions});

  final String challenge;
  final int? timeout;
  final String? rpId;
  final List<PasskeyLoginAllowCredentialType>? allowCredentials;
  final UserVerificationRequirement? userVerification;
  final LoginExtensions? loginExtensions;

  Map<String, dynamic> toJson() => _$PasskeyLoginPublicKeyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PasskeyLoginAllowCredentialType {
  factory PasskeyLoginAllowCredentialType.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginAllowCredentialTypeFromJson(json);

  PasskeyLoginAllowCredentialType(this.type, this.id, this.transports);

  final String type;
  final String id;
  final List<AuthenticatorTransport> transports;

  Map<String, dynamic> toJson() =>
      _$PasskeyLoginAllowCredentialTypeToJson(this);
}

enum AuthenticatorTransport {
  @JsonValue('internal')
  Internal;

  factory AuthenticatorTransport.fromPlatformType(String value) {
    switch (value) {
      case 'internal':
        return AuthenticatorTransport.Internal;
      default:
        throw ArgumentError.value(value);
    }
  }
}

enum UserVerificationRequirement {
  @JsonValue('discouraged')
  Discouraged,
  @JsonValue('preferred')
  Preferred,
  @JsonValue('required')
  Required;

  factory UserVerificationRequirement.fromPlatformType(String value) {
    switch (value) {
      case 'discouraged':
        return UserVerificationRequirement.Discouraged;
      case 'preferred':
        return UserVerificationRequirement.Preferred;
      case 'required':
        return UserVerificationRequirement.Required;
      default:
        throw ArgumentError.value(value);
    }
  }
}

@JsonSerializable(explicitToJson: true)
class LoginExtensions {
  factory LoginExtensions.fromJson(Map<String, dynamic> json) =>
      _$LoginExtensionsFromJson(json);

  LoginExtensions(this.appid, this.appidExclude, this.credProps);

  final String? appid;
  final String? appidExclude;
  final String? credProps;

  Map<String, dynamic> toJson() => _$LoginExtensionsToJson(this);
}
