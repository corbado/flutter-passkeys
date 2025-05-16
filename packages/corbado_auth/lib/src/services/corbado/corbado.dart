import 'dart:convert';
import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart'
    as api;
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';

abstract class CorbadoService {
  CorbadoService(
      this.frontendAPIClient, this.passkeyAuthenticator, this._storageService);

  final api.CorbadoFrontendApiClient frontendAPIClient;
  final PasskeyAuthenticator passkeyAuthenticator;
  final StorageService _storageService;

  Stream<Result> get resultStream =>
      passkeyAuthenticator.resultStream.distinct();

  String? _processID;
  DateTime? _processExpiresAt;

  Future<api.ProcessResponse> initAuthProcess() async {
    final ciBuilder = await _buildClientInformation();
    final processInitReq =
        api.ProcessInitReq((b) => b..clientInformation = ciBuilder);
    final res = await frontendAPIClient
        .getAuthApi()
        .processInit(processInitReq: processInitReq);
    if (res.data == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    if (res.data!.newClientEnvHandle != null) {
      await _storageService.setClientEnvHandle(res.data!.newClientEnvHandle!);
    }

    _setProcessState(res.data!.token, res.data!.expiresAt);

    return res.data!.processResponse;
  }

  Future<api.ProcessResponse> completeAuthProcess() async {
    return _wrapWithError(
        () => frontendAPIClient.getAuthApi().processComplete());
  }

  Future<api.ProcessResponse> resetAuthProcess() async {
    final out = await _wrapWithError(
        () => frontendAPIClient.getAuthApi().processReset());

    final newProcess = out.newProcess;
    if (newProcess != null) {
      _setProcessState(newProcess.token, newProcess.expiresAt);
    }

    return out;
  }

  void clearAuthProcess() {
    _processID = null;
    _processExpiresAt = null;
  }

  Future<api.ProcessResponse> signupInit(
      {String? email, String? fullName}) async {
    final identifierBuilder = ListBuilder<api.LoginIdentifier>();
    if (email != null) {
      identifierBuilder.add(
        api.LoginIdentifier(
          (b) => b
            ..type = api.LoginIdentifierType.email
            ..identifier = email,
        ),
      );
    }

    final signupInitReq = api.SignupInitReq((b) => b
      ..fullName = fullName
      ..identifiers = identifierBuilder);

    return _wrapWithError(
      () => frontendAPIClient.getAuthApi().signupInit(
            signupInitReq: signupInitReq,
          ),
    );
  }

  Future<api.ProcessResponse> loginInit(
      String loginIdentifier, bool isPhone) async {
    final req = api.LoginInitReq((b) => b
      ..identifierValue = loginIdentifier
      ..isPhone = isPhone);

    return _wrapWithError(
        () => frontendAPIClient.getAuthApi().loginInit(loginInitReq: req));
  }

  Future<api.ProcessResponse> finishPasskeyMediation(
      String signedChallenge) async {
    final req = api.PasskeyMediationFinishReq(
        (b) => b..signedChallenge = signedChallenge);

    return _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .passkeyMediationFinish(passkeyMediationFinishReq: req));
  }

