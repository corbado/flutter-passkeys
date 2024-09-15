import 'package:built_collection/built_collection.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';
import 'package:dio/dio.dart';

abstract class CorbadoService {
  final CorbadoFrontendApiClient frontendAPIClient;

  String? _processID;
  DateTime? _processExpiresAt;

  CorbadoService(this.frontendAPIClient);

  Future<ProcessResponse> initAuthProcess() async {
    final processInitReq = ProcessInitReqBuilder().build();
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

  Future<ProcessResponse> signupInit({String? email, String? fullName}) async {
    final identifierBuilder = ListBuilder<LoginIdentifier>();
    if (email != null) {
      identifierBuilder.add(
        LoginIdentifier(
          (b) => b
            ..type = LoginIdentifierType.email
            ..identifier = email,
        ),
      );
    }

    final signupInitReq = SignupInitReq((b) => b
      ..fullName = fullName
      ..identifiers = identifierBuilder);

    return _wrapWithError(
      () => frontendAPIClient.getAuthApi().signupInit(
            signupInitReq: signupInitReq,
          ),
    );
  }

  Future<ProcessResponse> loginInit(String loginIdentifier, bool isPhone) async {
    final req = LoginInitReq((b) => b
      ..identifierValue = loginIdentifier
      ..isPhone = isPhone);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().loginInit(loginInitReq: req));
  }

  Future<ProcessResponse> finishPasskeyMediation(String signedChallenge) async {
    final req = PasskeyMediationFinishReq((b) => b..signedChallenge = signedChallenge);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().passkeyMediationFinish(passkeyMediationFinishReq: req));
  }

  Future<ProcessResponse> verifyEmailOtpCode(String code) async {
    final req = IdentifierVerifyFinishReq((b) => b
      ..code = code
      ..identifierType = LoginIdentifierType.email
      ..verificationType = VerificationMethod.emailOtp
      ..isNewDevice = false);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyFinish(identifierVerifyFinishReq: req));
  }

  Future<ProcessResponse> sendEmailOtpCode(String email) async {
    final req = IdentifierVerifyStartReq((b) => b
      ..identifierType = LoginIdentifierType.email
      ..verificationType = VerificationMethod.emailOtp);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<ProcessResponse> sendEmailLink(String email) async {
    final req = IdentifierVerifyStartReq((b) => b
      ..identifierType = LoginIdentifierType.email
      ..verificationType = VerificationMethod.emailLink);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierVerifyStart(identifierVerifyStartReq: req));
  }

  Future<ProcessResponse> updateEmail(String email) async {
    final req = IdentifierUpdateReq((b) => b
      ..identifierType = LoginIdentifierType.email
      ..value = email);

    return _wrapWithError(() => frontendAPIClient.getAuthApi().identifierUpdate(identifierUpdateReq: req));
  }

  Future<ProcessResponse> _wrapWithError(Future<Response<ProcessResponse?>> Function() callback) async {
    Response<ProcessResponse?> response;
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

  ClientInformationV2 _getClientInformation() {
    return ClientInformationV2Builder().build();
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
