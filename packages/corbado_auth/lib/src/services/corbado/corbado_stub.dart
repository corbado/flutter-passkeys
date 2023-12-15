import 'package:corbado_auth/src/services/corbado/corbado.dart';

Future<CorbadoService> createClient(String projectId, {String? customDomain}) =>
    throw UnsupportedError(
      'Cannot create a client without dart:html or dart:io.',
    );
