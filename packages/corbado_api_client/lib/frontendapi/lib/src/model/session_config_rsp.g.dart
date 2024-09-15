// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_config_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SessionConfigRsp extends SessionConfigRsp {
  @override
  final bool useSessionManagement;
  @override
  final ShortSessionCookieConfig? shortSessionCookieConfig;
  @override
  final String? frontendApiUrl;

  factory _$SessionConfigRsp(
          [void Function(SessionConfigRspBuilder)? updates]) =>
      (new SessionConfigRspBuilder()..update(updates))._build();

  _$SessionConfigRsp._(
      {required this.useSessionManagement,
      this.shortSessionCookieConfig,
      this.frontendApiUrl})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        useSessionManagement, r'SessionConfigRsp', 'useSessionManagement');
  }

  @override
  SessionConfigRsp rebuild(void Function(SessionConfigRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SessionConfigRspBuilder toBuilder() =>
      new SessionConfigRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SessionConfigRsp &&
        useSessionManagement == other.useSessionManagement &&
        shortSessionCookieConfig == other.shortSessionCookieConfig &&
        frontendApiUrl == other.frontendApiUrl;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, useSessionManagement.hashCode);
    _$hash = $jc(_$hash, shortSessionCookieConfig.hashCode);
    _$hash = $jc(_$hash, frontendApiUrl.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SessionConfigRsp')
          ..add('useSessionManagement', useSessionManagement)
          ..add('shortSessionCookieConfig', shortSessionCookieConfig)
          ..add('frontendApiUrl', frontendApiUrl))
        .toString();
  }
}

class SessionConfigRspBuilder
    implements Builder<SessionConfigRsp, SessionConfigRspBuilder> {
  _$SessionConfigRsp? _$v;

  bool? _useSessionManagement;
  bool? get useSessionManagement => _$this._useSessionManagement;
  set useSessionManagement(bool? useSessionManagement) =>
      _$this._useSessionManagement = useSessionManagement;

  ShortSessionCookieConfigBuilder? _shortSessionCookieConfig;
  ShortSessionCookieConfigBuilder get shortSessionCookieConfig =>
      _$this._shortSessionCookieConfig ??=
          new ShortSessionCookieConfigBuilder();
  set shortSessionCookieConfig(
          ShortSessionCookieConfigBuilder? shortSessionCookieConfig) =>
      _$this._shortSessionCookieConfig = shortSessionCookieConfig;

  String? _frontendApiUrl;
  String? get frontendApiUrl => _$this._frontendApiUrl;
  set frontendApiUrl(String? frontendApiUrl) =>
      _$this._frontendApiUrl = frontendApiUrl;

  SessionConfigRspBuilder() {
    SessionConfigRsp._defaults(this);
  }

  SessionConfigRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _useSessionManagement = $v.useSessionManagement;
      _shortSessionCookieConfig = $v.shortSessionCookieConfig?.toBuilder();
      _frontendApiUrl = $v.frontendApiUrl;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SessionConfigRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SessionConfigRsp;
  }

  @override
  void update(void Function(SessionConfigRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SessionConfigRsp build() => _build();

  _$SessionConfigRsp _build() {
    _$SessionConfigRsp _$result;
    try {
      _$result = _$v ??
          new _$SessionConfigRsp._(
              useSessionManagement: BuiltValueNullFieldError.checkNotNull(
                  useSessionManagement,
                  r'SessionConfigRsp',
                  'useSessionManagement'),
              shortSessionCookieConfig: _shortSessionCookieConfig?.build(),
              frontendApiUrl: frontendApiUrl);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'shortSessionCookieConfig';
        _shortSessionCookieConfig?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SessionConfigRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
