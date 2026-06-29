// ignore_for_file: file_names

import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeyLoginResponse.g.dart';

/// Response returned by the Web SDK after a successful passkey login.
@JsonSerializable()
class PasskeyLoginResponse {
  /// Creates a response from its [id], [rawId] and assertion [response].
  PasskeyLoginResponse(this.id, this.rawId, this.response);

  /// Creates a response from a decoded JSON map.
  factory PasskeyLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginResponseFromJson(json);

  /// The base64url encoded credential identifier.
  final String id;

  /// The raw credential identifier.
  final String rawId;

  /// The authenticator assertion response.
  final AssertionResponse response;

  /// Serializes this response to a JSON map.
  Map<String, dynamic> toJson() => _$PasskeyLoginResponseToJson(this);

  /// Converts this response into the platform interface response type.
  AuthenticateResponseType toAuthenticateResponseType() =>
      AuthenticateResponseType(
        clientDataJSON: response.clientDataJSON,
        authenticatorData: response.authenticatorData,
        signature: response.signature,
        userHandle: response.userHandle ?? '',
        id: id,
        rawId: rawId,
      );
}

/// The authenticator assertion data returned during a passkey login.
@JsonSerializable()
class AssertionResponse {
  /// Creates an assertion response from its fields.
  AssertionResponse(
    this.clientDataJSON,
    this.authenticatorData,
    this.signature,
    this.userHandle,
  );

  /// Creates an assertion response from a decoded JSON map.
  factory AssertionResponse.fromJson(Map<String, dynamic> json) =>
      _$AssertionResponseFromJson(json);

  /// The base64url encoded client data JSON.
  final String clientDataJSON;

  /// The base64url encoded authenticator data.
  final String authenticatorData;

  /// The base64url encoded assertion signature.
  final String signature;

  /// The base64url encoded user handle, if present.
  final String? userHandle;

  /// Serializes this assertion response to a JSON map.
  Map<String, dynamic> toJson() => _$AssertionResponseToJson(this);
}
