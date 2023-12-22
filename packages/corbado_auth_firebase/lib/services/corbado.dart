import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';

class CorbadoService {
  final FirebaseFunctions _functions;

  static CorbadoService? _instance;

  CorbadoService(FirebaseFunctions functions) : _functions = functions;

  static CorbadoService getInstance() {
    if (_instance == null) {
      _instance = CorbadoService(FirebaseFunctions.instance);
    }
    return _instance!;
  }

  Future<void> startSignUpWithPasskey(
    String email,
    String fullName,
  ) async {
    final response = await _functions
        .httpsCallable('passkeyRegisterStart',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'email': email, 'fullName': fullName});

    final map = jsonDecode(response as String) as Map<String, dynamic>;

    return;
  }
}
