//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AuthApi {
  AuthApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> blockSkipWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/block/skip';

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

  /// tbd
  Future<ProcessResponse?> blockSkip() async {
    final response = await blockSkipWithHttpInfo();
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// Creates a new user generated complete event.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EventCreateReq] eventCreateReq (required):
  Future<Response> eventCreateWithHttpInfo(
    EventCreateReq eventCreateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/events';

    // ignore: prefer_final_locals
    Object? postBody = eventCreateReq;

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

  /// Creates a new user generated complete event.
  ///
  /// Parameters:
  ///
  /// * [EventCreateReq] eventCreateReq (required):
  Future<void> eventCreate(
    EventCreateReq eventCreateReq,
  ) async {
    final response = await eventCreateWithHttpInfo(
      eventCreateReq,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IdentifierUpdateReq] identifierUpdateReq (required):
  Future<Response> identifierUpdateWithHttpInfo(
    IdentifierUpdateReq identifierUpdateReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/identifier/update';

    // ignore: prefer_final_locals
    Object? postBody = identifierUpdateReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [IdentifierUpdateReq] identifierUpdateReq (required):
  Future<ProcessResponse?> identifierUpdate(
    IdentifierUpdateReq identifierUpdateReq,
  ) async {
    final response = await identifierUpdateWithHttpInfo(
      identifierUpdateReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IdentifierVerifyFinishReq] identifierVerifyFinishReq (required):
  Future<Response> identifierVerifyFinishWithHttpInfo(
    IdentifierVerifyFinishReq identifierVerifyFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/identifier/verify/finish';

    // ignore: prefer_final_locals
    Object? postBody = identifierVerifyFinishReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [IdentifierVerifyFinishReq] identifierVerifyFinishReq (required):
  Future<ProcessResponse?> identifierVerifyFinish(
    IdentifierVerifyFinishReq identifierVerifyFinishReq,
  ) async {
    final response = await identifierVerifyFinishWithHttpInfo(
      identifierVerifyFinishReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IdentifierVerifyStartReq] identifierVerifyStartReq (required):
  Future<Response> identifierVerifyStartWithHttpInfo(
    IdentifierVerifyStartReq identifierVerifyStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/identifier/verify/start';

    // ignore: prefer_final_locals
    Object? postBody = identifierVerifyStartReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [IdentifierVerifyStartReq] identifierVerifyStartReq (required):
  Future<ProcessResponse?> identifierVerifyStart(
    IdentifierVerifyStartReq identifierVerifyStartReq,
  ) async {
    final response = await identifierVerifyStartWithHttpInfo(
      identifierVerifyStartReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> identifierVerifyStatusWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/identifier/verify/status';

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

  /// tbd
  Future<ProcessResponse?> identifierVerifyStatus() async {
    final response = await identifierVerifyStatusWithHttpInfo();
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginInitReq] loginInitReq (required):
  Future<Response> loginInitWithHttpInfo(
    LoginInitReq loginInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/login/init';

    // ignore: prefer_final_locals
    Object? postBody = loginInitReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [LoginInitReq] loginInitReq (required):
  Future<ProcessResponse?> loginInit(
    LoginInitReq loginInitReq,
  ) async {
    final response = await loginInitWithHttpInfo(
      loginInitReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasskeyAppendFinishReq] passkeyAppendFinishReq (required):
  Future<Response> passkeyAppendFinishWithHttpInfo(
    PasskeyAppendFinishReq passkeyAppendFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/passkey/append/finish';

    // ignore: prefer_final_locals
    Object? postBody = passkeyAppendFinishReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [PasskeyAppendFinishReq] passkeyAppendFinishReq (required):
  Future<ProcessResponse?> passkeyAppendFinish(
    PasskeyAppendFinishReq passkeyAppendFinishReq,
  ) async {
    final response = await passkeyAppendFinishWithHttpInfo(
      passkeyAppendFinishReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<Response> passkeyAppendStartWithHttpInfo(
    Object body,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/passkey/append/start';

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<ProcessResponse?> passkeyAppendStart(
    Object body,
  ) async {
    final response = await passkeyAppendStartWithHttpInfo(
      body,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasskeyLoginFinishReq] passkeyLoginFinishReq (required):
  Future<Response> passkeyLoginFinishWithHttpInfo(
    PasskeyLoginFinishReq passkeyLoginFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/passkey/login/finish';

    // ignore: prefer_final_locals
    Object? postBody = passkeyLoginFinishReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [PasskeyLoginFinishReq] passkeyLoginFinishReq (required):
  Future<ProcessResponse?> passkeyLoginFinish(
    PasskeyLoginFinishReq passkeyLoginFinishReq,
  ) async {
    final response = await passkeyLoginFinishWithHttpInfo(
      passkeyLoginFinishReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<Response> passkeyLoginStartWithHttpInfo(
    Object body,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/passkey/login/start';

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<ProcessResponse?> passkeyLoginStart(
    Object body,
  ) async {
    final response = await passkeyLoginStartWithHttpInfo(
      body,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasskeyMediationFinishReq] passkeyMediationFinishReq (required):
  Future<Response> passkeyMediationFinishWithHttpInfo(
    PasskeyMediationFinishReq passkeyMediationFinishReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/passkey/mediation/finish';

    // ignore: prefer_final_locals
    Object? postBody = passkeyMediationFinishReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [PasskeyMediationFinishReq] passkeyMediationFinishReq (required):
  Future<ProcessResponse?> passkeyMediationFinish(
    PasskeyMediationFinishReq passkeyMediationFinishReq,
  ) async {
    final response = await passkeyMediationFinishWithHttpInfo(
      passkeyMediationFinishReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PhoneCollectReq] phoneCollectReq (required):
  Future<Response> phoneCollectWithHttpInfo(
    PhoneCollectReq phoneCollectReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/phone/collect';

    // ignore: prefer_final_locals
    Object? postBody = phoneCollectReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [PhoneCollectReq] phoneCollectReq (required):
  Future<ProcessResponse?> phoneCollect(
    PhoneCollectReq phoneCollectReq,
  ) async {
    final response = await phoneCollectWithHttpInfo(
      phoneCollectReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> processCompleteWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/process/complete';

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

  /// tbd
  Future<ProcessResponse?> processComplete() async {
    final response = await processCompleteWithHttpInfo();
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BlockType] preferredBlock:
  Future<Response> processGetWithHttpInfo({
    BlockType? preferredBlock,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/process';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (preferredBlock != null) {
      queryParams.addAll(_queryParams('', 'preferredBlock', preferredBlock));
    }

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [BlockType] preferredBlock:
  Future<ProcessResponse?> processGet({
    BlockType? preferredBlock,
  }) async {
    final response = await processGetWithHttpInfo(
      preferredBlock: preferredBlock,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ProcessInitReq] processInitReq (required):
  Future<Response> processInitWithHttpInfo(
    ProcessInitReq processInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/process/init';

    // ignore: prefer_final_locals
    Object? postBody = processInitReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [ProcessInitReq] processInitReq (required):
  Future<ProcessInitRsp?> processInit(
    ProcessInitReq processInitReq,
  ) async {
    final response = await processInitWithHttpInfo(
      processInitReq,
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
        'ProcessInitRsp',
      ) as ProcessInitRsp;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> processResetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/process/reset';

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

  /// tbd
  Future<ProcessResponse?> processReset() async {
    final response = await processResetWithHttpInfo();
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SignupInitReq] signupInitReq (required):
  Future<Response> signupInitWithHttpInfo(
    SignupInitReq signupInitReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/signup/init';

    // ignore: prefer_final_locals
    Object? postBody = signupInitReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [SignupInitReq] signupInitReq (required):
  Future<ProcessResponse?> signupInit(
    SignupInitReq signupInitReq,
  ) async {
    final response = await signupInitWithHttpInfo(
      signupInitReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> socialVerifyCallbackWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/social/verify/callback';

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

  /// tbd
  Future<void> socialVerifyCallback() async {
    final response = await socialVerifyCallbackWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<Response> socialVerifyFinishWithHttpInfo(
    Object body,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/social/verify/finish';

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [Object] body (required):
  Future<ProcessResponse?> socialVerifyFinish(
    Object body,
  ) async {
    final response = await socialVerifyFinishWithHttpInfo(
      body,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SocialVerifyStartReq] socialVerifyStartReq (required):
  Future<Response> socialVerifyStartWithHttpInfo(
    SocialVerifyStartReq socialVerifyStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/social/verify/start';

    // ignore: prefer_final_locals
    Object? postBody = socialVerifyStartReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [SocialVerifyStartReq] socialVerifyStartReq (required):
  Future<ProcessResponse?> socialVerifyStart(
    SocialVerifyStartReq socialVerifyStartReq,
  ) async {
    final response = await socialVerifyStartWithHttpInfo(
      socialVerifyStartReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }

  /// tbd
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UsernameCollectReq] usernameCollectReq (required):
  Future<Response> usernameCollectWithHttpInfo(
    UsernameCollectReq usernameCollectReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v2/auth/username/collect';

    // ignore: prefer_final_locals
    Object? postBody = usernameCollectReq;

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

  /// tbd
  ///
  /// Parameters:
  ///
  /// * [UsernameCollectReq] usernameCollectReq (required):
  Future<ProcessResponse?> usernameCollect(
    UsernameCollectReq usernameCollectReq,
  ) async {
    final response = await usernameCollectWithHttpInfo(
      usernameCollectReq,
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
        'ProcessResponse',
      ) as ProcessResponse;
    }
    return null;
  }
}
