// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_finish_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectLoginFinishRsp extends ConnectLoginFinishRsp {
  @override
  final PasskeyOperation passkeyOperation;
  @override
  final String session;

  factory _$ConnectLoginFinishRsp(
          [void Function(ConnectLoginFinishRspBuilder)? updates]) =>
      (new ConnectLoginFinishRspBuilder()..update(updates))._build();

  _$ConnectLoginFinishRsp._(
      {required this.passkeyOperation, required this.session})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passkeyOperation, r'ConnectLoginFinishRsp', 'passkeyOperation');
    BuiltValueNullFieldError.checkNotNull(
        session, r'ConnectLoginFinishRsp', 'session');
  }

  @override
  ConnectLoginFinishRsp rebuild(
          void Function(ConnectLoginFinishRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginFinishRspBuilder toBuilder() =>
      new ConnectLoginFinishRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginFinishRsp &&
        passkeyOperation == other.passkeyOperation &&
        session == other.session;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passkeyOperation.hashCode);
    _$hash = $jc(_$hash, session.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginFinishRsp')
          ..add('passkeyOperation', passkeyOperation)
          ..add('session', session))
        .toString();
  }
}

class ConnectLoginFinishRspBuilder
    implements Builder<ConnectLoginFinishRsp, ConnectLoginFinishRspBuilder> {
  _$ConnectLoginFinishRsp? _$v;

  PasskeyOperationBuilder? _passkeyOperation;
  PasskeyOperationBuilder get passkeyOperation =>
      _$this._passkeyOperation ??= new PasskeyOperationBuilder();
  set passkeyOperation(PasskeyOperationBuilder? passkeyOperation) =>
      _$this._passkeyOperation = passkeyOperation;

  String? _session;
  String? get session => _$this._session;
  set session(String? session) => _$this._session = session;

  ConnectLoginFinishRspBuilder() {
    ConnectLoginFinishRsp._defaults(this);
  }

  ConnectLoginFinishRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passkeyOperation = $v.passkeyOperation.toBuilder();
      _session = $v.session;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginFinishRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginFinishRsp;
  }

  @override
  void update(void Function(ConnectLoginFinishRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginFinishRsp build() => _build();

  _$ConnectLoginFinishRsp _build() {
    _$ConnectLoginFinishRsp _$result;
    try {
      _$result = _$v ??
          new _$ConnectLoginFinishRsp._(
              passkeyOperation: passkeyOperation.build(),
              session: BuiltValueNullFieldError.checkNotNull(
                  session, r'ConnectLoginFinishRsp', 'session'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeyOperation';
        passkeyOperation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectLoginFinishRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
