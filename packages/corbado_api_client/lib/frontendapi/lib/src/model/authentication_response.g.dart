// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthenticationResponse extends AuthenticationResponse {
  @override
  final String shortSession;
  @override
  final String? longSession;
  @override
  final PasskeyOperation? passkeyOperation;

  factory _$AuthenticationResponse(
          [void Function(AuthenticationResponseBuilder)? updates]) =>
      (new AuthenticationResponseBuilder()..update(updates))._build();

  _$AuthenticationResponse._(
      {required this.shortSession, this.longSession, this.passkeyOperation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        shortSession, r'AuthenticationResponse', 'shortSession');
  }

  @override
  AuthenticationResponse rebuild(
          void Function(AuthenticationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthenticationResponseBuilder toBuilder() =>
      new AuthenticationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthenticationResponse &&
        shortSession == other.shortSession &&
        longSession == other.longSession &&
        passkeyOperation == other.passkeyOperation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shortSession.hashCode);
    _$hash = $jc(_$hash, longSession.hashCode);
    _$hash = $jc(_$hash, passkeyOperation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AuthenticationResponse')
          ..add('shortSession', shortSession)
          ..add('longSession', longSession)
          ..add('passkeyOperation', passkeyOperation))
        .toString();
  }
}

class AuthenticationResponseBuilder
    implements Builder<AuthenticationResponse, AuthenticationResponseBuilder> {
  _$AuthenticationResponse? _$v;

  String? _shortSession;
  String? get shortSession => _$this._shortSession;
  set shortSession(String? shortSession) => _$this._shortSession = shortSession;

  String? _longSession;
  String? get longSession => _$this._longSession;
  set longSession(String? longSession) => _$this._longSession = longSession;

  PasskeyOperationBuilder? _passkeyOperation;
  PasskeyOperationBuilder get passkeyOperation =>
      _$this._passkeyOperation ??= new PasskeyOperationBuilder();
  set passkeyOperation(PasskeyOperationBuilder? passkeyOperation) =>
      _$this._passkeyOperation = passkeyOperation;

  AuthenticationResponseBuilder() {
    AuthenticationResponse._defaults(this);
  }

  AuthenticationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shortSession = $v.shortSession;
      _longSession = $v.longSession;
      _passkeyOperation = $v.passkeyOperation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthenticationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthenticationResponse;
  }

  @override
  void update(void Function(AuthenticationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AuthenticationResponse build() => _build();

  _$AuthenticationResponse _build() {
    _$AuthenticationResponse _$result;
    try {
      _$result = _$v ??
          new _$AuthenticationResponse._(
              shortSession: BuiltValueNullFieldError.checkNotNull(
                  shortSession, r'AuthenticationResponse', 'shortSession'),
              longSession: longSession,
              passkeyOperation: _passkeyOperation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeyOperation';
        _passkeyOperation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AuthenticationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
