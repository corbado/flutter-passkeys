import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_firebase/src/exceptions.dart';
import 'package:passkeys/types.dart';

class CorbadoService {
  final FirebaseFunctions _functions;
  static final _functionOptions = HttpsCallableOptions(
    timeout: const Duration(seconds: 10),
  );

  String? _ongoingEmailOTPCodeID;

  static CorbadoService? _instance;

  CorbadoService(FirebaseFunctions functions) : _functions = functions;

  static CorbadoService getInstance() {
    _instance ??= CorbadoService(FirebaseFunctions.instance);
    return _instance!;
  }

  Future<RegisterRequestType> startSignUpWithPasskey(
    String email,
    String fullName,
  ) async {
    try {
      final startResponse = await _functions
          .httpsCallable('startSignUpWithPasskey', options: _functionOptions)
          .call<String>({'username': email, 'fullName': fullName});
      final json = jsonDecode(startResponse.data) as Map<String, dynamic>;

      return StartRegisterResponse.fromJson(json).toPlatformType();
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> finishSignUpWithPasskey(
      RegisterResponseType platformResponse) async {
    try {
      final finishRequest = FinishRegisterRequest.fromRegisterCompleteRequest(
        platformResponse,
      );

      final signedChallenge = jsonEncode(finishRequest.toJson());
      final finishResponse = await _functions
          .httpsCallable('finishSignUpWithPasskey', options: _functionOptions)
          .call<String>({'signedChallenge': signedChallenge});

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthenticateRequestType> startLoginWithPasskey(
    String email, {
    bool conditional = false,
  }) async {
    try {
      final startResponse = await _functions
          .httpsCallable('startLoginWithPasskey', options: _functionOptions)
          .call<String>({'username': email});
      final json = jsonDecode(startResponse.data) as Map<String, dynamic>;

      return StartLoginResponse.fromJson(json).toPlatformType(
        conditional: conditional,
      );
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> finishLoginWithPasskey(
    AuthenticateResponseType platformResponse,
  ) async {
    try {
      final finishRequest = FinishLoginRequest.fromPlatformType(
        platformResponse,
      );
      final signedChallenge = jsonEncode(finishRequest.toJson());
      final finishResponse = await _functions
          .httpsCallable('finishLoginWithPasskey', options: _functionOptions)
          .call<String>({'signedChallenge': signedChallenge});

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> startLoginWithEmailOTP(String email) async {
    try {
      final startResponse = await _functions
          .httpsCallable('startLoginWithEmailOTP', options: _functionOptions)
          .call<String>({'username': email});

      _ongoingEmailOTPCodeID = startResponse.data;

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> finishLoginWithEmailOTP(String code) async {
    try {
      final finishResponse = await _functions
          .httpsCallable('finishLoginWithEmailOTP', options: _functionOptions)
          .call<String>({'emailCodeID': _ongoingEmailOTPCodeID, 'code': code});

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<RegisterRequestType> startPasskeyAppend(
    String firebaseToken,
  ) async {
    try {
      final startResponse = await _functions
          .httpsCallable('startPasskeyAppend', options: _functionOptions)
          .call<String>({'firebaseToken': firebaseToken});
      final json = jsonDecode(startResponse.data) as Map<String, dynamic>;

      return StartRegisterResponse.fromJson(json).toPlatformType();
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> finishPasskeyAppend(
    String firebaseToken,
    RegisterResponseType platformResponse,
  ) async {
    try {
      final finishRequest =
          FinishRegisterRequest.fromRegisterCompleteRequest(platformResponse);

      final signedChallenge = jsonEncode(finishRequest.toJson());
      final res = await _functions
          .httpsCallable('finishPasskeyAppend', options: _functionOptions)
          .call<bool>({
        'firebaseToken': firebaseToken,
        'signedChallenge': signedChallenge,
      });

      return res.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PasskeyInfo>> getPasskeys(String firebaseToken) async {
    try {
      final res = await _functions
          .httpsCallable('getPasskeys', options: _functionOptions)
          .call<String>({'firebaseToken': firebaseToken});

      final json = jsonDecode(res.data) as List<dynamic>;
      return json
          .map((e) => PasskeyInfo.fromJson(e as Map<String, dynamic>))
          .toList();
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deletePasskey(String firebaseToken, String passkeyId) async {
    try {
      await _functions
          .httpsCallable('deletePasskey', options: _functionOptions)
          .call<void>({'firebaseToken': firebaseToken, 'passkeyId': passkeyId});

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String firebaseToken) async {
    try {
      await _functions
          .httpsCallable('deleteUser', options: _functionOptions)
          .call<void>({'firebaseToken': firebaseToken});

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Exception _convertFirebaseFunctionsException(FirebaseFunctionsException e) {
    switch (e.message) {
      case 'UNKNOWN_USER':
        return UnknownUserException('');
      case 'NO_PASSKEY_AVAILABLE':
        return NoPasskeyForDeviceException();
      case 'USER_ALREADY_EXISTS':
        return UserAlreadyExistsException();
      case 'INVALID_USERNAME':
        return InvalidUsernameException();
      case 'INVALID_OTP_CODE':
        return InvalidOTPCodeException();
      case 'INVALID_AUTH_TOKEN':
        return InvalidAuthTokenException();
      case 'PASSKEY_ALREADY_EXISTS':
        return PasskeyAlreadyExistsException();
      case 'UNKNOWN_ERROR':
        return UnknownErrorException.fromFirebaseFunctionsException(e);
    }

    return UnknownErrorException.fromFirebaseFunctionsException(e);
  }
}
