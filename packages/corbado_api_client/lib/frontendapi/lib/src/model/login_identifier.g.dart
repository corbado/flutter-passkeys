// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_identifier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginIdentifier extends LoginIdentifier {
  @override
  final LoginIdentifierType type;
  @override
  final String identifier;

  factory _$LoginIdentifier([void Function(LoginIdentifierBuilder)? updates]) =>
      (new LoginIdentifierBuilder()..update(updates))._build();

  _$LoginIdentifier._({required this.type, required this.identifier})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, r'LoginIdentifier', 'type');
    BuiltValueNullFieldError.checkNotNull(
        identifier, r'LoginIdentifier', 'identifier');
  }

  @override
  LoginIdentifier rebuild(void Function(LoginIdentifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginIdentifierBuilder toBuilder() =>
      new LoginIdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginIdentifier &&
        type == other.type &&
        identifier == other.identifier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginIdentifier')
          ..add('type', type)
          ..add('identifier', identifier))
        .toString();
  }
}

class LoginIdentifierBuilder
    implements Builder<LoginIdentifier, LoginIdentifierBuilder> {
  _$LoginIdentifier? _$v;

  LoginIdentifierType? _type;
  LoginIdentifierType? get type => _$this._type;
  set type(LoginIdentifierType? type) => _$this._type = type;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  LoginIdentifierBuilder() {
    LoginIdentifier._defaults(this);
  }

  LoginIdentifierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _identifier = $v.identifier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginIdentifier other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginIdentifier;
  }

  @override
  void update(void Function(LoginIdentifierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginIdentifier build() => _build();

  _$LoginIdentifier _build() {
    final _$result = _$v ??
        new _$LoginIdentifier._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'LoginIdentifier', 'type'),
            identifier: BuiltValueNullFieldError.checkNotNull(
                identifier, r'LoginIdentifier', 'identifier'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
