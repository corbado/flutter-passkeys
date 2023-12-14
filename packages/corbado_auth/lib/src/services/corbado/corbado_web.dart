import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/passkey_info.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:passkeys/relying_party_server/corbado/types/exceptions.dart';

class WebCorbadoService extends CorbadoService {
  ///
  WebCorbadoService(StorageService storageService)
      : _storageService = storageService,
        super(storageService);

  final StorageService _storageService;

  @override
  Future<void> deletePasskey(String credentialID) async {
    try {
      final frontendAPIClient = await getClientWithHeaders();
      await UsersApi(frontendAPIClient).currentUserPassKeyDelete(credentialID);
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'currentUserPassKeyDelete',
        e.message ?? '',
      );
    }
  }

  @override
  Future<List<PasskeyInfo>> getPasskeys() async {
    final frontendAPIClient = await getClientWithHeaders();
    final response = await UsersApi(frontendAPIClient).currentUserPassKeyGet();
    if (response == null) {
      return [];
    }

    return response.data.passkeys.map(PasskeyInfo.fromResponse).toList();
  }

  @override
  Future<User> refreshToken() async {
    final frontendAPIClient = await getClientWithHeaders();
    final response =
        await SessionsApi(frontendAPIClient).sessionRefresh(EmptyReq());
    if (response == null || response.shortSession == null) {
      throw Exception('Stopped refreshToken: missing token in response.');
    }

    final user = User.fromIdToken(response.shortSession!.value);
    await _storageService.setUser(user);

    return user;
  }

  @override
  Future<String> startPasskeyAppend() async {
    final frontendAPIClient = await getClientWithHeaders();
    try {
      final resStart =
          await UsersApi(frontendAPIClient).passKeyAppendStart(EmptyReq());

      return resStart!.data.challenge;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendStart',
        e.message ?? '',
      );
    }
  }

  Future<ApiClient> getClientWithHeaders() async {
    final refreshToken = await _storageService.getRefreshToken();
    if (refreshToken != null) {
      frontendAPIClient.addDefaultHeader(
        'Authorization',
        'Bearer $refreshToken',
      );
    }

    return frontendAPIClient;
  }
}
