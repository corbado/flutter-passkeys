import 'dart:async';

import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/corbado/corbado_stub.dart'
    if (dart.library.html) 'package:corbado_auth/src/services/corbado/corbado_web.dart'
    if (dart.library.io) 'package:corbado_auth/src/services/corbado/corbado_native.dart';
import 'package:passkeys/authenticator.dart';

/// The Cobardo Auth SDK helps you with bringing passkey authentication to your
/// app.
class CustomCorbadoAuth {
  /// Constructor
  CustomCorbadoAuth() : passkeyAuthenticator = PasskeyAuthenticator();

  final PasskeyAuthenticator passkeyAuthenticator;

  late CorbadoService corbadoService;

  Future<void> init(String projectId, {String? customDomain}) async {
    corbadoService = await createClient(projectId, customDomain: customDomain);
  }
}