  Future<api.ProcessResponse> verifyEmailOtpCode(String code) async {
    final req = api.IdentifierVerifyFinishReq((b) => b
      ..code = code
      ..identifierType = api.LoginIdentifierType.email
      ..verificationType = api.VerificationMethod.emailOtp
      ..isNewDevice = false);

    return _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .identifierVerifyFinish(identifierVerifyFinishReq: req));
  }

  Future<api.ProcessResponse> sendEmailOtpCode() async {
    final req = api.IdentifierVerifyStartReq((b) => b
      ..identifierType = api.LoginIdentifierType.email
      ..verificationType = api.VerificationMethod.emailOtp);

    return _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<api.ProcessResponse> sendEmailLink() async {
    final req = api.IdentifierVerifyStartReq((b) => b
      ..identifierType = api.LoginIdentifierType.email
      ..verificationType = api.VerificationMethod.emailLink);

    return _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<api.ProcessResponse> updateEmail(String email) async {
    final req = api.IdentifierUpdateReq((b) => b
      ..identifierType = api.LoginIdentifierType.email
      ..value = email);

    return _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .identifierUpdate(identifierUpdateReq: req));
  }

  /// passkey related functionalities
  Future<api.ProcessResponse> appendPasskey() async {
    final startRes = await _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .passkeyAppendStart(passkeyAppendStartReq: PasskeyAppendStartReq()));
    if (startRes.blockBody.error != null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final body =
        startRes.blockBody.data.oneOf.value as api.GeneralBlockPasskeyAppend;
    final json = jsonDecode(body.challenge) as Map<String, dynamic>;

    final authenticatorReq =
        StartRegisterResponse.fromJson(json).toPlatformType();

    try {
      final authenticatorRes =
          await passkeyAuthenticator.register(authenticatorReq);
      final attestationResponse = jsonEncode(
          FinishRegisterRequest.fromRegisterCompleteRequest(authenticatorRes)
              .toJson());
      final passkeyAppendReq = api.PasskeyAppendFinishReq(
          (b) => b..signedChallenge = attestationResponse);

      return _wrapWithError(() => frontendAPIClient
          .getAuthApi()
          .passkeyAppendFinish(passkeyAppendFinishReq: passkeyAppendReq));
    } on AuthenticatorException catch (e) {
      throw CorbadoError.fromAuthenticatorError(e);
    }
  }

  Future<void> sessionAppendPasskey() async {
    final ci = await _buildClientInformation();
    final startReq =
        api.MePasskeysAppendStartReq((b) => b..clientInformation = ci);
    final startRes = await _wrapWithError(() => frontendAPIClient
        .getUsersApi()
        .currentUserPasskeyAppendStart(mePasskeysAppendStartReq: startReq));

    if (startRes.attestationOptions.isEmpty) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final json =
        jsonDecode(startRes.attestationOptions) as Map<String, dynamic>;
    try {
      final authenticatorReq =
          StartRegisterResponse.fromJson(json).toPlatformType();
      final authenticatorRes =
          await passkeyAuthenticator.register(authenticatorReq);
      final attestationResponse = jsonEncode(
          FinishRegisterRequest.fromRegisterCompleteRequest(authenticatorRes)
              .toJson());
      final mePasskeysAppendFinishReq = api.MePasskeysAppendFinishReq((b) => b
        ..attestationResponse = attestationResponse
        ..clientInformation = ci);

      return _wrapWithErrorEmptyResponse(() => frontendAPIClient
          .getUsersApi()
          .currentUserPasskeyAppendFinish(
              mePasskeysAppendFinishReq: mePasskeysAppendFinishReq));
    } on AuthenticatorException catch (e) {
      throw CorbadoError.fromAuthenticatorError(e);
    } catch (e) {
      throw CorbadoError.fromUnknownError(e);
    }
  }

  Future<List<api.Passkey>> sessionListPasskeys({String? token}) async {
    final res = await _wrapWithError(
        () => frontendAPIClient.getUsersApi().currentUserPasskeyGet());

    return res.passkeys.toList();
  }

  Future<void> sessionDeletePasskeys({required String credentialID}) async {
    await _wrapWithError(() => frontendAPIClient
        .getUsersApi()
        .currentUserPasskeyDelete(credentialID: credentialID));
  }

  Future<void> sessionUpdateUser({String? fullname}) async {
    final meUpdateReq = api.MeUpdateReq((b) => b..fullName = fullname);
    await _wrapWithErrorEmptyResponse(() => frontendAPIClient
        .getUsersApi()
        .currentUserUpdate(meUpdateReq: meUpdateReq));
  }

  Future<api.ProcessResponse> verifyPasskey() async {
    final startRes = await _wrapWithError(() => frontendAPIClient
        .getAuthApi()
        .passkeyLoginStart(passkeyLoginStartReq: api.PasskeyLoginStartReq()));
    if (startRes.blockBody.error != null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    final body =
        startRes.blockBody.data.oneOf.value as api.GeneralBlockPasskeyVerify;
    final json = jsonDecode(body.challenge) as Map<String, dynamic>;

    final authenticatorReq = StartLoginResponse.fromJson(json).toPlatformType(
        conditional: false, preferImmediatelyAvailableCredentials: false);
    try {
      final authenticatorRes =
          await passkeyAuthenticator.authenticate(authenticatorReq);
      final assertionResponse = jsonEncode(
          FinishLoginRequest.fromPlatformType(authenticatorRes).toJson());
      final passkeyLoginFinishReq = api.PasskeyLoginFinishReq(
          (b) => b..signedChallenge = assertionResponse);

      return _wrapWithError(() => frontendAPIClient
          .getAuthApi()
          .passkeyLoginFinish(passkeyLoginFinishReq: passkeyLoginFinishReq));
    } on AuthenticatorException catch (e) {
      if (e is NoCredentialsAvailableException) {
        rethrow;
      }

      throw CorbadoError.fromAuthenticatorError(e);
    }
  }

  Future<api.ProcessResponse> verifyPasskeyConditional(
      String challenge, bool silent) async {
    final json = jsonDecode(challenge) as Map<String, dynamic>;
    final authenticatorReq = StartLoginResponse.fromJson(json).toPlatformType(
      conditional: silent,
    );

    try {
      final authenticatorRes =
          await passkeyAuthenticator.authenticate(authenticatorReq);
      final assertionResponse = jsonEncode(
          FinishLoginRequest.fromPlatformType(authenticatorRes).toJson());
      final passkeyLoginFinishReq = api.PasskeyMediationFinishReq(
          (b) => b..signedChallenge = assertionResponse);

      return _wrapWithError(() => frontendAPIClient
          .getAuthApi()
          .passkeyMediationFinish(
              passkeyMediationFinishReq: passkeyLoginFinishReq));
    } on AuthenticatorException catch (e) {
      if (e is NoCredentialsAvailableException ||
          e is PasskeyAuthCancelledException) {
        rethrow;
      }

      throw CorbadoError.fromAuthenticatorError(e);
    }
  }

  Future<void> cancelPasskeyOperation() async {
    return passkeyAuthenticator.cancelCurrentAuthenticatorOperation();
  }

  Future<T> _wrapWithError<T>(Future<Response<T?>> Function() callback) async {
    Response<T?> response;
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

  Future<void> _wrapWithErrorEmptyResponse(
      Future<Response<void>> Function() callback) async {
    try {
      await callback();
    } catch (e) {
      throw CorbadoError.fromUnknownError(e);
    }
  }

  void _setProcessState(String token, int expiresAt) {
    frontendAPIClient.dio.options.headers.addAll({
      'x-corbado-process-id': token,
    });

    _processID = token;
    _processExpiresAt = DateTime.fromMillisecondsSinceEpoch(expiresAt * 1000);

    return;
  }

  Future<api.ClientInformationBuilder> _buildClientInformation() async {
    final clientEnvHandle = await _storageService.getClientEnvHandle();
    final getAvailability = passkeyAuthenticator.getAvailability();

    if (kIsWeb) {
      final passkeyAvailability = await getAvailability.web();
      return api.ClientInformationBuilder()
        ..isNative = passkeyAvailability.isNative
        ..isUserVerifyingPlatformAuthenticatorAvailable =
            passkeyAvailability.isUserVerifyingPlatformAuthenticatorAvailable
        ..isConditionalMediationAvailable =
            passkeyAvailability.isConditionalMediationAvailable
        ..clientEnvHandle = clientEnvHandle;
    } else if (Platform.isIOS) {
      final passkeyAvailability = await getAvailability.iOS();
      return api.ClientInformationBuilder()
        ..isNative = passkeyAvailability.isNative
        ..isUserVerifyingPlatformAuthenticatorAvailable =
            passkeyAvailability.hasBiometrics
        ..isConditionalMediationAvailable = null
        ..clientEnvHandle = clientEnvHandle;
    } else {
      final passkeyAvailability = await getAvailability.android();
      return api.ClientInformationBuilder()
        ..isNative = passkeyAvailability.isNative
        ..isUserVerifyingPlatformAuthenticatorAvailable =
            passkeyAvailability.isUserVerifyingPlatformAuthenticatorAvailable
        ..isConditionalMediationAvailable = null
        ..clientEnvHandle = clientEnvHandle;
    }
  }

  /// Builds an API client to interact with the Corbado frontend API.
  /// Depending on the platform different headers will be set.
  static String getFrontendAPIDomain(String projectId,
      {@deprecated String? customDomain}) {
    var frontendAPIDomain = 'https://$projectId.frontendapi.corbado.io';
    if (customDomain != null && customDomain.isNotEmpty) {
      if (kDebugMode) {
        print(
            '[DEPRECATED] The "customDomain" parameter is deprecated and will be removed in a future release.');
      }
      frontendAPIDomain = customDomain;
    }

    return frontendAPIDomain;
  }
}
