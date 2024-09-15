// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_capabilities.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClientCapabilities extends ClientCapabilities {
  @override
  final bool? conditionalCreate;
  @override
  final bool? conditionalMediation;
  @override
  final bool? hybridTransport;
  @override
  final bool? passkeyPlatformAuthenticator;
  @override
  final bool? userVerifyingPlatformAuthenticator;

  factory _$ClientCapabilities(
          [void Function(ClientCapabilitiesBuilder)? updates]) =>
      (new ClientCapabilitiesBuilder()..update(updates))._build();

  _$ClientCapabilities._(
      {this.conditionalCreate,
      this.conditionalMediation,
      this.hybridTransport,
      this.passkeyPlatformAuthenticator,
      this.userVerifyingPlatformAuthenticator})
      : super._();

  @override
  ClientCapabilities rebuild(
          void Function(ClientCapabilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClientCapabilitiesBuilder toBuilder() =>
      new ClientCapabilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClientCapabilities &&
        conditionalCreate == other.conditionalCreate &&
        conditionalMediation == other.conditionalMediation &&
        hybridTransport == other.hybridTransport &&
        passkeyPlatformAuthenticator == other.passkeyPlatformAuthenticator &&
        userVerifyingPlatformAuthenticator ==
            other.userVerifyingPlatformAuthenticator;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, conditionalCreate.hashCode);
    _$hash = $jc(_$hash, conditionalMediation.hashCode);
    _$hash = $jc(_$hash, hybridTransport.hashCode);
    _$hash = $jc(_$hash, passkeyPlatformAuthenticator.hashCode);
    _$hash = $jc(_$hash, userVerifyingPlatformAuthenticator.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClientCapabilities')
          ..add('conditionalCreate', conditionalCreate)
          ..add('conditionalMediation', conditionalMediation)
          ..add('hybridTransport', hybridTransport)
          ..add('passkeyPlatformAuthenticator', passkeyPlatformAuthenticator)
          ..add('userVerifyingPlatformAuthenticator',
              userVerifyingPlatformAuthenticator))
        .toString();
  }
}

class ClientCapabilitiesBuilder
    implements Builder<ClientCapabilities, ClientCapabilitiesBuilder> {
  _$ClientCapabilities? _$v;

  bool? _conditionalCreate;
  bool? get conditionalCreate => _$this._conditionalCreate;
  set conditionalCreate(bool? conditionalCreate) =>
      _$this._conditionalCreate = conditionalCreate;

  bool? _conditionalMediation;
  bool? get conditionalMediation => _$this._conditionalMediation;
  set conditionalMediation(bool? conditionalMediation) =>
      _$this._conditionalMediation = conditionalMediation;

  bool? _hybridTransport;
  bool? get hybridTransport => _$this._hybridTransport;
  set hybridTransport(bool? hybridTransport) =>
      _$this._hybridTransport = hybridTransport;

  bool? _passkeyPlatformAuthenticator;
  bool? get passkeyPlatformAuthenticator =>
      _$this._passkeyPlatformAuthenticator;
  set passkeyPlatformAuthenticator(bool? passkeyPlatformAuthenticator) =>
      _$this._passkeyPlatformAuthenticator = passkeyPlatformAuthenticator;

  bool? _userVerifyingPlatformAuthenticator;
  bool? get userVerifyingPlatformAuthenticator =>
      _$this._userVerifyingPlatformAuthenticator;
  set userVerifyingPlatformAuthenticator(
          bool? userVerifyingPlatformAuthenticator) =>
      _$this._userVerifyingPlatformAuthenticator =
          userVerifyingPlatformAuthenticator;

  ClientCapabilitiesBuilder() {
    ClientCapabilities._defaults(this);
  }

  ClientCapabilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _conditionalCreate = $v.conditionalCreate;
      _conditionalMediation = $v.conditionalMediation;
      _hybridTransport = $v.hybridTransport;
      _passkeyPlatformAuthenticator = $v.passkeyPlatformAuthenticator;
      _userVerifyingPlatformAuthenticator =
          $v.userVerifyingPlatformAuthenticator;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClientCapabilities other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ClientCapabilities;
  }

  @override
  void update(void Function(ClientCapabilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClientCapabilities build() => _build();

  _$ClientCapabilities _build() {
    final _$result = _$v ??
        new _$ClientCapabilities._(
            conditionalCreate: conditionalCreate,
            conditionalMediation: conditionalMediation,
            hybridTransport: hybridTransport,
            passkeyPlatformAuthenticator: passkeyPlatformAuthenticator,
            userVerifyingPlatformAuthenticator:
                userVerifyingPlatformAuthenticator);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
