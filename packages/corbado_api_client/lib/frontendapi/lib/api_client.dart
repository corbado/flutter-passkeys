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
        case 'AuthType':
          return AuthTypeTypeTransformer().decode(value);
        case 'AuthenticationResponse':
          return AuthenticationResponse.fromJson(value);
        case 'BlockBody':
          return BlockBody.fromJson(value);
        case 'BlockBodyData':
          return BlockBodyData.fromJson(value);
        case 'BlockType':
          return BlockTypeTypeTransformer().decode(value);
        case 'ClientCapabilities':
          return ClientCapabilities.fromJson(value);
        case 'ClientInformation':
          return ClientInformation.fromJson(value);
        case 'ClientInformationV2':
          return ClientInformationV2.fromJson(value);
        case 'ConnectAppendFinishReq':
          return ConnectAppendFinishReq.fromJson(value);
        case 'ConnectAppendFinishRsp':
          return ConnectAppendFinishRsp.fromJson(value);
        case 'ConnectAppendInitReq':
          return ConnectAppendInitReq.fromJson(value);
        case 'ConnectAppendInitRsp':
          return ConnectAppendInitRsp.fromJson(value);
        case 'ConnectAppendStartReq':
          return ConnectAppendStartReq.fromJson(value);
        case 'ConnectAppendStartRsp':
          return ConnectAppendStartRsp.fromJson(value);
        case 'ConnectEventCreateReq':
          return ConnectEventCreateReq.fromJson(value);
        case 'ConnectLoginFinishReq':
          return ConnectLoginFinishReq.fromJson(value);
        case 'ConnectLoginFinishRsp':
          return ConnectLoginFinishRsp.fromJson(value);
        case 'ConnectLoginInitReq':
          return ConnectLoginInitReq.fromJson(value);
        case 'ConnectLoginInitRsp':
          return ConnectLoginInitRsp.fromJson(value);
        case 'ConnectLoginStartReq':
          return ConnectLoginStartReq.fromJson(value);
        case 'ConnectLoginStartRsp':
          return ConnectLoginStartRsp.fromJson(value);
        case 'ConnectManageDeleteReq':
          return ConnectManageDeleteReq.fromJson(value);
        case 'ConnectManageDeleteRsp':
          return ConnectManageDeleteRsp.fromJson(value);
        case 'ConnectManageInitReq':
          return ConnectManageInitReq.fromJson(value);
        case 'ConnectManageInitRsp':
          return ConnectManageInitRsp.fromJson(value);
        case 'ConnectManageListReq':
          return ConnectManageListReq.fromJson(value);
        case 'ConnectManageListRsp':
          return ConnectManageListRsp.fromJson(value);
        case 'ContinueOnOtherDevice':
          return ContinueOnOtherDevice.fromJson(value);
        case 'EventCreateReq':
          return EventCreateReq.fromJson(value);
        case 'FullNameWithError':
          return FullNameWithError.fromJson(value);
        case 'GeneralBlockLoginInit':
          return GeneralBlockLoginInit.fromJson(value);
        case 'GeneralBlockPasskeyAppend':
          return GeneralBlockPasskeyAppend.fromJson(value);
        case 'GeneralBlockPasskeyVerify':
          return GeneralBlockPasskeyVerify.fromJson(value);
        case 'GeneralBlockPostSignupEmailVerify':
          return GeneralBlockPostSignupEmailVerify.fromJson(value);
        case 'GeneralBlockSignupInit':
          return GeneralBlockSignupInit.fromJson(value);
        case 'GeneralBlockVerifyIdentifier':
          return GeneralBlockVerifyIdentifier.fromJson(value);
        case 'GenericRsp':
          return GenericRsp.fromJson(value);
        case 'Identifier':
          return Identifier.fromJson(value);
        case 'IdentifierUpdateReq':
          return IdentifierUpdateReq.fromJson(value);
        case 'IdentifierVerifyFinishReq':
          return IdentifierVerifyFinishReq.fromJson(value);
        case 'IdentifierVerifyStartReq':
          return IdentifierVerifyStartReq.fromJson(value);
        case 'JavaScriptHighEntropy':
          return JavaScriptHighEntropy.fromJson(value);
        case 'LoginIdentifier':
          return LoginIdentifier.fromJson(value);
        case 'LoginIdentifierConfig':
          return LoginIdentifierConfig.fromJson(value);
        case 'LoginIdentifierType':
          return LoginIdentifierTypeTypeTransformer().decode(value);
        case 'LoginIdentifierWithError':
          return LoginIdentifierWithError.fromJson(value);
        case 'LoginInitReq':
          return LoginInitReq.fromJson(value);
        case 'MeIdentifierCreateReq':
          return MeIdentifierCreateReq.fromJson(value);
        case 'MeIdentifierDeleteReq':
          return MeIdentifierDeleteReq.fromJson(value);
        case 'MeIdentifierUpdateReq':
          return MeIdentifierUpdateReq.fromJson(value);
        case 'MeIdentifierVerifyFinishReq':
          return MeIdentifierVerifyFinishReq.fromJson(value);
        case 'MeIdentifierVerifyStartReq':
          return MeIdentifierVerifyStartReq.fromJson(value);
        case 'MePasskeyDeleteRsp':
          return MePasskeyDeleteRsp.fromJson(value);
        case 'MePasskeyRsp':
          return MePasskeyRsp.fromJson(value);
        case 'MePasskeysAppendFinishReq':
          return MePasskeysAppendFinishReq.fromJson(value);
        case 'MePasskeysAppendStartReq':
          return MePasskeysAppendStartReq.fromJson(value);
        case 'MePasskeysAppendStartRsp':
          return MePasskeysAppendStartRsp.fromJson(value);
        case 'MeRefreshRsp':
          return MeRefreshRsp.fromJson(value);
        case 'MeRsp':
          return MeRsp.fromJson(value);
        case 'MeUpdateReq':
          return MeUpdateReq.fromJson(value);
        case 'Paging':
          return Paging.fromJson(value);
        case 'Passkey':
          return Passkey.fromJson(value);
        case 'PasskeyAppendFinishReq':
          return PasskeyAppendFinishReq.fromJson(value);
        case 'PasskeyEventType':
          return PasskeyEventTypeTypeTransformer().decode(value);
        case 'PasskeyIconSet':
          return PasskeyIconSetTypeTransformer().decode(value);
        case 'PasskeyLoginFinishReq':
          return PasskeyLoginFinishReq.fromJson(value);
        case 'PasskeyMediationFinishReq':
          return PasskeyMediationFinishReq.fromJson(value);
        case 'PasskeyOperation':
          return PasskeyOperation.fromJson(value);
        case 'PhoneCollectReq':
          return PhoneCollectReq.fromJson(value);
        case 'ProcessCommon':
          return ProcessCommon.fromJson(value);
        case 'ProcessInitReq':
          return ProcessInitReq.fromJson(value);
        case 'ProcessInitRsp':
          return ProcessInitRsp.fromJson(value);
        case 'ProcessResponse':
          return ProcessResponse.fromJson(value);
        case 'ProcessStaticInfo':
          return ProcessStaticInfo.fromJson(value);
        case 'RequestData':
          return RequestData.fromJson(value);
        case 'RequestError':
          return RequestError.fromJson(value);
        case 'SessionConfigRsp':
          return SessionConfigRsp.fromJson(value);
        case 'ShortSessionCookieConfig':
          return ShortSessionCookieConfig.fromJson(value);
        case 'SignupInitReq':
          return SignupInitReq.fromJson(value);
        case 'SocialAccount':
          return SocialAccount.fromJson(value);
        case 'SocialData':
          return SocialData.fromJson(value);
        case 'SocialProviderType':
          return SocialProviderTypeTypeTransformer().decode(value);
        case 'SocialVerifyStartReq':
          return SocialVerifyStartReq.fromJson(value);
        case 'UserDetailsConfigRsp':
          return UserDetailsConfigRsp.fromJson(value);
        case 'UsernameCollectReq':
          return UsernameCollectReq.fromJson(value);
        case 'VerificationMethod':
          return VerificationMethodTypeTransformer().decode(value);
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
