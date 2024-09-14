import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth/src/blocks/types.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';

abstract class CorbadoService {
  final ApiClient frontendAPIClient;

  String _processID = '';

  CorbadoService(this.frontendAPIClient);

  Future<ProcessResponse> initAuthProcess() async {
    final processInitReq = ProcessInitReq(
      clientInformation: _getClientInformation(),
    );

    final res =
        await new AuthApi(frontendAPIClient).processInit(processInitReq);
    if (res == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    this.frontendAPIClient.defaultHeaderMap.addAll({
      'x-corbado-process-id': res.token,
    });

    return res.processResponse;
  }

  Future<ProcessResponse> signupInit({String? email, String? fullName}) async {
    final identifiers = <LoginIdentifier>[];
    if (email != null) {
      identifiers.add(LoginIdentifier(
        type: LoginIdentifierType.email,
        identifier: email,
      ));
    }

    final req = SignupInitReq(identifiers: identifiers, fullName: fullName);
    final api = new AuthApi(frontendAPIClient);

    return _wrapWithError(() => api.signupInit(req));
  }

  Future<ProcessResponse> _wrapWithError(
      Future<ProcessResponse?> Function() callback) async {
    ProcessResponse? response;
    try {
      response = await callback();
    } on ApiException catch (e) {
      throw CorbadoError.fromApiException(e);
    } catch (e) {
      throw CorbadoError.fromUnknownError(e);
    }

    if (response == null) {
      throw CorbadoError.fromMissingServerResponse();
    }

    return response;
  }

  ClientInformation _getClientInformation() {
    return ClientInformation(
      bluetoothAvailable: false,
      clientEnvHandle: '',
    );
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
