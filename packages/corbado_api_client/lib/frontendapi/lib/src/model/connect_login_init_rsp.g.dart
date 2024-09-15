// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_init_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectLoginInitRsp extends ConnectLoginInitRsp {
  @override
  final String token;
  @override
  final int expiresAt;
  @override
  final String frontendApiUrl;
  @override
  final bool loginAllowed;
  @override
  final BuiltMap<String, String> flags;
  @override
  final String? newClientEnvHandle;
  @override
  final String? conditionalUIChallenge;

  factory _$ConnectLoginInitRsp(
          [void Function(ConnectLoginInitRspBuilder)? updates]) =>
      (new ConnectLoginInitRspBuilder()..update(updates))._build();

  _$ConnectLoginInitRsp._(
      {required this.token,
      required this.expiresAt,
      required this.frontendApiUrl,
      required this.loginAllowed,
      required this.flags,
      this.newClientEnvHandle,
      this.conditionalUIChallenge})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        token, r'ConnectLoginInitRsp', 'token');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'ConnectLoginInitRsp', 'expiresAt');
    BuiltValueNullFieldError.checkNotNull(
        frontendApiUrl, r'ConnectLoginInitRsp', 'frontendApiUrl');
    BuiltValueNullFieldError.checkNotNull(
        loginAllowed, r'ConnectLoginInitRsp', 'loginAllowed');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectLoginInitRsp', 'flags');
  }

  @override
  ConnectLoginInitRsp rebuild(
          void Function(ConnectLoginInitRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginInitRspBuilder toBuilder() =>
      new ConnectLoginInitRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginInitRsp &&
        token == other.token &&
        expiresAt == other.expiresAt &&
        frontendApiUrl == other.frontendApiUrl &&
        loginAllowed == other.loginAllowed &&
        flags == other.flags &&
        newClientEnvHandle == other.newClientEnvHandle &&
        conditionalUIChallenge == other.conditionalUIChallenge;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, frontendApiUrl.hashCode);
    _$hash = $jc(_$hash, loginAllowed.hashCode);
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jc(_$hash, newClientEnvHandle.hashCode);
    _$hash = $jc(_$hash, conditionalUIChallenge.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginInitRsp')
          ..add('token', token)
          ..add('expiresAt', expiresAt)
          ..add('frontendApiUrl', frontendApiUrl)
          ..add('loginAllowed', loginAllowed)
          ..add('flags', flags)
          ..add('newClientEnvHandle', newClientEnvHandle)
          ..add('conditionalUIChallenge', conditionalUIChallenge))
        .toString();
  }
}

class ConnectLoginInitRspBuilder
    implements Builder<ConnectLoginInitRsp, ConnectLoginInitRspBuilder> {
  _$ConnectLoginInitRsp? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _expiresAt;
  int? get expiresAt => _$this._expiresAt;
  set expiresAt(int? expiresAt) => _$this._expiresAt = expiresAt;

  String? _frontendApiUrl;
  String? get frontendApiUrl => _$this._frontendApiUrl;
  set frontendApiUrl(String? frontendApiUrl) =>
      _$this._frontendApiUrl = frontendApiUrl;

  bool? _loginAllowed;
  bool? get loginAllowed => _$this._loginAllowed;
  set loginAllowed(bool? loginAllowed) => _$this._loginAllowed = loginAllowed;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  String? _newClientEnvHandle;
  String? get newClientEnvHandle => _$this._newClientEnvHandle;
  set newClientEnvHandle(String? newClientEnvHandle) =>
      _$this._newClientEnvHandle = newClientEnvHandle;

  String? _conditionalUIChallenge;
  String? get conditionalUIChallenge => _$this._conditionalUIChallenge;
  set conditionalUIChallenge(String? conditionalUIChallenge) =>
      _$this._conditionalUIChallenge = conditionalUIChallenge;

  ConnectLoginInitRspBuilder() {
    ConnectLoginInitRsp._defaults(this);
  }

  ConnectLoginInitRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _expiresAt = $v.expiresAt;
      _frontendApiUrl = $v.frontendApiUrl;
      _loginAllowed = $v.loginAllowed;
      _flags = $v.flags.toBuilder();
      _newClientEnvHandle = $v.newClientEnvHandle;
      _conditionalUIChallenge = $v.conditionalUIChallenge;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginInitRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginInitRsp;
  }

  @override
  void update(void Function(ConnectLoginInitRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginInitRsp build() => _build();

  _$ConnectLoginInitRsp _build() {
    _$ConnectLoginInitRsp _$result;
    try {
      _$result = _$v ??
          new _$ConnectLoginInitRsp._(
              token: BuiltValueNullFieldError.checkNotNull(
                  token, r'ConnectLoginInitRsp', 'token'),
              expiresAt: BuiltValueNullFieldError.checkNotNull(
                  expiresAt, r'ConnectLoginInitRsp', 'expiresAt'),
              frontendApiUrl: BuiltValueNullFieldError.checkNotNull(
                  frontendApiUrl, r'ConnectLoginInitRsp', 'frontendApiUrl'),
              loginAllowed: BuiltValueNullFieldError.checkNotNull(
                  loginAllowed, r'ConnectLoginInitRsp', 'loginAllowed'),
              flags: flags.build(),
              newClientEnvHandle: newClientEnvHandle,
              conditionalUIChallenge: conditionalUIChallenge);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flags';
        flags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectLoginInitRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
