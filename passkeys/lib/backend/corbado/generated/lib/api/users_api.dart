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

  /// Performs passkey append finish
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<Response> passKeyAppendFinishWithHttpInfo(PassKeyFinishReq passKeyFinishReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/append/finish';

    // ignore: prefer_final_locals
    Object? postBody = passKeyFinishReq;

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

  /// Performs passkey append finish
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<PassKeyAppendFinishRsp?> passKeyAppendFinish(PassKeyFinishReq passKeyFinishReq,) async {
    final response = await passKeyAppendFinishWithHttpInfo(passKeyFinishReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyAppendFinishRsp',) as PassKeyAppendFinishRsp;
    
    }
    return null;
  }

  /// Performs passkey append start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<Response> passKeyAppendStartWithHttpInfo(EmptyReq emptyReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/append/start';

    // ignore: prefer_final_locals
    Object? postBody = emptyReq;

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

  /// Performs passkey append start
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<PassKeyStartRsp?> passKeyAppendStart(EmptyReq emptyReq,) async {
    final response = await passKeyAppendStartWithHttpInfo(emptyReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyStartRsp',) as PassKeyStartRsp;
    
    }
    return null;
  }

  /// Performs passkey login finish
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<Response> passKeyLoginFinishWithHttpInfo(PassKeyFinishReq passKeyFinishReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/login/finish';

    // ignore: prefer_final_locals
    Object? postBody = passKeyFinishReq;

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

  /// Performs passkey login finish
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<PassKeyLoginFinishRsp?> passKeyLoginFinish(PassKeyFinishReq passKeyFinishReq,) async {
    final response = await passKeyLoginFinishWithHttpInfo(passKeyFinishReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyLoginFinishRsp',) as PassKeyLoginFinishRsp;
    
    }
    return null;
  }

  /// Performs passkey login start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyLoginStartReq] passKeyLoginStartReq (required):
  Future<Response> passKeyLoginStartWithHttpInfo(PassKeyLoginStartReq passKeyLoginStartReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/login/start';

    // ignore: prefer_final_locals
    Object? postBody = passKeyLoginStartReq;

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

  /// Performs passkey login start
  ///
  /// Parameters:
  ///
  /// * [PassKeyLoginStartReq] passKeyLoginStartReq (required):
  Future<PassKeyStartRsp?> passKeyLoginStart(PassKeyLoginStartReq passKeyLoginStartReq,) async {
    final response = await passKeyLoginStartWithHttpInfo(passKeyLoginStartReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyStartRsp',) as PassKeyStartRsp;
    
    }
    return null;
  }

  /// Performs passkey register finish
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<Response> passKeyRegisterFinishWithHttpInfo(PassKeyFinishReq passKeyFinishReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/register/finish';

    // ignore: prefer_final_locals
    Object? postBody = passKeyFinishReq;

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

  /// Performs passkey register finish
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<PassKeyRegisterFinishRsp?> passKeyRegisterFinish(PassKeyFinishReq passKeyFinishReq,) async {
    final response = await passKeyRegisterFinishWithHttpInfo(passKeyFinishReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyRegisterFinishRsp',) as PassKeyRegisterFinishRsp;
    
    }
    return null;
  }

  /// Performs passkey register start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyRegisterStartReq] passKeyRegisterStartReq (required):
  Future<Response> passKeyRegisterStartWithHttpInfo(PassKeyRegisterStartReq passKeyRegisterStartReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/register/start';

    // ignore: prefer_final_locals
    Object? postBody = passKeyRegisterStartReq;

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

  /// Performs passkey register start
  ///
  /// Parameters:
  ///
  /// * [PassKeyRegisterStartReq] passKeyRegisterStartReq (required):
  Future<PassKeyStartRsp?> passKeyRegisterStart(PassKeyRegisterStartReq passKeyRegisterStartReq,) async {
    final response = await passKeyRegisterStartWithHttpInfo(passKeyRegisterStartReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PassKeyStartRsp',) as PassKeyStartRsp;
    
    }
    return null;
  }
}
