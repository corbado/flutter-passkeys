import 'package:passkeys_platform_interface/types/authenticator_selection.dart';
import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/pubkeycred_param.dart';
import 'package:passkeys_platform_interface/types/relying_party.dart';
import 'package:passkeys_platform_interface/types/user.dart';

class RegisterRequestType {
  const RegisterRequestType({
    required this.challenge,
    required this.relyingParty,
    required this.user,
    required this.authSelectionType,
    required this.excludeCredentials,
    this.pubKeyCredParams,
    this.timeout,
    this.attestation,
  });

  final String challenge;
  final RelyingPartyType relyingParty;
  final UserType user;
  final AuthenticatorSelectionType authSelectionType;
  final List<PubKeyCredParamType>? pubKeyCredParams;
  final List<CredentialType> excludeCredentials;
  final int? timeout;
  final String? attestation;
}
