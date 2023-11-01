import 'package:json_annotation/json_annotation.dart';
import 'package:passkeys_platform_interface/types/types.dart';

part 'passkeyLoginResponse.g.dart';

@JsonSerializable()
class PasskeyLoginResponse {
  factory PasskeyLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$PasskeyLoginResponseFromJson(json);

  PasskeyLoginResponse(this.id, this.rawId, this.response);

  final String id;
  final String rawId;
  final AssertionResponse response;

  Map<String, dynamic> toJson() => _$PasskeyLoginResponseToJson(this);

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

@JsonSerializable()
class AssertionResponse {
  factory AssertionResponse.fromJson(Map<String, dynamic> json) =>
      _$AssertionResponseFromJson(json);

  AssertionResponse(this.clientDataJSON, this.authenticatorData, this.signature,
      this.userHandle);

  final String clientDataJSON;
  final String authenticatorData;
  final String signature;
  final String? userHandle;

  Map<String, dynamic> toJson() => _$AssertionResponseToJson(this);
}
