import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:passkeys/authenticator.dart';

/// Stub implementation that throws on platforms without dart:html or dart:io.
Future<CorbadoService> createClient(
  String projectId, {
  required PasskeyAuthenticator passkeyAuthenticator,
  @Deprecated('Use the default Corbado frontend API domain instead.')
  String? customDomain,
}) => throw UnsupportedError(
  'Cannot create a client without dart:html or dart:io.',
);
