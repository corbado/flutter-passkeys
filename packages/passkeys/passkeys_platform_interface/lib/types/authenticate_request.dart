import 'package:passkeys_platform_interface/types/credential.dart';
import 'package:passkeys_platform_interface/types/mediation.dart';

/// The [AuthenticateRequestType] is used to create an authentication request and send it to the
/// platform.
class AuthenticateRequestType {
  /// Constructs a new instance.
  const AuthenticateRequestType({
    required this.relyingPartyId,
    required this.challenge,
    required this.mediation,
    required this.preferImmediatelyAvailableCredentials,
    this.timeout,
    this.userVerification,
    this.allowCredentials,
  });

  /// The relying party ID.
  /// This is typically the domain of the website that is requesting authentication.
  final String relyingPartyId;

  /// The Base64URL encoded challenge _without_ padding.
  final String challenge;

  /// The timeout in milliseconds.
  /// This is the maximum time the user has to respond to the authentication request.
  final int? timeout;

  /// The user verification requirement.
  /// This can be one of the following values:
  /// - `required`: The user must be verified.
  /// - `preferred`: The user may be verified, but it's not required.
  /// - `discouraged`: The user should not be verified, but it's not required.
  /// If this value is `null`, the default value is `preferred`.
  final String? userVerification;

  /// The list of allowed credentials that the user can use to authenticate.
  /// If this value is `null`, the user can use any credential.
  final List<CredentialType>? allowCredentials;

  /// The mediation type.
  /// This can be one of the following values:
  /// - `silent`: The authentication request is silent and does not require user interaction.
  /// - `optional`: The authentication request is optional and may require user interaction.
  /// - `conditional`: The authentication request is conditional and may require user interaction.
  /// - `required`: The authentication request is required and must require user interaction.
  final MediationType mediation;

  /// The prefer immediately available credentials flag.
  /// If this value is `true`, the platform will prefer credentials that are
  /// immediately available, such as those that are stored on the device.
  final bool preferImmediatelyAvailableCredentials;
}
