import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:passkeys/authenticator.dart';

Future<CorbadoService> createClient(String projectId, {required PasskeyAuthenticator passkeyAuthenticator, String? customDomain}) =>
    throw UnsupportedError(
      'Cannot create a client without dart:html or dart:io.',
    );
