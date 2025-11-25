import 'dart:convert';

import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/relying_party.dart';
import 'package:passkeys_platform_interface/types/user.dart';

/// The [RegisterRequestType] is used to create a registration request and send it to the
/// platform.
class RegisterRequestType {
  /// Constructs a new instance.
  const RegisterRequestType({
    required this.challenge,
    required this.relyingParty,
    required this.user,
    required this.excludeCredentials,
    this.authSelectionType,
    this.pubKeyCredParams,
    this.timeout,
    this.attestation,
  });

  /// Constructs a new instance from a JSON string.
  factory RegisterRequestType.fromJsonString(String jsonString) =>
      RegisterRequestType.fromJson(
          jsonDecode(jsonString) as Map<String, dynamic>);

  /// Constructs a new instance from a JSON map.
  factory RegisterRequestType.fromJson(Map<String, dynamic> json) {
    final excludeCredentials = json['excludeCredentials'] as List<dynamic>?;

    return RegisterRequestType(
      challenge: json['challenge'] as String,
      relyingParty:
          RelyingPartyType.fromJson(json['rp'] as Map<String, dynamic>),
      user: UserType.fromJson(json['user'] as Map<String, dynamic>),
      excludeCredentials: excludeCredentials != null
          ? excludeCredentials
              .map((e) => CredentialType.fromJson(e as Map<String, dynamic>))
              .toList()
          : [],
      authSelectionType: json['authenticatorSelection'] != null
          ? AuthenticatorSelectionType.fromJson(
              json['authenticatorSelection'] as Map<String, dynamic>)
          : null,
      pubKeyCredParams: json['pubKeyCredParams'] != null
          ? (json['pubKeyCredParams'] as List<dynamic>)
              .map((e) =>
                  PubKeyCredParamType.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      timeout: json['timeout'] as int?,
      attestation: json['attestation'] as String?,
    );
  }

  /// The Base64URL encoded challenge _without_ padding.
  final String challenge;

  /// The relying party.
  final RelyingPartyType relyingParty;

  /// The user.
  final UserType user;

  /// The authenticator selection type.
  final AuthenticatorSelectionType? authSelectionType;

  /// A list of public key credential parameters.
  final List<PubKeyCredParamType>? pubKeyCredParams;

  /// A list of credentials to exclude from the registration.
  /// This is typically used to prevent the user from registering the same
  /// credential multiple times.
  final List<CredentialType> excludeCredentials;

  /// The timeout in milliseconds.
  final int? timeout;

  /// The requested attestation level. Controls how the authenticator's attestation
  /// information is conveyed to the relying party. Possible values are:
  /// - "none": Replaces identifying information with non-identifying versions
  /// - "indirect": May replace attestation data with privacy-friendly versions
  /// - "direct"/"enterprise": Conveys unaltered attestation information
  final String? attestation;

  /// Converts this instance to a JSON string.
  String toJsonString() => jsonEncode(toJson());

  /// Converts this instance to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'challenge': challenge,
      'rp': relyingParty.toJson(),
      'user': user.toJson(),
      if (pubKeyCredParams != null)
        'pubKeyCredParams': pubKeyCredParams!.map((e) => e.toJson()).toList(),
      if (timeout != null) 'timeout': timeout,
      if (excludeCredentials.isNotEmpty)
        'excludeCredentials':
            excludeCredentials.map((e) => e.toJson()).toList(),
      if (authSelectionType != null)
        'authenticatorSelection': authSelectionType!.toJson(),
      if (attestation != null) 'attestation': attestation,
    };
  }
}
