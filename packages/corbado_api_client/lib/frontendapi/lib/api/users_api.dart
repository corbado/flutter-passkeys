//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UsersApi {
  UsersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Deletes current user
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserDeleteWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Deletes current user
  Future<GenericRsp?> currentUserDelete() async {
    final response = await currentUserDeleteWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Gets current user
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Gets current user
  Future<MeRsp?> currentUserGet() async {
    final response = await currentUserGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'MeRsp',
      ) as MeRsp;
    }
    return null;
  }

  /// Creates an identifier
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierCreateReq] meIdentifierCreateReq (required):
  Future<Response> currentUserIdentifierCreateWithHttpInfo(
    MeIdentifierCreateReq meIdentifierCreateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/identifier';

    // ignore: prefer_final_locals
    Object? postBody = meIdentifierCreateReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Creates an identifier
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierCreateReq] meIdentifierCreateReq (required):
  Future<GenericRsp?> currentUserIdentifierCreate(
    MeIdentifierCreateReq meIdentifierCreateReq,
  ) async {
    final response = await currentUserIdentifierCreateWithHttpInfo(
      meIdentifierCreateReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Deletes an identifier
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierDeleteReq] meIdentifierDeleteReq (required):
  Future<Response> currentUserIdentifierDeleteWithHttpInfo(
    MeIdentifierDeleteReq meIdentifierDeleteReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/identifier';

    // ignore: prefer_final_locals
    Object? postBody = meIdentifierDeleteReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Deletes an identifier
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierDeleteReq] meIdentifierDeleteReq (required):
  Future<GenericRsp?> currentUserIdentifierDelete(
    MeIdentifierDeleteReq meIdentifierDeleteReq,
  ) async {
    final response = await currentUserIdentifierDeleteWithHttpInfo(
      meIdentifierDeleteReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Modifies an identifier (only permitted for username; identifierID will change)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierUpdateReq] meIdentifierUpdateReq (required):
  Future<Response> currentUserIdentifierUpdateWithHttpInfo(
    MeIdentifierUpdateReq meIdentifierUpdateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/identifier';

    // ignore: prefer_final_locals
    Object? postBody = meIdentifierUpdateReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Modifies an identifier (only permitted for username; identifierID will change)
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierUpdateReq] meIdentifierUpdateReq (required):
  Future<GenericRsp?> currentUserIdentifierUpdate(
    MeIdentifierUpdateReq meIdentifierUpdateReq,
  ) async {
    final response = await currentUserIdentifierUpdateWithHttpInfo(
      meIdentifierUpdateReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Verifies challenge
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierVerifyFinishReq] meIdentifierVerifyFinishReq (required):
  Future<Response> currentUserIdentifierVerifyFinishWithHttpInfo(
    MeIdentifierVerifyFinishReq meIdentifierVerifyFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/identifier/verify/finish';

    // ignore: prefer_final_locals
    Object? postBody = meIdentifierVerifyFinishReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Verifies challenge
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierVerifyFinishReq] meIdentifierVerifyFinishReq (required):
  Future<GenericRsp?> currentUserIdentifierVerifyFinish(
    MeIdentifierVerifyFinishReq meIdentifierVerifyFinishReq,
  ) async {
    final response = await currentUserIdentifierVerifyFinishWithHttpInfo(
      meIdentifierVerifyFinishReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Creates challenge (only email otp and phone otp supported for now)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierVerifyStartReq] meIdentifierVerifyStartReq (required):
  Future<Response> currentUserIdentifierVerifyStartWithHttpInfo(
    MeIdentifierVerifyStartReq meIdentifierVerifyStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/identifier/verify/start';

    // ignore: prefer_final_locals
    Object? postBody = meIdentifierVerifyStartReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Creates challenge (only email otp and phone otp supported for now)
  ///
  /// Parameters:
  ///
  /// * [MeIdentifierVerifyStartReq] meIdentifierVerifyStartReq (required):
  Future<GenericRsp?> currentUserIdentifierVerifyStart(
    MeIdentifierVerifyStartReq meIdentifierVerifyStartReq,
  ) async {
    final response = await currentUserIdentifierVerifyStartWithHttpInfo(
      meIdentifierVerifyStartReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Finishes passkey append for current user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MePasskeysAppendFinishReq] mePasskeysAppendFinishReq (required):
  Future<Response> currentUserPasskeyAppendFinishWithHttpInfo(
    MePasskeysAppendFinishReq mePasskeysAppendFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/passkeys/append/finish';

    // ignore: prefer_final_locals
    Object? postBody = mePasskeysAppendFinishReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Finishes passkey append for current user
  ///
  /// Parameters:
  ///
  /// * [MePasskeysAppendFinishReq] mePasskeysAppendFinishReq (required):
  Future<void> currentUserPasskeyAppendFinish(
    MePasskeysAppendFinishReq mePasskeysAppendFinishReq,
  ) async {
    final response = await currentUserPasskeyAppendFinishWithHttpInfo(
      mePasskeysAppendFinishReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Starts passkey append for current user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MePasskeysAppendStartReq] mePasskeysAppendStartReq (required):
  Future<Response> currentUserPasskeyAppendStartWithHttpInfo(
    MePasskeysAppendStartReq mePasskeysAppendStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/passkeys/append/start';

    // ignore: prefer_final_locals
    Object? postBody = mePasskeysAppendStartReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Starts passkey append for current user
  ///
  /// Parameters:
  ///
  /// * [MePasskeysAppendStartReq] mePasskeysAppendStartReq (required):
  Future<MePasskeysAppendStartRsp?> currentUserPasskeyAppendStart(
    MePasskeysAppendStartReq mePasskeysAppendStartReq,
  ) async {
    final response = await currentUserPasskeyAppendStartWithHttpInfo(
      mePasskeysAppendStartReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'MePasskeysAppendStartRsp',
      ) as MePasskeysAppendStartRsp;
    }
    return null;
  }

  /// Delete current user's passkeys
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] credentialID (required):
  ///   Credential ID from passkeys
  Future<Response> currentUserPasskeyDeleteWithHttpInfo(
    String credentialID,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/passkeys/{credentialID}'
        .replaceAll('{credentialID}', credentialID);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete current user's passkeys
  ///
  /// Parameters:
  ///
  /// * [String] credentialID (required):
  ///   Credential ID from passkeys
  Future<MePasskeyDeleteRsp?> currentUserPasskeyDelete(
    String credentialID,
  ) async {
    final response = await currentUserPasskeyDeleteWithHttpInfo(
      credentialID,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'MePasskeyDeleteRsp',
      ) as MePasskeyDeleteRsp;
    }
    return null;
  }

  /// Gets current user's passkeys
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserPasskeyGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/passkeys';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Gets current user's passkeys
  Future<MePasskeyRsp?> currentUserPasskeyGet() async {
    final response = await currentUserPasskeyGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'MePasskeyRsp',
      ) as MePasskeyRsp;
    }
    return null;
  }

  /// Performs session logout
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserSessionLogoutWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/logout';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Performs session logout
  Future<void> currentUserSessionLogout() async {
    final response = await currentUserSessionLogoutWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Performs session refresh
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserSessionRefreshWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me/refresh';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Performs session refresh
  Future<MeRefreshRsp?> currentUserSessionRefresh() async {
    final response = await currentUserSessionRefreshWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'MeRefreshRsp',
      ) as MeRefreshRsp;
    }
    return null;
  }

  /// Updates current user
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MeUpdateReq] meUpdateReq (required):
  Future<Response> currentUserUpdateWithHttpInfo(
    MeUpdateReq meUpdateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/me';

    // ignore: prefer_final_locals
    Object? postBody = meUpdateReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Updates current user
  ///
  /// Parameters:
  ///
  /// * [MeUpdateReq] meUpdateReq (required):
  Future<GenericRsp?> currentUserUpdate(
    MeUpdateReq meUpdateReq,
  ) async {
    final response = await currentUserUpdateWithHttpInfo(
      meUpdateReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }
}
