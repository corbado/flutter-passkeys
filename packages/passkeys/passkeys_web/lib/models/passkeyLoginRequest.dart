import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeyLoginRequest.g.dart';

@JsonSerializable(explicitToJson: true)
class PasskeyLoginRequest {
  PasskeyLoginRequest(this.publicKey, this.mediation);

  factory PasskeyLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginRequestFromJson(json);

  factory PasskeyLoginRequest.fromPlatformType(
    String relyingPartyId,
    String challenge,
    int? timeout,
    String? platformUserVerification,
    List<CredentialType>? platformAllowCredentials,
    MediationType platformMediation,
  ) {
    final allowCredentials = platformAllowCredentials?.map((e) {
          return PasskeyLoginAllowCredentialType(
            e.type,
            e.id,
            e.transports.map(AuthenticatorTransport.fromPlatformType).toList(),
          );
        }).toList() ??
        [];

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

    final mediation =
        PasskeyLoginMediationType.fromPlatformType(platformMediation);
    return PasskeyLoginRequest(publicKey, mediation);
  }

  final PasskeyLoginMediationType mediation;
  final PasskeyLoginPublicKey publicKey;

  Map<String, dynamic> toJson() => _$PasskeyLoginRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PasskeyLoginPublicKey {
  PasskeyLoginPublicKey(
      {required this.challenge,
      this.timeout,
      this.rpId,
      this.allowCredentials,
      this.userVerification,
      this.loginExtensions});

  factory PasskeyLoginPublicKey.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginPublicKeyFromJson(json);

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
  PasskeyLoginAllowCredentialType(this.type, this.id, this.transports);

  factory PasskeyLoginAllowCredentialType.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginAllowCredentialTypeFromJson(json);

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

enum PasskeyLoginMediationType {
  @JsonValue('conditional')
  Conditional,
  @JsonValue('optional')
  Optional,
  @JsonValue('required')
  Required,
  @JsonValue('silent')
  Silent;

  factory PasskeyLoginMediationType.fromPlatformType(MediationType value) {
    switch (value) {
      case MediationType.Conditional:
        return PasskeyLoginMediationType.Conditional;
      case MediationType.Optional:
        return PasskeyLoginMediationType.Optional;
      case MediationType.Required:
        return PasskeyLoginMediationType.Required;
      case MediationType.Silent:
        return PasskeyLoginMediationType.Silent;
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
  LoginExtensions(this.appid, this.appidExclude, this.credProps);

  factory LoginExtensions.fromJson(Map<String, dynamic> json) =>
      _$LoginExtensionsFromJson(json);

  final String? appid;
  final String? appidExclude;
  final String? credProps;

  Map<String, dynamic> toJson() => _$LoginExtensionsToJson(this);
}
