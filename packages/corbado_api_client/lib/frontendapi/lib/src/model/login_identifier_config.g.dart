// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_identifier_config.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginIdentifierConfig extends LoginIdentifierConfig {
  @override
  final LoginIdentifierType type;

  factory _$LoginIdentifierConfig(
          [void Function(LoginIdentifierConfigBuilder)? updates]) =>
      (new LoginIdentifierConfigBuilder()..update(updates))._build();

  _$LoginIdentifierConfig._({required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        type, r'LoginIdentifierConfig', 'type');
  }

  @override
  LoginIdentifierConfig rebuild(
          void Function(LoginIdentifierConfigBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginIdentifierConfigBuilder toBuilder() =>
      new LoginIdentifierConfigBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginIdentifierConfig && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginIdentifierConfig')
          ..add('type', type))
        .toString();
  }
}

class LoginIdentifierConfigBuilder
    implements Builder<LoginIdentifierConfig, LoginIdentifierConfigBuilder> {
  _$LoginIdentifierConfig? _$v;

  LoginIdentifierType? _type;
  LoginIdentifierType? get type => _$this._type;
  set type(LoginIdentifierType? type) => _$this._type = type;

  LoginIdentifierConfigBuilder() {
    LoginIdentifierConfig._defaults(this);
  }

  LoginIdentifierConfigBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginIdentifierConfig other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginIdentifierConfig;
  }

  @override
  void update(void Function(LoginIdentifierConfigBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginIdentifierConfig build() => _build();

  _$LoginIdentifierConfig _build() {
    final _$result = _$v ??
        new _$LoginIdentifierConfig._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'LoginIdentifierConfig', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
