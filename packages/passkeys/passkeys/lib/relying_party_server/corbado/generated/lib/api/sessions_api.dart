//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SessionsApi {
  SessionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Performs session logout
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<Response> sessionLogoutWithHttpInfo(EmptyReq emptyReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/sessions/logout';

    // ignore: prefer_final_locals
    Object? postBody = emptyReq;

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

  /// Performs session logout
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<LogoutRsp?> sessionLogout(EmptyReq emptyReq,) async {
    final response = await sessionLogoutWithHttpInfo(emptyReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LogoutRsp',) as LogoutRsp;
    
    }
    return null;
  }

  /// Performs session refresh
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<Response> sessionRefreshWithHttpInfo(EmptyReq emptyReq,) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/sessions/refresh';

    // ignore: prefer_final_locals
    Object? postBody = emptyReq;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Performs session refresh
  ///
  /// Parameters:
  ///
  /// * [EmptyReq] emptyReq (required):
  Future<SessionRefreshRsp?> sessionRefresh(EmptyReq emptyReq,) async {
    final response = await sessionRefreshWithHttpInfo(emptyReq,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SessionRefreshRsp',) as SessionRefreshRsp;
    
    }
    return null;
  }

  /// Retrieves well-known JWKS for Project ID
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> wellKnownJWKSListWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/.well-known/jwks';

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

  /// Retrieves well-known JWKS for Project ID
  Future<WellKnownJWKSListRsp?> wellKnownJWKSList() async {
    final response = await wellKnownJWKSListWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WellKnownJWKSListRsp',) as WellKnownJWKSListRsp;
    
    }
    return null;
  }
}
