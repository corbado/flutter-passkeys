import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';

class CorbadoService {
  final FirebaseFunctions _functions;
  final PasskeyAuthenticator _authenticator = PasskeyAuthenticator();

  static CorbadoService? _instance;

  CorbadoService(FirebaseFunctions functions) : _functions = functions;

  static CorbadoService getInstance() {
    if (_instance == null) {
      _instance = CorbadoService(FirebaseFunctions.instance);
    }
    return _instance!;
  }

  Future<RegisterRequestType> startSignUpWithPasskey(
    String email,
    String fullName,
  ) async {
    final startResponse = await _functions
        .httpsCallable('passkeyRegisterStart',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'username': email, 'fullName': fullName});

    final json =
        jsonDecode(startResponse.data as String) as Map<String, dynamic>;

    return StartRegisterResponse.fromJson(json).toPlatformType();
  }

  Future<String> finishSignUpWithPasskey(
      RegisterResponseType platformResponse) async {
    final finishRequest =
        FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);

    final signedChallenge = jsonEncode(finishRequest.toJson());
    final finishResponse = await _functions
        .httpsCallable('passkeyRegisterFinish',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'signedChallenge': signedChallenge});

    final corbadoToken = finishResponse.data as String;

    return corbadoToken;
  }

  Future<AuthenticateRequestType> startLoginWithPasskey(
    String email, {
    bool conditional = false,
  }) async {
    final startResponse = await _functions
        .httpsCallable('passkeyLoginStart',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'username': email});

    final json =
        jsonDecode(startResponse.data as String) as Map<String, dynamic>;

    return StartLoginResponse.fromJson(json).toPlatformType(
      conditional: conditional,
    );
  }

  Future<String> finishLoginWithPasskey(
    AuthenticateResponseType platformResponse,
  ) async {
    final finishRequest = FinishLoginRequest.fromPlatformType(platformResponse);

    final signedChallenge = jsonEncode(finishRequest.toJson());

    final finishResponse = await _functions
        .httpsCallable('passkeyLoginFinish',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'signedChallenge': signedChallenge});

    final corbadoToken = finishResponse.data as String;

    return corbadoToken;
  }

  Future<RegisterRequestType> startPasskeyAppend(
    String firebaseToken,
  ) async {
    final startResponse = await _functions
        .httpsCallable('passkeyAppendStart',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'firebaseToken': firebaseToken});

    final json =
        jsonDecode(startResponse.data as String) as Map<String, dynamic>;

    return StartRegisterResponse.fromJson(json).toPlatformType();
  }

  Future<void> finishPasskeyAppend(
    String firebaseToken,
    RegisterResponseType platformResponse,
  ) async {
    final finishRequest =
        FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);

    final signedChallenge = jsonEncode(finishRequest.toJson());
    final finishResponse = await _functions
        .httpsCallable('passkeyAppendFinish',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({
      'firebaseToken': firebaseToken,
      'signedChallenge': signedChallenge
    });

    return;
  }

  Future<List<PasskeyInfo>> getPasskeys(String firebaseToken) async {
    final res = await _functions
        .httpsCallable('passkeyList',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'firebaseToken': firebaseToken});

    final json = jsonDecode(res.data as String) as List<dynamic>;
    return json
        .map((e) => PasskeyInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> deletePasskey(String firebaseToken, String passkeyId) async {
    await _functions
        .httpsCallable('passkeyDelete',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'firebaseToken': firebaseToken, 'passkeyId': passkeyId});

    return;
  }

  Future<void> deleteUser(String firebaseToken) async {
    await _functions
        .httpsCallable('userDelete',
            options: HttpsCallableOptions(timeout: const Duration(seconds: 10)))
        .call({'firebaseToken': firebaseToken});

    return;
  }
}
