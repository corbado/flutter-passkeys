// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeySignUpRequest.g.dart';

/// Request payload sent to the Web SDK to register a new passkey.
@JsonSerializable(createFactory: false, explicitToJson: true)
class PasskeySignUpRequest {
  /// Creates a request from the public key credential creation [publicKey].
  PasskeySignUpRequest(this.publicKey);

  /// The public key credential creation options.
  final PublicKey publicKey;

  /// Serializes this request to a JSON map.
  Map<String, dynamic> toJson() => _$PasskeySignUpRequestToJson(this);
}

/// Public key credential creation options for a passkey registration.
@JsonSerializable(createFactory: false, explicitToJson: true)
class PublicKey {
  /// Creates the public key creation options.
  PublicKey(
    this.rp,
    this.user,
    this.challenge,
    this.pubKeyCredParams,
    this.authenticatorSelection,
    this.excludeCredentials,
    this.timeout,
    this.attestation,
  );

  /// The relying party the credential is being created for.
  final RelyingPartyType rp;

  /// The user the credential is being created for.
  final UserType user;

  /// The server-generated challenge to be signed.
  final String challenge;

  /// The credential parameters the relying party supports.
  final List<PubKeyCredParamType> pubKeyCredParams;

  /// The authenticator selection criteria.
  final AuthenticatorSelectionType? authenticatorSelection;

  /// Credentials that must be excluded to avoid duplicate registrations.
  final List<CredentialType> excludeCredentials;

  /// The time in milliseconds the caller is willing to wait for the operation.
  final int? timeout;

  /// The attestation conveyance preference.
  final String? attestation;

  /// Serializes these options to a JSON map.
  Map<String, dynamic> toJson() => _$PublicKeyToJson(this);
}
