// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_name_with_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FullNameWithError extends FullNameWithError {
  @override
  final String fullName;
  @override
  final RequestError? error;

  factory _$FullNameWithError(
          [void Function(FullNameWithErrorBuilder)? updates]) =>
      (new FullNameWithErrorBuilder()..update(updates))._build();

  _$FullNameWithError._({required this.fullName, this.error}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fullName, r'FullNameWithError', 'fullName');
  }

  @override
  FullNameWithError rebuild(void Function(FullNameWithErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FullNameWithErrorBuilder toBuilder() =>
      new FullNameWithErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FullNameWithError &&
        fullName == other.fullName &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FullNameWithError')
          ..add('fullName', fullName)
          ..add('error', error))
        .toString();
  }
}

class FullNameWithErrorBuilder
    implements Builder<FullNameWithError, FullNameWithErrorBuilder> {
  _$FullNameWithError? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  FullNameWithErrorBuilder() {
    FullNameWithError._defaults(this);
  }

  FullNameWithErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FullNameWithError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FullNameWithError;
  }

  @override
  void update(void Function(FullNameWithErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FullNameWithError build() => _build();

  _$FullNameWithError _build() {
    _$FullNameWithError _$result;
    try {
      _$result = _$v ??
          new _$FullNameWithError._(
              fullName: BuiltValueNullFieldError.checkNotNull(
                  fullName, r'FullNameWithError', 'fullName'),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FullNameWithError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
