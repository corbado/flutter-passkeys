import 'package:corbado_auth/src/services/corbado/corbado.dart';
import 'package:corbado_auth/src/services/storage/storage.dart';
import 'package:corbado_auth/src/types/passkey_info.dart';
import 'package:corbado_auth/src/types/user.dart';
import 'package:corbado_frontend_api_client/frontendapi/lib/api.dart';
import 'package:passkeys/passkey_auth.dart';
import 'package:passkeys/relying_party_server/corbado/types/exceptions.dart';

class NativeCorbadoService extends CorbadoService {
  ///
  NativeCorbadoService(
    StorageService storageService,
  )   : _storageService = storageService,
        super(storageService);

  final StorageService _storageService;

  @override
  Future<void> deletePasskey(String credentialID) async {
    final refreshToken = await _storageService.getRefreshToken();
    try {
      if (refreshToken == null) {
        throw Exception('missing _refreshToken');
      }

      frontendAPIClient.addDefaultHeader(
        'cookie',
        'cbo_long_session=$refreshToken',
      );
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
    final refreshToken = await _storageService.getRefreshToken();

    frontendAPIClient.addDefaultHeader(
      'cookie',
      'cbo_long_session=$refreshToken',
    );
    final response = await UsersApi(frontendAPIClient).currentUserPassKeyGet();
    if (response == null) {
      return [];
    }

    return response.data.passkeys.map(PasskeyInfo.fromResponse).toList();
  }

  @override
  Future<User> refreshToken() async {
    final refreshToken = await _storageService.getRefreshToken();

    if (refreshToken == null) {
      throw Exception('Stopped refreshToken: missing refresh token.');
    }

    frontendAPIClient.addDefaultHeader(
      'cookie',
      'cbo_long_session=$refreshToken',
    );
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
    final refreshToken = await _storageService.getRefreshToken();
    if (refreshToken == null) {
      throw Exception('User must be logged in');
    }

    final PassKeyStartRsp? resStart;
    try {
      frontendAPIClient.addDefaultHeader(
        'cookie',
        'cbo_long_session=$refreshToken',
      );
      resStart =
          await UsersApi(frontendAPIClient).passKeyAppendStart(EmptyReq());

      return resStart!.data.challenge;
    } on ApiException catch (e) {
      throw ExceptionFactory.fromBackendMessage(
        'passKeyAppendStart',
        e.message ?? '',
      );
    }
  }
}
