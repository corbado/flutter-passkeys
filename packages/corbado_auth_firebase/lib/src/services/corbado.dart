import 'dart:convert';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_firebase/src/exceptions.dart';
import 'package:passkeys/types.dart';

/// Wraps the Corbado Firebase Functions used for passkey and OTP flows.
class CorbadoService {
  /// Creates a [CorbadoService] backed by the given [functions] instance.
  CorbadoService(FirebaseFunctions functions) : _functions = functions;

  /// Returns a lazily created singleton backed by the default Firebase
  /// Functions instance.
  factory CorbadoService.getInstance() {
    return _instance ??= CorbadoService(FirebaseFunctions.instance);
  }

  final FirebaseFunctions _functions;
  static final _functionOptions = HttpsCallableOptions(
    timeout: const Duration(seconds: 10),
  );

  String? _ongoingEmailOTPCodeID;

  static CorbadoService? _instance;

  /// Starts a passkey sign up and returns the registration challenge.
  Future<RegisterRequestType> startSignUpWithPasskey(
    String email,
    String userAgent,
  ) async {
    try {
      final startResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-startSignUpWithPasskey',
            options: _functionOptions,
          )
          .call<String>({'username': email, 'userAgent': userAgent});
      final json = jsonDecode(startResponse.data) as Map<String, dynamic>;

      return StartRegisterResponse.fromJson(json).toPlatformType();
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Completes a passkey sign up and returns a Firebase auth token.
  Future<String> finishSignUpWithPasskey(
    RegisterResponseType platformResponse,
    String userAgent,
  ) async {
    try {
      final finishRequest = FinishRegisterRequest.fromRegisterCompleteRequest(
        platformResponse,
      );

      final signedChallenge = jsonEncode(finishRequest.toJson());
      final finishResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-finishSignUpWithPasskey',
            options: _functionOptions,
          )
          .call<String>({
            'signedChallenge': signedChallenge,
            'userAgent': userAgent,
          });

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Starts a passkey login and returns the authentication challenge.
  Future<AuthenticateRequestType> startLoginWithPasskey(
    String email,
    String userAgent, {
    bool conditional = false,
  }) async {
    try {
      final startResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-startLoginWithPasskey',
            options: _functionOptions,
          )
          .call<String>({'username': email, 'userAgent': userAgent});
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

  /// Completes a passkey login and returns a Firebase auth token.
  Future<String> finishLoginWithPasskey(
    AuthenticateResponseType platformResponse,
    String userAgent,
  ) async {
    try {
      final finishRequest = FinishLoginRequest.fromPlatformType(
        platformResponse,
      );
      final signedChallenge = jsonEncode(finishRequest.toJson());
      final finishResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-finishLoginWithPasskey',
            options: _functionOptions,
          )
          .call<String>({
            'signedChallenge': signedChallenge,
            'userAgent': userAgent,
          });

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Starts an email one-time-password login by sending a code to [email].
  Future<void> startLoginWithEmailOTP(String email) async {
    try {
      final startResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-startLoginWithEmailOTP',
            options: _functionOptions,
          )
          .call<String>({'username': email});

      _ongoingEmailOTPCodeID = startResponse.data;

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Completes an email one-time-password login using [code] and returns a
  /// Firebase auth token.
  Future<String> finishLoginWithEmailOTP(String code) async {
    try {
      final finishResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-finishLoginWithEmailOTP',
            options: _functionOptions,
          )
          .call<String>({'emailCodeID': _ongoingEmailOTPCodeID, 'code': code});

      return finishResponse.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Starts appending a passkey to an existing user and returns the
  /// registration challenge.
  Future<RegisterRequestType> startPasskeyAppend(
    String firebaseToken,
    String userAgent,
  ) async {
    try {
      final startResponse = await _functions
          .httpsCallable(
            'ext-authentication-corbado-startPasskeyAppend',
            options: _functionOptions,
          )
          .call<String>({
            'firebaseToken': firebaseToken,
            'userAgent': userAgent,
          });
      final json = jsonDecode(startResponse.data) as Map<String, dynamic>;

      return StartRegisterResponse.fromJson(json).toPlatformType();
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Completes appending a passkey and returns whether it succeeded.
  Future<bool> finishPasskeyAppend(
    String firebaseToken,
    RegisterResponseType platformResponse,
    String userAgent,
  ) async {
    try {
      final finishRequest = FinishRegisterRequest.fromRegisterCompleteRequest(
        platformResponse,
      );

      final signedChallenge = jsonEncode(finishRequest.toJson());
      final res = await _functions
          .httpsCallable(
            'ext-authentication-corbado-finishPasskeyAppend',
            options: _functionOptions,
          )
          .call<bool>({
            'firebaseToken': firebaseToken,
            'signedChallenge': signedChallenge,
            'userAgent': userAgent,
          });

      return res.data;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Returns all passkeys registered for the given user.
  Future<List<PasskeyInfo>> getPasskeys(String firebaseToken) async {
    try {
      final res = await _functions
          .httpsCallable(
            'ext-authentication-corbado-getPasskeys',
            options: _functionOptions,
          )
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

  /// Deletes the passkey identified by [passkeyId] for the given user.
  Future<void> deletePasskey(String firebaseToken, String passkeyId) async {
    try {
      await _functions
          .httpsCallable(
            'ext-authentication-corbado-deletePasskey',
            options: _functionOptions,
          )
          .call<void>({'firebaseToken': firebaseToken, 'passkeyId': passkeyId});

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  /// Deletes the given user and all of their associated passkeys.
  Future<void> deleteUser(String firebaseToken) async {
    try {
      await _functions
          .httpsCallable(
            'ext-authentication-corbado-deleteUser',
            options: _functionOptions,
          )
          .call<void>({'firebaseToken': firebaseToken});

      return;
    } on FirebaseFunctionsException catch (e) {
      throw _convertFirebaseFunctionsException(e);
    } catch (e) {
      rethrow;
    }
  }

  Exception _convertFirebaseFunctionsException(FirebaseFunctionsException e) =>
      switch (e.message) {
        'UNKNOWN_USER' => UnknownUserException(''),
        'NO_PASSKEY_AVAILABLE' => NoPasskeyForDeviceException(),
        'USER_ALREADY_EXISTS' => UserAlreadyExistsException(),
        'INVALID_USERNAME' => InvalidUsernameException(),
        'INVALID_OTP_CODE' => InvalidOTPCodeException(),
        'INVALID_AUTH_TOKEN' => InvalidAuthTokenException(),
        'PASSKEY_ALREADY_EXISTS' => PasskeyAlreadyExistsException(),
        _ => UnknownErrorException.fromFirebaseFunctionsException(e),
      };
}
