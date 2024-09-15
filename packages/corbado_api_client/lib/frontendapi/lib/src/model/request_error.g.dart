// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RequestError extends RequestError {
  @override
  final String code;
  @override
  final String message;

  factory _$RequestError([void Function(RequestErrorBuilder)? updates]) =>
      (new RequestErrorBuilder()..update(updates))._build();

  _$RequestError._({required this.code, required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'RequestError', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'RequestError', 'message');
  }

  @override
  RequestError rebuild(void Function(RequestErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestErrorBuilder toBuilder() => new RequestErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestError &&
        code == other.code &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestError')
          ..add('code', code)
          ..add('message', message))
        .toString();
  }
}

class RequestErrorBuilder
    implements Builder<RequestError, RequestErrorBuilder> {
  _$RequestError? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RequestErrorBuilder() {
    RequestError._defaults(this);
  }

  RequestErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestError;
  }

  @override
  void update(void Function(RequestErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestError build() => _build();

  _$RequestError _build() {
    final _$result = _$v ??
        new _$RequestError._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'RequestError', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'RequestError', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
