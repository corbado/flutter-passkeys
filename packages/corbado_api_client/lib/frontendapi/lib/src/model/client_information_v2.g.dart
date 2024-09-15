// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_information_v2.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientInformationV2 extends ClientInformationV2 {
  @override
  final bool? bluetoothAvailable;
  @override
  final String? clientEnvHandle;
  @override
  final String? visitorId;
  @override
  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
  @override
  final bool? isConditionalMediationAvailable;
  @override
  final ClientCapabilities? clientCapabilities;
  @override
  final JavaScriptHighEntropy? javaScriptHighEntropy;

  factory _$ClientInformationV2(
          [void Function(ClientInformationV2Builder)? updates]) =>
      (new ClientInformationV2Builder()..update(updates))._build();

  _$ClientInformationV2._(
      {this.bluetoothAvailable,
      this.clientEnvHandle,
      this.visitorId,
      this.isUserVerifyingPlatformAuthenticatorAvailable,
      this.isConditionalMediationAvailable,
      this.clientCapabilities,
      this.javaScriptHighEntropy})
      : super._();

  @override
  ClientInformationV2 rebuild(
          void Function(ClientInformationV2Builder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientInformationV2Builder toBuilder() =>
      new ClientInformationV2Builder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientInformationV2 &&
        bluetoothAvailable == other.bluetoothAvailable &&
        clientEnvHandle == other.clientEnvHandle &&
        visitorId == other.visitorId &&
        isUserVerifyingPlatformAuthenticatorAvailable ==
            other.isUserVerifyingPlatformAuthenticatorAvailable &&
        isConditionalMediationAvailable ==
            other.isConditionalMediationAvailable &&
        clientCapabilities == other.clientCapabilities &&
        javaScriptHighEntropy == other.javaScriptHighEntropy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, bluetoothAvailable.hashCode);
    _$hash = $jc(_$hash, clientEnvHandle.hashCode);
    _$hash = $jc(_$hash, visitorId.hashCode);
    _$hash =
        $jc(_$hash, isUserVerifyingPlatformAuthenticatorAvailable.hashCode);
    _$hash = $jc(_$hash, isConditionalMediationAvailable.hashCode);
    _$hash = $jc(_$hash, clientCapabilities.hashCode);
    _$hash = $jc(_$hash, javaScriptHighEntropy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientInformationV2')
          ..add('bluetoothAvailable', bluetoothAvailable)
          ..add('clientEnvHandle', clientEnvHandle)
          ..add('visitorId', visitorId)
          ..add('isUserVerifyingPlatformAuthenticatorAvailable',
              isUserVerifyingPlatformAuthenticatorAvailable)
          ..add('isConditionalMediationAvailable',
              isConditionalMediationAvailable)
          ..add('clientCapabilities', clientCapabilities)
          ..add('javaScriptHighEntropy', javaScriptHighEntropy))
        .toString();
  }
}

class ClientInformationV2Builder
    implements Builder<ClientInformationV2, ClientInformationV2Builder> {
  _$ClientInformationV2? _$v;

  bool? _bluetoothAvailable;
  bool? get bluetoothAvailable => _$this._bluetoothAvailable;
  set bluetoothAvailable(bool? bluetoothAvailable) =>
      _$this._bluetoothAvailable = bluetoothAvailable;

  String? _clientEnvHandle;
  String? get clientEnvHandle => _$this._clientEnvHandle;
  set clientEnvHandle(String? clientEnvHandle) =>
      _$this._clientEnvHandle = clientEnvHandle;

  String? _visitorId;
  String? get visitorId => _$this._visitorId;
  set visitorId(String? visitorId) => _$this._visitorId = visitorId;

  bool? _isUserVerifyingPlatformAuthenticatorAvailable;
  bool? get isUserVerifyingPlatformAuthenticatorAvailable =>
      _$this._isUserVerifyingPlatformAuthenticatorAvailable;
  set isUserVerifyingPlatformAuthenticatorAvailable(
          bool? isUserVerifyingPlatformAuthenticatorAvailable) =>
      _$this._isUserVerifyingPlatformAuthenticatorAvailable =
          isUserVerifyingPlatformAuthenticatorAvailable;

  bool? _isConditionalMediationAvailable;
  bool? get isConditionalMediationAvailable =>
      _$this._isConditionalMediationAvailable;
  set isConditionalMediationAvailable(bool? isConditionalMediationAvailable) =>
      _$this._isConditionalMediationAvailable = isConditionalMediationAvailable;

  ClientCapabilitiesBuilder? _clientCapabilities;
  ClientCapabilitiesBuilder get clientCapabilities =>
      _$this._clientCapabilities ??= new ClientCapabilitiesBuilder();
  set clientCapabilities(ClientCapabilitiesBuilder? clientCapabilities) =>
      _$this._clientCapabilities = clientCapabilities;

  JavaScriptHighEntropyBuilder? _javaScriptHighEntropy;
  JavaScriptHighEntropyBuilder get javaScriptHighEntropy =>
      _$this._javaScriptHighEntropy ??= new JavaScriptHighEntropyBuilder();
  set javaScriptHighEntropy(
          JavaScriptHighEntropyBuilder? javaScriptHighEntropy) =>
      _$this._javaScriptHighEntropy = javaScriptHighEntropy;

  ClientInformationV2Builder() {
    ClientInformationV2._defaults(this);
  }

  ClientInformationV2Builder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bluetoothAvailable = $v.bluetoothAvailable;
      _clientEnvHandle = $v.clientEnvHandle;
      _visitorId = $v.visitorId;
      _isUserVerifyingPlatformAuthenticatorAvailable =
          $v.isUserVerifyingPlatformAuthenticatorAvailable;
      _isConditionalMediationAvailable = $v.isConditionalMediationAvailable;
      _clientCapabilities = $v.clientCapabilities?.toBuilder();
      _javaScriptHighEntropy = $v.javaScriptHighEntropy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientInformationV2 other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientInformationV2;
  }

  @override
  void update(void Function(ClientInformationV2Builder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientInformationV2 build() => _build();

  _$ClientInformationV2 _build() {
    _$ClientInformationV2 _$result;
    try {
      _$result = _$v ??
          new _$ClientInformationV2._(
              bluetoothAvailable: bluetoothAvailable,
              clientEnvHandle: clientEnvHandle,
              visitorId: visitorId,
              isUserVerifyingPlatformAuthenticatorAvailable:
                  isUserVerifyingPlatformAuthenticatorAvailable,
              isConditionalMediationAvailable: isConditionalMediationAvailable,
              clientCapabilities: _clientCapabilities?.build(),
              javaScriptHighEntropy: _javaScriptHighEntropy?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientCapabilities';
        _clientCapabilities?.build();
        _$failedField = 'javaScriptHighEntropy';
        _javaScriptHighEntropy?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ClientInformationV2', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
