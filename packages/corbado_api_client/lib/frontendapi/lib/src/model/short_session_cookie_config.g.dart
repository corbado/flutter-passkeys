// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_session_cookie_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ShortSessionCookieConfigSameSiteEnum
    _$shortSessionCookieConfigSameSiteEnum_lax =
    const ShortSessionCookieConfigSameSiteEnum._('lax');
const ShortSessionCookieConfigSameSiteEnum
    _$shortSessionCookieConfigSameSiteEnum_strict =
    const ShortSessionCookieConfigSameSiteEnum._('strict');
const ShortSessionCookieConfigSameSiteEnum
    _$shortSessionCookieConfigSameSiteEnum_none =
    const ShortSessionCookieConfigSameSiteEnum._('none');

ShortSessionCookieConfigSameSiteEnum
    _$shortSessionCookieConfigSameSiteEnumValueOf(String name) {
  switch (name) {
    case 'lax':
      return _$shortSessionCookieConfigSameSiteEnum_lax;
    case 'strict':
      return _$shortSessionCookieConfigSameSiteEnum_strict;
    case 'none':
      return _$shortSessionCookieConfigSameSiteEnum_none;
    default:
      return _$shortSessionCookieConfigSameSiteEnum_none;
  }
}

final BuiltSet<ShortSessionCookieConfigSameSiteEnum>
    _$shortSessionCookieConfigSameSiteEnumValues = new BuiltSet<
        ShortSessionCookieConfigSameSiteEnum>(const <ShortSessionCookieConfigSameSiteEnum>[
  _$shortSessionCookieConfigSameSiteEnum_lax,
  _$shortSessionCookieConfigSameSiteEnum_strict,
  _$shortSessionCookieConfigSameSiteEnum_none,
]);

Serializer<ShortSessionCookieConfigSameSiteEnum>
    _$shortSessionCookieConfigSameSiteEnumSerializer =
    new _$ShortSessionCookieConfigSameSiteEnumSerializer();

class _$ShortSessionCookieConfigSameSiteEnumSerializer
    implements PrimitiveSerializer<ShortSessionCookieConfigSameSiteEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'lax': 'lax',
    'strict': 'strict',
    'none': 'none',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'lax': 'lax',
    'strict': 'strict',
    'none': 'none',
  };

  @override
  final Iterable<Type> types = const <Type>[
    ShortSessionCookieConfigSameSiteEnum
  ];
  @override
  final String wireName = 'ShortSessionCookieConfigSameSiteEnum';

  @override
  Object serialize(
          Serializers serializers, ShortSessionCookieConfigSameSiteEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ShortSessionCookieConfigSameSiteEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ShortSessionCookieConfigSameSiteEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ShortSessionCookieConfig extends ShortSessionCookieConfig {
  @override
  final String domain;
  @override
  final bool secure;
  @override
  final ShortSessionCookieConfigSameSiteEnum sameSite;
  @override
  final String path;
  @override
  final int lifetimeSeconds;

  factory _$ShortSessionCookieConfig(
          [void Function(ShortSessionCookieConfigBuilder)? updates]) =>
      (new ShortSessionCookieConfigBuilder()..update(updates))._build();

  _$ShortSessionCookieConfig._(
      {required this.domain,
      required this.secure,
      required this.sameSite,
      required this.path,
      required this.lifetimeSeconds})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        domain, r'ShortSessionCookieConfig', 'domain');
    BuiltValueNullFieldError.checkNotNull(
        secure, r'ShortSessionCookieConfig', 'secure');
    BuiltValueNullFieldError.checkNotNull(
        sameSite, r'ShortSessionCookieConfig', 'sameSite');
    BuiltValueNullFieldError.checkNotNull(
        path, r'ShortSessionCookieConfig', 'path');
    BuiltValueNullFieldError.checkNotNull(
        lifetimeSeconds, r'ShortSessionCookieConfig', 'lifetimeSeconds');
  }

  @override
  ShortSessionCookieConfig rebuild(
          void Function(ShortSessionCookieConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShortSessionCookieConfigBuilder toBuilder() =>
      new ShortSessionCookieConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShortSessionCookieConfig &&
        domain == other.domain &&
        secure == other.secure &&
        sameSite == other.sameSite &&
        path == other.path &&
        lifetimeSeconds == other.lifetimeSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, domain.hashCode);
    _$hash = $jc(_$hash, secure.hashCode);
    _$hash = $jc(_$hash, sameSite.hashCode);
    _$hash = $jc(_$hash, path.hashCode);
    _$hash = $jc(_$hash, lifetimeSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShortSessionCookieConfig')
          ..add('domain', domain)
          ..add('secure', secure)
          ..add('sameSite', sameSite)
          ..add('path', path)
          ..add('lifetimeSeconds', lifetimeSeconds))
        .toString();
  }
}

class ShortSessionCookieConfigBuilder
    implements
        Builder<ShortSessionCookieConfig, ShortSessionCookieConfigBuilder> {
  _$ShortSessionCookieConfig? _$v;

  String? _domain;
  String? get domain => _$this._domain;
  set domain(String? domain) => _$this._domain = domain;

  bool? _secure;
  bool? get secure => _$this._secure;
  set secure(bool? secure) => _$this._secure = secure;

  ShortSessionCookieConfigSameSiteEnum? _sameSite;
  ShortSessionCookieConfigSameSiteEnum? get sameSite => _$this._sameSite;
  set sameSite(ShortSessionCookieConfigSameSiteEnum? sameSite) =>
      _$this._sameSite = sameSite;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  int? _lifetimeSeconds;
  int? get lifetimeSeconds => _$this._lifetimeSeconds;
  set lifetimeSeconds(int? lifetimeSeconds) =>
      _$this._lifetimeSeconds = lifetimeSeconds;

  ShortSessionCookieConfigBuilder() {
    ShortSessionCookieConfig._defaults(this);
  }

  ShortSessionCookieConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _domain = $v.domain;
      _secure = $v.secure;
      _sameSite = $v.sameSite;
      _path = $v.path;
      _lifetimeSeconds = $v.lifetimeSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShortSessionCookieConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShortSessionCookieConfig;
  }

  @override
  void update(void Function(ShortSessionCookieConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShortSessionCookieConfig build() => _build();

  _$ShortSessionCookieConfig _build() {
    final _$result = _$v ??
        new _$ShortSessionCookieConfig._(
            domain: BuiltValueNullFieldError.checkNotNull(
                domain, r'ShortSessionCookieConfig', 'domain'),
            secure: BuiltValueNullFieldError.checkNotNull(
                secure, r'ShortSessionCookieConfig', 'secure'),
            sameSite: BuiltValueNullFieldError.checkNotNull(
                sameSite, r'ShortSessionCookieConfig', 'sameSite'),
            path: BuiltValueNullFieldError.checkNotNull(
                path, r'ShortSessionCookieConfig', 'path'),
            lifetimeSeconds: BuiltValueNullFieldError.checkNotNull(
                lifetimeSeconds,
                r'ShortSessionCookieConfig',
                'lifetimeSeconds'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
