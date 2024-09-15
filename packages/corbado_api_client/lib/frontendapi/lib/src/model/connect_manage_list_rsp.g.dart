// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_list_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageListRsp extends ConnectManageListRsp {
  @override
  final BuiltList<Passkey> passkeys;

  factory _$ConnectManageListRsp(
          [void Function(ConnectManageListRspBuilder)? updates]) =>
      (new ConnectManageListRspBuilder()..update(updates))._build();

  _$ConnectManageListRsp._({required this.passkeys}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passkeys, r'ConnectManageListRsp', 'passkeys');
  }

  @override
  ConnectManageListRsp rebuild(
          void Function(ConnectManageListRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageListRspBuilder toBuilder() =>
      new ConnectManageListRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageListRsp && passkeys == other.passkeys;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passkeys.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectManageListRsp')
          ..add('passkeys', passkeys))
        .toString();
  }
}

class ConnectManageListRspBuilder
    implements Builder<ConnectManageListRsp, ConnectManageListRspBuilder> {
  _$ConnectManageListRsp? _$v;

  ListBuilder<Passkey>? _passkeys;
  ListBuilder<Passkey> get passkeys =>
      _$this._passkeys ??= new ListBuilder<Passkey>();
  set passkeys(ListBuilder<Passkey>? passkeys) => _$this._passkeys = passkeys;

  ConnectManageListRspBuilder() {
    ConnectManageListRsp._defaults(this);
  }

  ConnectManageListRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passkeys = $v.passkeys.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageListRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageListRsp;
  }

  @override
  void update(void Function(ConnectManageListRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageListRsp build() => _build();

  _$ConnectManageListRsp _build() {
    _$ConnectManageListRsp _$result;
    try {
      _$result =
          _$v ?? new _$ConnectManageListRsp._(passkeys: passkeys.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeys';
        passkeys.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectManageListRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
