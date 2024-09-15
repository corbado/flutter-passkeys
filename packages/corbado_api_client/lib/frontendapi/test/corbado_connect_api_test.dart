import 'package:test/test.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

/// tests for CorbadoConnectApi
void main() {
  final instance = CorbadoFrontendApiClient().getCorbadoConnectApi();

  group(CorbadoConnectApi, () {
    // Finishes an initialized connect passkey append process.
    //
    //Future<ConnectAppendFinishRsp> connectAppendFinish(ConnectAppendFinishReq connectAppendFinishReq) async
    test('test connectAppendFinish', () async {
      // TODO
    });

    // Initializes a connect process for passkey append.
    //
    //Future<ConnectAppendInitRsp> connectAppendInit(ConnectAppendInitReq connectAppendInitReq) async
    test('test connectAppendInit', () async {
      // TODO
    });

    // Starts an initialized connect passkey append process.
    //
    //Future<ConnectAppendStartRsp> connectAppendStart(ConnectAppendStartReq connectAppendStartReq) async
    test('test connectAppendStart', () async {
      // TODO
    });

    // Creates a new user generated connect event.
    //
    //Future connectEventCreate(ConnectEventCreateReq connectEventCreateReq) async
    test('test connectEventCreate', () async {
      // TODO
    });

    // Finishes an initialized connect login process.
    //
    //Future<ConnectLoginFinishRsp> connectLoginFinish(ConnectLoginFinishReq connectLoginFinishReq) async
    test('test connectLoginFinish', () async {
      // TODO
    });

    // Initializes a connect process for login.
    //
    //Future<ConnectLoginInitRsp> connectLoginInit(ConnectLoginInitReq connectLoginInitReq) async
    test('test connectLoginInit', () async {
      // TODO
    });

    // Starts an initialized connect login process.
    //
    //Future<ConnectLoginStartRsp> connectLoginStart(ConnectLoginStartReq connectLoginStartReq) async
    test('test connectLoginStart', () async {
      // TODO
    });

    // Deletes a passkey for a user identified by a connect token
    //
    //Future<ConnectManageDeleteRsp> connectManageDelete(ConnectManageDeleteReq connectManageDeleteReq) async
    test('test connectManageDelete', () async {
      // TODO
    });

    // Initializes a connect process for passkey management.
    //
    //Future<ConnectManageInitRsp> connectManageInit(ConnectManageInitReq connectManageInitReq) async
    test('test connectManageInit', () async {
      // TODO
    });

    // Lists all passkeys for a user identifier by a connect token.
    //
    //Future<ConnectManageListRsp> connectManageList(ConnectManageListReq connectManageListReq) async
    test('test connectManageList', () async {
      // TODO
    });
  });
}
