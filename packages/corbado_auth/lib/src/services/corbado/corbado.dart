import 'dart:convert';

import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/types/auth_response.dart';
import 'package:corbado_auth/src/types/email_otp_state.dart';
import 'package:corbado_auth/src/types/exceptions/exceptions.dart';
import 'package:corbado_auth/src/types/project_config.dart';
import 'package:corbado_auth/src/types/webauthn/authentication.dart';
import 'package:corbado_auth/src/types/webauthn/registration.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

abstract class CorbadoService {
  final ApiClient frontendAPIClient;

  CorbadoService(this.frontendAPIClient);

  Future<StartRegisterResponse> startAppendPasskey({String? token});

  Future<void> finishAppendPasskey(
    FinishRegisterRequest request, {
    String? token,
  });

  Future<void> deletePasskey(String credentialID, {String? token});

  Future<List<PasskeyInfo>> getPasskeys({String? token});

  Future<EmailOTPState> startSignUpWithEmailCode(
    String email,
    String fullName,
  ) async {
    try {
      final req = EmailCodeRegisterStartReq(email: email, username: fullName);
      final res = await UsersApi(frontendAPIClient).emailCodeRegisterStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailLinkRegisterStart', '');
      }

      return EmailOTPState(EmailOTPFlow.SignUp, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeRegisterStart',
        e.message ?? '',
      );
    }
  }

  Future<StartRegisterResponse> startSignUpWithPasskey(
    String email,
    String fullName,
  ) async {
    try {
      final result = await UsersApi(frontendAPIClient).passKeyRegisterStart(
        PassKeyRegisterStartReq(
          username: email,
          fullName: fullName,
        ),
      );

      if (result == null) {
        throw UnexpectedBackendException(
          'passKeyRegisterStart',
          'result was null',
        );
      }

      final json = jsonDecode(result.data.challenge) as Map<String, dynamic>;
      return StartRegisterResponse.fromJson(json);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyRegisterStart',
        e.message ?? '',
      );
    }
  }

  Future<AuthResponse> finishSignUpWithPasskey(
      FinishRegisterRequest request) async {
    try {
      final signedChallenge = jsonEncode(request.toJson());
      final result =
          await UsersApi(frontendAPIClient).passKeyRegisterFinishWithHttpInfo(
        PassKeyFinishReq(signedChallenge: signedChallenge),
      );

      final authResponse = await AuthResponse.fromHttpResponse(result);

      return authResponse;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyRegisterFinish',
        e.message ?? '',
      );
    }
  }

  Future<EmailOTPState> startLoginWithEmailCode(
    String email,
  ) async {
    try {
      final req = EmailCodeLoginStartReq(username: email);
      final res = await UsersApi(frontendAPIClient).emailCodeLoginStart(req);
      if (res == null) {
        throw UnexpectedBackendException('emailCodeLoginStart', '');
      }

      return EmailOTPState(EmailOTPFlow.SignUp, res.data.emailCodeID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeLoginStart',
        e.message ?? '',
      );
    }
  }

  Future<StartLoginResponse> startLoginWithPasskey(
    String email,
    bool conditional,
  ) async {
    try {
      String challenge;
      if (conditional) {
        final result = await UsersApi(frontendAPIClient).passKeyMediationStart(
          PassKeyMediationStartReq(username: email),
        );

        if (result == null) {
          throw Exception(
            'An unknown error occurred during the Corbado API call',
          );
        }

        challenge = result.data.challenge;
      } else {
        final result = await UsersApi(frontendAPIClient).passKeyLoginStart(
          PassKeyLoginStartReq(username: email),
        );

        if (result == null) {
          throw Exception(
            'An unknown error occurred during the Corbado API call',
          );
        }

        challenge = result.data.challenge;
      }

      if (challenge.isEmpty) {
        throw NoPasskeyForDeviceException();
      }

      final json = jsonDecode(challenge) as Map<String, dynamic>;
      return StartLoginResponse.fromJson(json);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAuthenticateStart',
        e.message ?? '',
      );
    }
  }

  Future<AuthResponse> finishLoginWithPasskey(
      FinishLoginRequest request) async {
    try {
      final signedChallenge = jsonEncode(request.toJson());

      final response =
          await UsersApi(frontendAPIClient).passKeyLoginFinishWithHttpInfo(
        PassKeyFinishReq(signedChallenge: signedChallenge),
      );

      final res = await AuthResponse.fromHttpResponse(response);
      return res;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAuthenticateFinish',
        e.message ?? '',
      );
    }
  }

  Future<AuthResponse> completeEmailCode(
    String emailCodeID,
    String code,
  ) async {
    try {
      final req = EmailCodeConfirmReq(emailCodeID: emailCodeID, code: code);
      final res =
          await UsersApi(frontendAPIClient).emailCodeConfirmWithHttpInfo(req);
      final authResponse = await AuthResponse.fromHttpResponse(res);

      return authResponse;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'emailCodeConfirm',
        e.message ?? '',
      );
    }
  }

  Future<ProjectConfig> getProjectConfig() async {
    try {
      final res = await ProjectsApi(frontendAPIClient).projectConfig();
      return ProjectConfig.fromResponse(res!.data);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'getProjectConfig',
        e.message ?? '',
      );
    }
  }

  /// Builds an API client to interact with the Corbado frontend API.
  /// Depending on the platform different headers will be set.
  static String getFrontendAPIDomain(String projectId, {String? customDomain}) {
    var frontendAPIDomain = 'https://$projectId.frontendapi.corbado.io';
    if (customDomain != null && customDomain.isNotEmpty) {
      frontendAPIDomain = '$customDomain';
    }

    return frontendAPIDomain;
  }
}
