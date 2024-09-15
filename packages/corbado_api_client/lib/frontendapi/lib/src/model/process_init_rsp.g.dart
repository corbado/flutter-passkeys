// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_init_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessInitRsp extends ProcessInitRsp {
  @override
  final String token;
  @override
  final int expiresAt;
  @override
  final ProcessResponse processResponse;
  @override
  final String? newClientEnvHandle;

  factory _$ProcessInitRsp([void Function(ProcessInitRspBuilder)? updates]) =>
      (new ProcessInitRspBuilder()..update(updates))._build();

  _$ProcessInitRsp._(
      {required this.token,
      required this.expiresAt,
      required this.processResponse,
      this.newClientEnvHandle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'ProcessInitRsp', 'token');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'ProcessInitRsp', 'expiresAt');
    BuiltValueNullFieldError.checkNotNull(
        processResponse, r'ProcessInitRsp', 'processResponse');
  }

  @override
  ProcessInitRsp rebuild(void Function(ProcessInitRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessInitRspBuilder toBuilder() =>
      new ProcessInitRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessInitRsp &&
        token == other.token &&
        expiresAt == other.expiresAt &&
        processResponse == other.processResponse &&
        newClientEnvHandle == other.newClientEnvHandle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, processResponse.hashCode);
    _$hash = $jc(_$hash, newClientEnvHandle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessInitRsp')
          ..add('token', token)
          ..add('expiresAt', expiresAt)
          ..add('processResponse', processResponse)
          ..add('newClientEnvHandle', newClientEnvHandle))
        .toString();
  }
}

class ProcessInitRspBuilder
    implements Builder<ProcessInitRsp, ProcessInitRspBuilder> {
  _$ProcessInitRsp? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _expiresAt;
  int? get expiresAt => _$this._expiresAt;
  set expiresAt(int? expiresAt) => _$this._expiresAt = expiresAt;

  ProcessResponseBuilder? _processResponse;
  ProcessResponseBuilder get processResponse =>
      _$this._processResponse ??= new ProcessResponseBuilder();
  set processResponse(ProcessResponseBuilder? processResponse) =>
      _$this._processResponse = processResponse;

  String? _newClientEnvHandle;
  String? get newClientEnvHandle => _$this._newClientEnvHandle;
  set newClientEnvHandle(String? newClientEnvHandle) =>
      _$this._newClientEnvHandle = newClientEnvHandle;

  ProcessInitRspBuilder() {
    ProcessInitRsp._defaults(this);
  }

  ProcessInitRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _expiresAt = $v.expiresAt;
      _processResponse = $v.processResponse.toBuilder();
      _newClientEnvHandle = $v.newClientEnvHandle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessInitRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcessInitRsp;
  }

  @override
  void update(void Function(ProcessInitRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessInitRsp build() => _build();

  _$ProcessInitRsp _build() {
    _$ProcessInitRsp _$result;
    try {
      _$result = _$v ??
          new _$ProcessInitRsp._(
              token: BuiltValueNullFieldError.checkNotNull(
                  token, r'ProcessInitRsp', 'token'),
              expiresAt: BuiltValueNullFieldError.checkNotNull(
                  expiresAt, r'ProcessInitRsp', 'expiresAt'),
              processResponse: processResponse.build(),
              newClientEnvHandle: newClientEnvHandle);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'processResponse';
        processResponse.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProcessInitRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
