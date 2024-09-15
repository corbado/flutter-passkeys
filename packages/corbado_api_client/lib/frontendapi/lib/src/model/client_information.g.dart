// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_information.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientInformation extends ClientInformation {
  @override
  final bool? bluetoothAvailable;
  @override
  final String? clientEnvHandle;
  @override
  final String? visitorId;
  @override
  final bool? canUsePasskeys;
  @override
  final bool? isUserVerifyingPlatformAuthenticatorAvailable;
  @override
  final bool? isConditionalMediationAvailable;
  @override
  final ClientCapabilities? clientCapabilities;
  @override
  final JavaScriptHighEntropy? javaScriptHighEntropy;

  factory _$ClientInformation(
          [void Function(ClientInformationBuilder)? updates]) =>
      (new ClientInformationBuilder()..update(updates))._build();

  _$ClientInformation._(
      {this.bluetoothAvailable,
      this.clientEnvHandle,
      this.visitorId,
      this.canUsePasskeys,
      this.isUserVerifyingPlatformAuthenticatorAvailable,
      this.isConditionalMediationAvailable,
      this.clientCapabilities,
      this.javaScriptHighEntropy})
      : super._();

  @override
  ClientInformation rebuild(void Function(ClientInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientInformationBuilder toBuilder() =>
      new ClientInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientInformation &&
        bluetoothAvailable == other.bluetoothAvailable &&
        clientEnvHandle == other.clientEnvHandle &&
        visitorId == other.visitorId &&
        canUsePasskeys == other.canUsePasskeys &&
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
    _$hash = $jc(_$hash, canUsePasskeys.hashCode);
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
    return (newBuiltValueToStringHelper(r'ClientInformation')
          ..add('bluetoothAvailable', bluetoothAvailable)
          ..add('clientEnvHandle', clientEnvHandle)
          ..add('visitorId', visitorId)
          ..add('canUsePasskeys', canUsePasskeys)
          ..add('isUserVerifyingPlatformAuthenticatorAvailable',
              isUserVerifyingPlatformAuthenticatorAvailable)
          ..add('isConditionalMediationAvailable',
              isConditionalMediationAvailable)
          ..add('clientCapabilities', clientCapabilities)
          ..add('javaScriptHighEntropy', javaScriptHighEntropy))
        .toString();
  }
}

class ClientInformationBuilder
    implements Builder<ClientInformation, ClientInformationBuilder> {
  _$ClientInformation? _$v;

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

  bool? _canUsePasskeys;
  bool? get canUsePasskeys => _$this._canUsePasskeys;
  set canUsePasskeys(bool? canUsePasskeys) =>
      _$this._canUsePasskeys = canUsePasskeys;

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

  ClientInformationBuilder() {
    ClientInformation._defaults(this);
  }

  ClientInformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _bluetoothAvailable = $v.bluetoothAvailable;
      _clientEnvHandle = $v.clientEnvHandle;
      _visitorId = $v.visitorId;
      _canUsePasskeys = $v.canUsePasskeys;
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
  void replace(ClientInformation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientInformation;
  }

  @override
  void update(void Function(ClientInformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientInformation build() => _build();

  _$ClientInformation _build() {
    _$ClientInformation _$result;
    try {
      _$result = _$v ??
          new _$ClientInformation._(
              bluetoothAvailable: bluetoothAvailable,
              clientEnvHandle: clientEnvHandle,
              visitorId: visitorId,
              canUsePasskeys: canUsePasskeys,
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
            r'ClientInformation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
