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

  /// Lists user's available authentication methods
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AuthMethodsListReq] authMethodsListReq (required):
  Future<Response> authMethodsListWithHttpInfo(
    AuthMethodsListReq authMethodsListReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/authmethods';

    // ignore: prefer_final_locals
    Object? postBody = authMethodsListReq;

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

  /// Lists user's available authentication methods
  ///
  /// Parameters:
  ///
  /// * [AuthMethodsListReq] authMethodsListReq (required):
  Future<AuthMethodsListRsp?> authMethodsList(
    AuthMethodsListReq authMethodsListReq,
  ) async {
    final response = await authMethodsListWithHttpInfo(
      authMethodsListReq,
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
        'AuthMethodsListRsp',
      ) as AuthMethodsListRsp;
    }
    return null;
  }

  /// Gets current user
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/me';

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

  /// Delete current user's passkeys
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] credentialID (required):
  ///   Credential ID from passkeys
  Future<Response> currentUserPassKeyDeleteWithHttpInfo(
    String credentialID,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/me/passkeys/{credentialID}'
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
  Future<GenericRsp?> currentUserPassKeyDelete(
    String credentialID,
  ) async {
    final response = await currentUserPassKeyDeleteWithHttpInfo(
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
        'GenericRsp',
      ) as GenericRsp;
    }
    return null;
  }

  /// Gets current user's passkeys
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> currentUserPassKeyGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/v1/me/passkeys';

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
  Future<MePassKeyRsp?> currentUserPassKeyGet() async {
    final response = await currentUserPassKeyGetWithHttpInfo();
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
        'MePassKeyRsp',
      ) as MePassKeyRsp;
    }
    return null;
  }

  /// Performs email OTP register confirm
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailCodeConfirmReq] emailCodeConfirmReq (required):
  Future<Response> emailCodeConfirmWithHttpInfo(
    EmailCodeConfirmReq emailCodeConfirmReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emailcodes/confirm';

    // ignore: prefer_final_locals
    Object? postBody = emailCodeConfirmReq;

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

  /// Performs email OTP register confirm
  ///
  /// Parameters:
  ///
  /// * [EmailCodeConfirmReq] emailCodeConfirmReq (required):
  Future<EmailCodeConfirmRsp?> emailCodeConfirm(
    EmailCodeConfirmReq emailCodeConfirmReq,
  ) async {
    final response = await emailCodeConfirmWithHttpInfo(
      emailCodeConfirmReq,
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
        'EmailCodeConfirmRsp',
      ) as EmailCodeConfirmRsp;
    }
    return null;
  }

  /// Performs email OTP login start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailCodeLoginStartReq] emailCodeLoginStartReq (required):
  Future<Response> emailCodeLoginStartWithHttpInfo(
    EmailCodeLoginStartReq emailCodeLoginStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emailcodes/login/start';

    // ignore: prefer_final_locals
    Object? postBody = emailCodeLoginStartReq;

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

  /// Performs email OTP login start
  ///
  /// Parameters:
  ///
  /// * [EmailCodeLoginStartReq] emailCodeLoginStartReq (required):
  Future<EmailCodeLoginStartRsp?> emailCodeLoginStart(
    EmailCodeLoginStartReq emailCodeLoginStartReq,
  ) async {
    final response = await emailCodeLoginStartWithHttpInfo(
      emailCodeLoginStartReq,
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
        'EmailCodeLoginStartRsp',
      ) as EmailCodeLoginStartRsp;
    }
    return null;
  }

  /// Performs email OTP register start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailCodeRegisterStartReq] emailCodeRegisterStartReq (required):
  Future<Response> emailCodeRegisterStartWithHttpInfo(
    EmailCodeRegisterStartReq emailCodeRegisterStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emailcodes/register/start';

    // ignore: prefer_final_locals
    Object? postBody = emailCodeRegisterStartReq;

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

  /// Performs email OTP register start
  ///
  /// Parameters:
  ///
  /// * [EmailCodeRegisterStartReq] emailCodeRegisterStartReq (required):
  Future<EmailCodeRegisterStartRsp?> emailCodeRegisterStart(
    EmailCodeRegisterStartReq emailCodeRegisterStartReq,
  ) async {
    final response = await emailCodeRegisterStartWithHttpInfo(
      emailCodeRegisterStartReq,
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
        'EmailCodeRegisterStartRsp',
      ) as EmailCodeRegisterStartRsp;
    }
    return null;
  }

  /// Performs email OTP login status check
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailCodeStatusReq] emailCodeStatusReq (required):
  Future<Response> emailCodeStatusWithHttpInfo(
    EmailCodeStatusReq emailCodeStatusReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emailcodes/status';

    // ignore: prefer_final_locals
    Object? postBody = emailCodeStatusReq;

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

  /// Performs email OTP login status check
  ///
  /// Parameters:
  ///
  /// * [EmailCodeStatusReq] emailCodeStatusReq (required):
  Future<EmailCodeStatusRsp?> emailCodeStatus(
    EmailCodeStatusReq emailCodeStatusReq,
  ) async {
    final response = await emailCodeStatusWithHttpInfo(
      emailCodeStatusReq,
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
        'EmailCodeStatusRsp',
      ) as EmailCodeStatusRsp;
    }
    return null;
  }

  /// Performs email link register confirm
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailLinkConfirmReq] emailLinkConfirmReq (required):
  Future<Response> emailLinkConfirmWithHttpInfo(
    EmailLinkConfirmReq emailLinkConfirmReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emaillinks/confirm';

    // ignore: prefer_final_locals
    Object? postBody = emailLinkConfirmReq;

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

  /// Performs email link register confirm
  ///
  /// Parameters:
  ///
  /// * [EmailLinkConfirmReq] emailLinkConfirmReq (required):
  Future<EmailLinkConfirmRsp?> emailLinkConfirm(
    EmailLinkConfirmReq emailLinkConfirmReq,
  ) async {
    final response = await emailLinkConfirmWithHttpInfo(
      emailLinkConfirmReq,
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
        'EmailLinkConfirmRsp',
      ) as EmailLinkConfirmRsp;
    }
    return null;
  }

  /// Performs email link login start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailLinkLoginStartReq] emailLinkLoginStartReq (required):
  Future<Response> emailLinkLoginStartWithHttpInfo(
    EmailLinkLoginStartReq emailLinkLoginStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emaillinks/login/start';

    // ignore: prefer_final_locals
    Object? postBody = emailLinkLoginStartReq;

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

  /// Performs email link login start
  ///
  /// Parameters:
  ///
  /// * [EmailLinkLoginStartReq] emailLinkLoginStartReq (required):
  Future<EmailLinkLoginStartRsp?> emailLinkLoginStart(
    EmailLinkLoginStartReq emailLinkLoginStartReq,
  ) async {
    final response = await emailLinkLoginStartWithHttpInfo(
      emailLinkLoginStartReq,
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
        'EmailLinkLoginStartRsp',
      ) as EmailLinkLoginStartRsp;
    }
    return null;
  }

  /// Performs email link register start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailLinkRegisterStartReq] emailLinkRegisterStartReq (required):
  Future<Response> emailLinkRegisterStartWithHttpInfo(
    EmailLinkRegisterStartReq emailLinkRegisterStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emaillinks/register/start';

    // ignore: prefer_final_locals
    Object? postBody = emailLinkRegisterStartReq;

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

  /// Performs email link register start
  ///
  /// Parameters:
  ///
  /// * [EmailLinkRegisterStartReq] emailLinkRegisterStartReq (required):
  Future<EmailLinkRegisterStartRsp?> emailLinkRegisterStart(
    EmailLinkRegisterStartReq emailLinkRegisterStartReq,
  ) async {
    final response = await emailLinkRegisterStartWithHttpInfo(
      emailLinkRegisterStartReq,
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
        'EmailLinkRegisterStartRsp',
      ) as EmailLinkRegisterStartRsp;
    }
    return null;
  }

  /// Performs email link login status check
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EmailLinkStatusReq] emailLinkStatusReq (required):
  Future<Response> emailLinkStatusWithHttpInfo(
    EmailLinkStatusReq emailLinkStatusReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/emaillinks/status';

    // ignore: prefer_final_locals
    Object? postBody = emailLinkStatusReq;

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

  /// Performs email link login status check
  ///
  /// Parameters:
  ///
  /// * [EmailLinkStatusReq] emailLinkStatusReq (required):
  Future<EmailLinkStatusRsp?> emailLinkStatus(
    EmailLinkStatusReq emailLinkStatusReq,
  ) async {
    final response = await emailLinkStatusWithHttpInfo(
      emailLinkStatusReq,
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
        'EmailLinkStatusRsp',
      ) as EmailLinkStatusRsp;
    }
    return null;
  }

  /// Performs login for given token
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [LoginTokenReq] loginTokenReq (required):
  Future<Response> loginTokenWithHttpInfo(
    LoginTokenReq loginTokenReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/logintoken';

    // ignore: prefer_final_locals
    Object? postBody = loginTokenReq;

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

  /// Performs login for given token
  ///
  /// Parameters:
  ///
  /// * [LoginTokenReq] loginTokenReq (required):
  Future<LoginTokenRsp?> loginToken(
    LoginTokenReq loginTokenReq,
  ) async {
    final response = await loginTokenWithHttpInfo(
      loginTokenReq,
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
        'LoginTokenRsp',
      ) as LoginTokenRsp;
    }
    return null;
  }

  /// Performs passkey append finish
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyFinishReq] passKeyFinishReq (required):
  Future<Response> passKeyAppendFinishWithHttpInfo(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
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
  Future<PassKeyAppendFinishRsp?> passKeyAppendFinish(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
    final response = await passKeyAppendFinishWithHttpInfo(
      passKeyFinishReq,
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
        'PassKeyAppendFinishRsp',
      ) as PassKeyAppendFinishRsp;
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
  Future<Response> passKeyAppendStartWithHttpInfo(
    EmptyReq emptyReq,
  ) async {
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
  Future<PassKeyStartRsp?> passKeyAppendStart(
    EmptyReq emptyReq,
  ) async {
    final response = await passKeyAppendStartWithHttpInfo(
      emptyReq,
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
        'PassKeyStartRsp',
      ) as PassKeyStartRsp;
    }
    return null;
  }

  /// Performs passkey associate start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyAssociateStartReq] passKeyAssociateStartReq (required):
  Future<Response> passKeyAssociateStartWithHttpInfo(
    PassKeyAssociateStartReq passKeyAssociateStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/associate/start';

    // ignore: prefer_final_locals
    Object? postBody = passKeyAssociateStartReq;

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

  /// Performs passkey associate start
  ///
  /// Parameters:
  ///
  /// * [PassKeyAssociateStartReq] passKeyAssociateStartReq (required):
  Future<PassKeyStartRsp?> passKeyAssociateStart(
    PassKeyAssociateStartReq passKeyAssociateStartReq,
  ) async {
    final response = await passKeyAssociateStartWithHttpInfo(
      passKeyAssociateStartReq,
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
        'PassKeyStartRsp',
      ) as PassKeyStartRsp;
    }
    return null;
  }

  /// Checks if active passkey credential exists for provided user and device
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyCredentialExistsReq] passKeyCredentialExistsReq (required):
  Future<Response> passKeyCredentialExistsWithHttpInfo(
    PassKeyCredentialExistsReq passKeyCredentialExistsReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/device/passkey';

    // ignore: prefer_final_locals
    Object? postBody = passKeyCredentialExistsReq;

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

  /// Checks if active passkey credential exists for provided user and device
  ///
  /// Parameters:
  ///
  /// * [PassKeyCredentialExistsReq] passKeyCredentialExistsReq (required):
  Future<PassKeyCredentialExistsRsp?> passKeyCredentialExists(
    PassKeyCredentialExistsReq passKeyCredentialExistsReq,
  ) async {
    final response = await passKeyCredentialExistsWithHttpInfo(
      passKeyCredentialExistsReq,
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
        'PassKeyCredentialExistsRsp',
      ) as PassKeyCredentialExistsRsp;
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
  Future<Response> passKeyLoginFinishWithHttpInfo(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
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
  Future<PassKeyLoginFinishRsp?> passKeyLoginFinish(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
    final response = await passKeyLoginFinishWithHttpInfo(
      passKeyFinishReq,
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
        'PassKeyLoginFinishRsp',
      ) as PassKeyLoginFinishRsp;
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
  Future<Response> passKeyLoginStartWithHttpInfo(
    PassKeyLoginStartReq passKeyLoginStartReq,
  ) async {
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
  Future<PassKeyStartRsp?> passKeyLoginStart(
    PassKeyLoginStartReq passKeyLoginStartReq,
  ) async {
    final response = await passKeyLoginStartWithHttpInfo(
      passKeyLoginStartReq,
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
        'PassKeyStartRsp',
      ) as PassKeyStartRsp;
    }
    return null;
  }

  /// Performs passkey mediation start
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PassKeyMediationStartReq] passKeyMediationStartReq (required):
  Future<Response> passKeyMediationStartWithHttpInfo(
    PassKeyMediationStartReq passKeyMediationStartReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/passkey/mediation/start';

    // ignore: prefer_final_locals
    Object? postBody = passKeyMediationStartReq;

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

  /// Performs passkey mediation start
  ///
  /// Parameters:
  ///
  /// * [PassKeyMediationStartReq] passKeyMediationStartReq (required):
  Future<PassKeyMediationStartRsp?> passKeyMediationStart(
    PassKeyMediationStartReq passKeyMediationStartReq,
  ) async {
    final response = await passKeyMediationStartWithHttpInfo(
      passKeyMediationStartReq,
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
        'PassKeyMediationStartRsp',
      ) as PassKeyMediationStartRsp;
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
  Future<Response> passKeyRegisterFinishWithHttpInfo(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
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
  Future<PassKeyRegisterFinishRsp?> passKeyRegisterFinish(
    PassKeyFinishReq passKeyFinishReq,
  ) async {
    final response = await passKeyRegisterFinishWithHttpInfo(
      passKeyFinishReq,
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
        'PassKeyRegisterFinishRsp',
      ) as PassKeyRegisterFinishRsp;
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
  Future<Response> passKeyRegisterStartWithHttpInfo(
    PassKeyRegisterStartReq passKeyRegisterStartReq,
  ) async {
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
  Future<PassKeyStartRsp?> passKeyRegisterStart(
    PassKeyRegisterStartReq passKeyRegisterStartReq,
  ) async {
    final response = await passKeyRegisterStartWithHttpInfo(
      passKeyRegisterStartReq,
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
        'PassKeyStartRsp',
      ) as PassKeyStartRsp;
    }
    return null;
  }

  /// Performs password verify
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PasswordVerifyReq] passwordVerifyReq (required):
  Future<Response> passwordWithHttpInfo(
    PasswordVerifyReq passwordVerifyReq,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/v1/users/password/verify';

    // ignore: prefer_final_locals
    Object? postBody = passwordVerifyReq;

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

  /// Performs password verify
  ///
  /// Parameters:
  ///
  /// * [PasswordVerifyReq] passwordVerifyReq (required):
  Future<PasswordVerifyRsp?> password(
    PasswordVerifyReq passwordVerifyReq,
  ) async {
    final response = await passwordWithHttpInfo(
      passwordVerifyReq,
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
        'PasswordVerifyRsp',
      ) as PasswordVerifyRsp;
    }
    return null;
  }
}
