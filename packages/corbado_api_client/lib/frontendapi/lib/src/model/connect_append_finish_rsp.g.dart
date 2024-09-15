// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_finish_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectAppendFinishRsp extends ConnectAppendFinishRsp {
  @override
  final PasskeyOperation passkeyOperation;

  factory _$ConnectAppendFinishRsp(
          [void Function(ConnectAppendFinishRspBuilder)? updates]) =>
      (new ConnectAppendFinishRspBuilder()..update(updates))._build();

  _$ConnectAppendFinishRsp._({required this.passkeyOperation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passkeyOperation, r'ConnectAppendFinishRsp', 'passkeyOperation');
  }

  @override
  ConnectAppendFinishRsp rebuild(
          void Function(ConnectAppendFinishRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendFinishRspBuilder toBuilder() =>
      new ConnectAppendFinishRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendFinishRsp &&
        passkeyOperation == other.passkeyOperation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passkeyOperation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendFinishRsp')
          ..add('passkeyOperation', passkeyOperation))
        .toString();
  }
}

class ConnectAppendFinishRspBuilder
    implements Builder<ConnectAppendFinishRsp, ConnectAppendFinishRspBuilder> {
  _$ConnectAppendFinishRsp? _$v;

  PasskeyOperationBuilder? _passkeyOperation;
  PasskeyOperationBuilder get passkeyOperation =>
      _$this._passkeyOperation ??= new PasskeyOperationBuilder();
  set passkeyOperation(PasskeyOperationBuilder? passkeyOperation) =>
      _$this._passkeyOperation = passkeyOperation;

  ConnectAppendFinishRspBuilder() {
    ConnectAppendFinishRsp._defaults(this);
  }

  ConnectAppendFinishRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passkeyOperation = $v.passkeyOperation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendFinishRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendFinishRsp;
  }

  @override
  void update(void Function(ConnectAppendFinishRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendFinishRsp build() => _build();

  _$ConnectAppendFinishRsp _build() {
    _$ConnectAppendFinishRsp _$result;
    try {
      _$result = _$v ??
          new _$ConnectAppendFinishRsp._(
              passkeyOperation: passkeyOperation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeyOperation';
        passkeyOperation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectAppendFinishRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
