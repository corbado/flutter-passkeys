import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/passkey_append_block.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart' as Api;
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:dio/dio.dart';
import 'package:passkeys/authenticator.dart';

abstract class CorbadoService {
  final Api.CorbadoFrontendApiClient frontendAPIClient;
  final PasskeyAuthenticator passkeyAuthenticator;

  String? _processID;
  DateTime? _processExpiresAt;

  CorbadoService(this.frontendAPIClient, this.passkeyAuthenticator);

  Future<Api.ProcessResponse> initAuthProcess() async {
    final processInitReq = Api.ProcessInitReqBuilder().build();
    final res = await frontendAPIClient.getAuthApi().processInit(processInitReq: processInitReq);
    if (res.data == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    this.frontendAPIClient.dio.options.headers.addAll({
      'x-corbado-process-id': res.data!.token,
    });

    _processID = res.data!.token;
    _processExpiresAt = DateTime.fromMillisecondsSinceEpoch(res.data!.expiresAt * 1000);

    return res.data!.processResponse;
  }

  void clearAuthProcess() {
    _processID = null;
    _processExpiresAt = null;
  }

  Future<Api.ProcessResponse> signupInit({String? email, String? fullName}) async {
    final identifierBuilder = ListBuilder<Api.LoginIdentifier>();
    if (email != null) {
      identifierBuilder.add(
        Api.LoginIdentifier(
          (b) => b
            ..type = Api.LoginIdentifierType.email
            ..identifier = email,
        ),
      );
    }

    final signupInitReq = Api.SignupInitReq((b) => b
      ..fullName = fullName
      ..identifiers = identifierBuilder);

    return _wrapWithError(
      () => frontendAPIClient.getAuthApi().signupInit(
            signupInitReq: signupInitReq,
          ),
    );
  }

  Future<Api.ProcessResponse> loginInit(String loginIdentifier, bool isPhone) async {
    final req = Api.LoginInitReq((b) => b
      ..identifierValue = loginIdentifier
      ..isPhone = isPhone);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().loginInit(loginInitReq: req));
  }

  Future<Api.ProcessResponse> finishPasskeyMediation(String signedChallenge) async {
    final req = Api.PasskeyMediationFinishReq((b) => b..signedChallenge = signedChallenge);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().passkeyMediationFinish(passkeyMediationFinishReq: req));
  }

  Future<Api.ProcessResponse> verifyEmailOtpCode(String code) async {
    final req = Api.IdentifierVerifyFinishReq((b) => b
      ..code = code
      ..identifierType = Api.LoginIdentifierType.email
      ..verificationType = Api.VerificationMethod.emailOtp
      ..isNewDevice = false);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyFinish(identifierVerifyFinishReq: req));
  }

  Future<Api.ProcessResponse> sendEmailOtpCode() async {
    final req = Api.IdentifierVerifyStartReq((b) => b
      ..identifierType = Api.LoginIdentifierType.email
      ..verificationType = Api.VerificationMethod.emailOtp);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<Api.ProcessResponse> sendEmailLink() async {
    final req = Api.IdentifierVerifyStartReq((b) => b
      ..identifierType = Api.LoginIdentifierType.email
      ..verificationType = Api.VerificationMethod.emailLink);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<Api.ProcessResponse> updateEmail(String email) async {
    final req = Api.IdentifierUpdateReq((b) => b
      ..identifierType = Api.LoginIdentifierType.email
      ..value = email);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierUpdate(identifierUpdateReq: req));
  }

  /// passkey related functionalities
  Future<Api.ProcessResponse> appendPasskey() async {
    final startRes = await _wrapWithError(
        () => frontendAPIClient.getAuthApi().passkeyAppendStart(passkeyAppendStartReq: PasskeyAppendStartReq()));
    if (startRes.blockBody.error != null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final body = startRes.blockBody.data.oneOf.value as Api.GeneralBlockPasskeyAppend;
    final json = jsonDecode(body.challenge) as Map<String, dynamic>;

    final authenticatorReq = StartRegisterResponse.fromJson(json).toPlatformType();
    final authenticatorRes = await passkeyAuthenticator.register(authenticatorReq);
    final attestationResponse =
        jsonEncode(FinishRegisterRequest.fromRegisterCompleteRequest(authenticatorRes).toJson());
    final passkeyAppendReq = Api.PasskeyAppendFinishReq((b) => b..signedChallenge = attestationResponse);

    return _wrapWithError(
        () => frontendAPIClient.getAuthApi().passkeyAppendFinish(passkeyAppendFinishReq: passkeyAppendReq));
  }

  Future<Api.ProcessResponse> verifyPasskey() async {
    final startRes = await _wrapWithError(
            () => frontendAPIClient.getAuthApi().passkeyLoginStart(passkeyLoginStartReq: Api.PasskeyLoginStartReq()));
    if (startRes.blockBody.error != null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final body = startRes.blockBody.data.oneOf.value as Api.GeneralBlockPasskeyVerify;
    final json = jsonDecode(body.challenge) as Map<String, dynamic>;

    final authenticatorReq = StartLoginResponse.fromJson(json).toPlatformType(conditional: false);
    final authenticatorRes = await passkeyAuthenticator.authenticate(authenticatorReq);
    final assertionResponse =
    jsonEncode(FinishLoginRequest.fromPlatformType(authenticatorRes).toJson());
    final passkeyLoginFinishReq = Api.PasskeyLoginFinishReq((b) => b..signedChallenge = assertionResponse);

    return _wrapWithError(
            () => frontendAPIClient.getAuthApi().passkeyLoginFinish(passkeyLoginFinishReq: passkeyLoginFinishReq));
  }

  Future<void> cancelPasskeyOperation() async {}

  Future<Api.ProcessResponse> _wrapWithError(Future<Response<Api.ProcessResponse?>> Function() callback) async {
    Response<Api.ProcessResponse?> response;
    try {
      response = await callback();
    } catch (e) {
      throw CorbadoError.fromUnknownError(e);
    }

    if (response.data == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    return response.data!;
  }

  /// Builds an API client to interact with the Corbado frontend API.
  /// Depending on the platform different headers will be set.
  static String getFrontendAPIDomain(String projectId, {String? customDomain}) {
    var frontendAPIDomain = 'https://$projectId.frontendapi.corbado.io';
    if (customDomain != null && customDomain.isNotEmpty) {
      frontendAPIDomain = customDomain;
    }

    return frontendAPIDomain;
  }
}
