import 'package:test/test.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

/// tests for UsersApi
void main() {
  final instance = CorbadoFrontendApiClient().getUsersApi();

  group(UsersApi, () {
    // Deletes current user
    //
    //Future<GenericRsp> currentUserDelete() async
    test('test currentUserDelete', () async {
      // TODO
    });

    // Gets current user
    //
    //Future<MeRsp> currentUserGet() async
    test('test currentUserGet', () async {
      // TODO
    });

    // Creates an identifier
    //
    //Future<GenericRsp> currentUserIdentifierCreate(MeIdentifierCreateReq meIdentifierCreateReq) async
    test('test currentUserIdentifierCreate', () async {
      // TODO
    });

    // Deletes an identifier
    //
    //Future<GenericRsp> currentUserIdentifierDelete(MeIdentifierDeleteReq meIdentifierDeleteReq) async
    test('test currentUserIdentifierDelete', () async {
      // TODO
    });

    // Modifies an identifier (only permitted for username; identifierID will change)
    //
    //Future<GenericRsp> currentUserIdentifierUpdate(MeIdentifierUpdateReq meIdentifierUpdateReq) async
    test('test currentUserIdentifierUpdate', () async {
      // TODO
    });

    // Verifies challenge
    //
    //Future<GenericRsp> currentUserIdentifierVerifyFinish(MeIdentifierVerifyFinishReq meIdentifierVerifyFinishReq) async
    test('test currentUserIdentifierVerifyFinish', () async {
      // TODO
    });

    // Creates challenge (only email otp and phone otp supported for now)
    //
    //Future<GenericRsp> currentUserIdentifierVerifyStart(MeIdentifierVerifyStartReq meIdentifierVerifyStartReq) async
    test('test currentUserIdentifierVerifyStart', () async {
      // TODO
    });

    // Finishes passkey append for current user
    //
    //Future currentUserPasskeyAppendFinish(MePasskeysAppendFinishReq mePasskeysAppendFinishReq) async
    test('test currentUserPasskeyAppendFinish', () async {
      // TODO
    });

    // Starts passkey append for current user
    //
    //Future<MePasskeysAppendStartRsp> currentUserPasskeyAppendStart(MePasskeysAppendStartReq mePasskeysAppendStartReq) async
    test('test currentUserPasskeyAppendStart', () async {
      // TODO
    });

    // Delete current user's passkeys
    //
    //Future<MePasskeyDeleteRsp> currentUserPasskeyDelete(String credentialID) async
    test('test currentUserPasskeyDelete', () async {
      // TODO
    });

    // Gets current user's passkeys
    //
    //Future<MePasskeyRsp> currentUserPasskeyGet() async
    test('test currentUserPasskeyGet', () async {
      // TODO
    });

    // Performs session logout
    //
    //Future currentUserSessionLogout() async
    test('test currentUserSessionLogout', () async {
      // TODO
    });

    // Performs session refresh
    //
    //Future<MeRefreshRsp> currentUserSessionRefresh() async
    test('test currentUserSessionRefresh', () async {
      // TODO
    });

    // Updates current user
    //
    //Future<GenericRsp> currentUserUpdate(MeUpdateReq meUpdateReq) async
    test('test currentUserUpdate', () async {
      // TODO
    });
  });
}
