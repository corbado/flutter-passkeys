//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CorbadoConnectApi {
  CorbadoConnectApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Finishes an initialized connect passkey append process.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendFinishReq] connectAppendFinishReq (required):
  Future<Response> connectAppendFinishWithHttpInfo(
    ConnectAppendFinishReq connectAppendFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/append/finish';

    // ignore: prefer_final_locals
    Object? postBody = connectAppendFinishReq;

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

  /// Finishes an initialized connect passkey append process.
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendFinishReq] connectAppendFinishReq (required):
  Future<ConnectAppendFinishRsp?> connectAppendFinish(
    ConnectAppendFinishReq connectAppendFinishReq,
  ) async {
    final response = await connectAppendFinishWithHttpInfo(
      connectAppendFinishReq,
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
        'ConnectAppendFinishRsp',
      ) as ConnectAppendFinishRsp;
    }
    return null;
  }

  /// Initializes a connect process for passkey append.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendInitReq] connectAppendInitReq (required):
  Future<Response> connectAppendInitWithHttpInfo(
    ConnectAppendInitReq connectAppendInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/append/init';

    // ignore: prefer_final_locals
    Object? postBody = connectAppendInitReq;

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

  /// Initializes a connect process for passkey append.
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendInitReq] connectAppendInitReq (required):
  Future<ConnectAppendInitRsp?> connectAppendInit(
    ConnectAppendInitReq connectAppendInitReq,
  ) async {
    final response = await connectAppendInitWithHttpInfo(
      connectAppendInitReq,
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
        'ConnectAppendInitRsp',
      ) as ConnectAppendInitRsp;
    }
    return null;
  }

  /// Starts an initialized connect passkey append process.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendStartReq] connectAppendStartReq (required):
  Future<Response> connectAppendStartWithHttpInfo(
    ConnectAppendStartReq connectAppendStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/append/start';

    // ignore: prefer_final_locals
    Object? postBody = connectAppendStartReq;

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

  /// Starts an initialized connect passkey append process.
  ///
  /// Parameters:
  ///
  /// * [ConnectAppendStartReq] connectAppendStartReq (required):
  Future<ConnectAppendStartRsp?> connectAppendStart(
    ConnectAppendStartReq connectAppendStartReq,
  ) async {
    final response = await connectAppendStartWithHttpInfo(
      connectAppendStartReq,
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
        'ConnectAppendStartRsp',
      ) as ConnectAppendStartRsp;
    }
    return null;
  }

  /// Creates a new user generated connect event.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectEventCreateReq] connectEventCreateReq (required):
  Future<Response> connectEventCreateWithHttpInfo(
    ConnectEventCreateReq connectEventCreateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/events';

    // ignore: prefer_final_locals
    Object? postBody = connectEventCreateReq;

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

  /// Creates a new user generated connect event.
  ///
  /// Parameters:
  ///
  /// * [ConnectEventCreateReq] connectEventCreateReq (required):
  Future<void> connectEventCreate(
    ConnectEventCreateReq connectEventCreateReq,
  ) async {
    final response = await connectEventCreateWithHttpInfo(
      connectEventCreateReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Finishes an initialized connect login process.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginFinishReq] connectLoginFinishReq (required):
  Future<Response> connectLoginFinishWithHttpInfo(
    ConnectLoginFinishReq connectLoginFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/login/finish';

    // ignore: prefer_final_locals
    Object? postBody = connectLoginFinishReq;

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

  /// Finishes an initialized connect login process.
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginFinishReq] connectLoginFinishReq (required):
  Future<ConnectLoginFinishRsp?> connectLoginFinish(
    ConnectLoginFinishReq connectLoginFinishReq,
  ) async {
    final response = await connectLoginFinishWithHttpInfo(
      connectLoginFinishReq,
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
        'ConnectLoginFinishRsp',
      ) as ConnectLoginFinishRsp;
    }
    return null;
  }

  /// Initializes a connect process for login.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginInitReq] connectLoginInitReq (required):
  Future<Response> connectLoginInitWithHttpInfo(
    ConnectLoginInitReq connectLoginInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/login/init';

    // ignore: prefer_final_locals
    Object? postBody = connectLoginInitReq;

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

  /// Initializes a connect process for login.
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginInitReq] connectLoginInitReq (required):
  Future<ConnectLoginInitRsp?> connectLoginInit(
    ConnectLoginInitReq connectLoginInitReq,
  ) async {
    final response = await connectLoginInitWithHttpInfo(
      connectLoginInitReq,
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
        'ConnectLoginInitRsp',
      ) as ConnectLoginInitRsp;
    }
    return null;
  }

  /// Starts an initialized connect login process.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginStartReq] connectLoginStartReq (required):
  Future<Response> connectLoginStartWithHttpInfo(
    ConnectLoginStartReq connectLoginStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/login/start';

    // ignore: prefer_final_locals
    Object? postBody = connectLoginStartReq;

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

  /// Starts an initialized connect login process.
  ///
  /// Parameters:
  ///
  /// * [ConnectLoginStartReq] connectLoginStartReq (required):
  Future<ConnectLoginStartRsp?> connectLoginStart(
    ConnectLoginStartReq connectLoginStartReq,
  ) async {
    final response = await connectLoginStartWithHttpInfo(
      connectLoginStartReq,
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
        'ConnectLoginStartRsp',
      ) as ConnectLoginStartRsp;
    }
    return null;
  }

  /// Deletes a passkey for a user identified by a connect token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectManageDeleteReq] connectManageDeleteReq (required):
  Future<Response> connectManageDeleteWithHttpInfo(
    ConnectManageDeleteReq connectManageDeleteReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/manage/delete';

    // ignore: prefer_final_locals
    Object? postBody = connectManageDeleteReq;

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

  /// Deletes a passkey for a user identified by a connect token
  ///
  /// Parameters:
  ///
  /// * [ConnectManageDeleteReq] connectManageDeleteReq (required):
  Future<ConnectManageDeleteRsp?> connectManageDelete(
    ConnectManageDeleteReq connectManageDeleteReq,
  ) async {
    final response = await connectManageDeleteWithHttpInfo(
      connectManageDeleteReq,
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
        'ConnectManageDeleteRsp',
      ) as ConnectManageDeleteRsp;
    }
    return null;
  }

  /// Initializes a connect process for passkey management.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectManageInitReq] connectManageInitReq (required):
  Future<Response> connectManageInitWithHttpInfo(
    ConnectManageInitReq connectManageInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/manage/init';

    // ignore: prefer_final_locals
    Object? postBody = connectManageInitReq;

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

  /// Initializes a connect process for passkey management.
  ///
  /// Parameters:
  ///
  /// * [ConnectManageInitReq] connectManageInitReq (required):
  Future<ConnectManageInitRsp?> connectManageInit(
    ConnectManageInitReq connectManageInitReq,
  ) async {
    final response = await connectManageInitWithHttpInfo(
      connectManageInitReq,
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
        'ConnectManageInitRsp',
      ) as ConnectManageInitRsp;
    }
    return null;
  }

  /// Lists all passkeys for a user identifier by a connect token.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ConnectManageListReq] connectManageListReq (required):
  Future<Response> connectManageListWithHttpInfo(
    ConnectManageListReq connectManageListReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/connect/manage/list';

    // ignore: prefer_final_locals
    Object? postBody = connectManageListReq;

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

  /// Lists all passkeys for a user identifier by a connect token.
  ///
  /// Parameters:
  ///
  /// * [ConnectManageListReq] connectManageListReq (required):
  Future<ConnectManageListRsp?> connectManageList(
    ConnectManageListReq connectManageListReq,
  ) async {
    final response = await connectManageListWithHttpInfo(
      connectManageListReq,
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
        'ConnectManageListRsp',
      ) as ConnectManageListRsp;
    }
    return null;
  }
}
