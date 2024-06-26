//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({
    this.basePath = 'https://<project ID>.frontendapi.corbado.io',
    this.authentication,
  });

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
    _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty
        ? '?${urlEncodedQueryParams.join('&')}'
        : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (body is MultipartFile &&
          (contentType == null ||
              !contentType.toLowerCase().startsWith('multipart/form-data'))) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
              request.sink.add,
              onDone: request.sink.close,
              // ignore: avoid_types_on_closure_parameters
              onError: (Object error, StackTrace trace) => request.sink.close(),
              cancelOnError: true,
            );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
          ? formParams
          : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch (method) {
        case 'POST':
          return await _client.post(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PUT':
          return await _client.put(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'DELETE':
          return await _client.delete(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'PATCH':
          return await _client.patch(
            uri,
            headers: nullableHeaderParams,
            body: msgBody,
          );
        case 'HEAD':
          return await _client.head(
            uri,
            headers: nullableHeaderParams,
          );
        case 'GET':
          return await _client.get(
            uri,
            headers: nullableHeaderParams,
          );
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(
    String value,
    String targetType, {
    bool growable = false,
  }) async =>
      // ignore: deprecated_member_use_from_same_package
      deserialize(value, targetType, growable: growable);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(
    String value,
    String targetType, {
    bool growable = false,
  }) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType =
        targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
        ? value
        : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated(
      'Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(
    dynamic value,
    String targetType, {
    bool growable = false,
  }) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'AppleAppSiteAssociationRsp':
          return AppleAppSiteAssociationRsp.fromJson(value);
        case 'AppleAppSiteAssociationRspApplinks':
          return AppleAppSiteAssociationRspApplinks.fromJson(value);
        case 'AppleAppSiteAssociationRspApplinksDetailsInner':
          return AppleAppSiteAssociationRspApplinksDetailsInner.fromJson(value);
        case 'AppleAppSiteAssociationRspWebcredentials':
          return AppleAppSiteAssociationRspWebcredentials.fromJson(value);
        case 'AssetLink':
          return AssetLink.fromJson(value);
        case 'AssetLinkTarget':
          return AssetLinkTarget.fromJson(value);
        case 'AuthMethod':
          return AuthMethodTypeTransformer().decode(value);
        case 'AuthMethodsListReq':
          return AuthMethodsListReq.fromJson(value);
        case 'AuthMethodsListRsp':
          return AuthMethodsListRsp.fromJson(value);
        case 'AuthMethodsListRspAllOfData':
          return AuthMethodsListRspAllOfData.fromJson(value);
        case 'AuthenticationRsp':
          return AuthenticationRsp.fromJson(value);
        case 'EmailCodeConfirmReq':
          return EmailCodeConfirmReq.fromJson(value);
        case 'EmailCodeConfirmRsp':
          return EmailCodeConfirmRsp.fromJson(value);
        case 'EmailCodeConfirmRspAllOfData':
          return EmailCodeConfirmRspAllOfData.fromJson(value);
        case 'EmailCodeLoginStartReq':
          return EmailCodeLoginStartReq.fromJson(value);
        case 'EmailCodeLoginStartRsp':
          return EmailCodeLoginStartRsp.fromJson(value);
        case 'EmailCodeRegisterStartReq':
          return EmailCodeRegisterStartReq.fromJson(value);
        case 'EmailCodeRegisterStartRsp':
          return EmailCodeRegisterStartRsp.fromJson(value);
        case 'EmailCodeRegisterStartRspAllOfData':
          return EmailCodeRegisterStartRspAllOfData.fromJson(value);
        case 'EmailCodeStatusReq':
          return EmailCodeStatusReq.fromJson(value);
        case 'EmailCodeStatusRsp':
          return EmailCodeStatusRsp.fromJson(value);
        case 'EmailLinkConfirmReq':
          return EmailLinkConfirmReq.fromJson(value);
        case 'EmailLinkConfirmRsp':
          return EmailLinkConfirmRsp.fromJson(value);
        case 'EmailLinkConfirmRspAllOfData':
          return EmailLinkConfirmRspAllOfData.fromJson(value);
        case 'EmailLinkLoginStartReq':
          return EmailLinkLoginStartReq.fromJson(value);
        case 'EmailLinkLoginStartRsp':
          return EmailLinkLoginStartRsp.fromJson(value);
        case 'EmailLinkRegisterStartReq':
          return EmailLinkRegisterStartReq.fromJson(value);
        case 'EmailLinkRegisterStartRsp':
          return EmailLinkRegisterStartRsp.fromJson(value);
        case 'EmailLinkRegisterStartRspAllOfData':
          return EmailLinkRegisterStartRspAllOfData.fromJson(value);
        case 'EmailLinkStatusReq':
          return EmailLinkStatusReq.fromJson(value);
        case 'EmailLinkStatusRsp':
          return EmailLinkStatusRsp.fromJson(value);
        case 'EmptyReq':
          return EmptyReq.fromJson(value);
        case 'ErrorRsp':
          return ErrorRsp.fromJson(value);
        case 'ErrorRspAllOfError':
          return ErrorRspAllOfError.fromJson(value);
        case 'ErrorRspAllOfErrorValidation':
          return ErrorRspAllOfErrorValidation.fromJson(value);
        case 'FullUser':
          return FullUser.fromJson(value);
        case 'GenericRsp':
          return GenericRsp.fromJson(value);
        case 'Jwk':
          return Jwk.fromJson(value);
        case 'LoginIdentifierType':
          return LoginIdentifierTypeTypeTransformer().decode(value);
        case 'LoginTokenReq':
          return LoginTokenReq.fromJson(value);
        case 'LoginTokenRsp':
          return LoginTokenRsp.fromJson(value);
        case 'LogoutRsp':
          return LogoutRsp.fromJson(value);
        case 'MePassKeyRsp':
          return MePassKeyRsp.fromJson(value);
        case 'MeRsp':
          return MeRsp.fromJson(value);
        case 'Paging':
          return Paging.fromJson(value);
        case 'PassKeyAppendFinishRsp':
          return PassKeyAppendFinishRsp.fromJson(value);
        case 'PassKeyAppendFinishRspAllOfData':
          return PassKeyAppendFinishRspAllOfData.fromJson(value);
        case 'PassKeyAssociateStartReq':
          return PassKeyAssociateStartReq.fromJson(value);
        case 'PassKeyCredentialExistsReq':
          return PassKeyCredentialExistsReq.fromJson(value);
        case 'PassKeyCredentialExistsRsp':
          return PassKeyCredentialExistsRsp.fromJson(value);
        case 'PassKeyFinishReq':
          return PassKeyFinishReq.fromJson(value);
        case 'PassKeyItem':
          return PassKeyItem.fromJson(value);
        case 'PassKeyList':
          return PassKeyList.fromJson(value);
        case 'PassKeyLoginFinishRsp':
          return PassKeyLoginFinishRsp.fromJson(value);
        case 'PassKeyLoginFinishRspAllOfData':
          return PassKeyLoginFinishRspAllOfData.fromJson(value);
        case 'PassKeyLoginStartReq':
          return PassKeyLoginStartReq.fromJson(value);
        case 'PassKeyMediationStartReq':
          return PassKeyMediationStartReq.fromJson(value);
        case 'PassKeyMediationStartRsp':
          return PassKeyMediationStartRsp.fromJson(value);
        case 'PassKeyMediationStartRspAllOfData':
          return PassKeyMediationStartRspAllOfData.fromJson(value);
        case 'PassKeyRegisterFinishRsp':
          return PassKeyRegisterFinishRsp.fromJson(value);
        case 'PassKeyRegisterStartReq':
          return PassKeyRegisterStartReq.fromJson(value);
        case 'PassKeyStartRsp':
          return PassKeyStartRsp.fromJson(value);
        case 'PassKeyStartRspAllOfData':
          return PassKeyStartRspAllOfData.fromJson(value);
        case 'PasswordVerifyReq':
          return PasswordVerifyReq.fromJson(value);
        case 'PasswordVerifyRsp':
          return PasswordVerifyRsp.fromJson(value);
        case 'ProjectConfigRsp':
          return ProjectConfigRsp.fromJson(value);
        case 'ProjectConfigRspAllOfData':
          return ProjectConfigRspAllOfData.fromJson(value);
        case 'RequestData':
          return RequestData.fromJson(value);
        case 'SessionRefreshRsp':
          return SessionRefreshRsp.fromJson(value);
        case 'ShortSession':
          return ShortSession.fromJson(value);
        case 'Status':
          return StatusTypeTransformer().decode(value);
        case 'UserEmail':
          return UserEmail.fromJson(value);
        case 'UserPhoneNumber':
          return UserPhoneNumber.fromJson(value);
        case 'WellKnownJWKSListRsp':
          return WellKnownJWKSListRsp.fromJson(value);
        default:
          dynamic match;
          if (value is List &&
              (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toList(growable: growable);
          }
          if (value is Set &&
              (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
                .map<dynamic>((dynamic v) => fromJson(
                      v,
                      match,
                      growable: growable,
                    ))
                .toSet();
          }
          if (value is Map &&
              (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(
                    v,
                    match,
                    growable: growable,
                  )),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.internalServerError,
        'Exception during deserialization.',
        error,
        trace,
      );
    }
    throw ApiException(
      HttpStatus.internalServerError,
      'Could not find a suitable class for deserialization',
    );
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String' ? message.json : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
      ? message.json
      : ApiClient.fromJson(
          json.decode(message.json),
          targetType,
          growable: message.growable,
        );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async =>
    value == null ? '' : json.encode(value);
