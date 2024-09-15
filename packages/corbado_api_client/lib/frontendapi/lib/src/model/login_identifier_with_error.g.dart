// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_identifier_with_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginIdentifierWithError extends LoginIdentifierWithError {
  @override
  final LoginIdentifierType type;
  @override
  final String identifier;
  @override
  final RequestError? error;

  factory _$LoginIdentifierWithError(
          [void Function(LoginIdentifierWithErrorBuilder)? updates]) =>
      (new LoginIdentifierWithErrorBuilder()..update(updates))._build();

  _$LoginIdentifierWithError._(
      {required this.type, required this.identifier, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        type, r'LoginIdentifierWithError', 'type');
    BuiltValueNullFieldError.checkNotNull(
        identifier, r'LoginIdentifierWithError', 'identifier');
  }

  @override
  LoginIdentifierWithError rebuild(
          void Function(LoginIdentifierWithErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginIdentifierWithErrorBuilder toBuilder() =>
      new LoginIdentifierWithErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginIdentifierWithError &&
        type == other.type &&
        identifier == other.identifier &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginIdentifierWithError')
          ..add('type', type)
          ..add('identifier', identifier)
          ..add('error', error))
        .toString();
  }
}

class LoginIdentifierWithErrorBuilder
    implements
        Builder<LoginIdentifierWithError, LoginIdentifierWithErrorBuilder> {
  _$LoginIdentifierWithError? _$v;

  LoginIdentifierType? _type;
  LoginIdentifierType? get type => _$this._type;
  set type(LoginIdentifierType? type) => _$this._type = type;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  LoginIdentifierWithErrorBuilder() {
    LoginIdentifierWithError._defaults(this);
  }

  LoginIdentifierWithErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _identifier = $v.identifier;
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginIdentifierWithError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginIdentifierWithError;
  }

  @override
  void update(void Function(LoginIdentifierWithErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginIdentifierWithError build() => _build();

  _$LoginIdentifierWithError _build() {
    _$LoginIdentifierWithError _$result;
    try {
      _$result = _$v ??
          new _$LoginIdentifierWithError._(
              type: BuiltValueNullFieldError.checkNotNull(
                  type, r'LoginIdentifierWithError', 'type'),
              identifier: BuiltValueNullFieldError.checkNotNull(
                  identifier, r'LoginIdentifierWithError', 'identifier'),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LoginIdentifierWithError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
