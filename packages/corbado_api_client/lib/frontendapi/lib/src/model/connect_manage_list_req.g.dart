// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_list_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageListReq extends ConnectManageListReq {
  @override
  final String connectToken;

  factory _$ConnectManageListReq(
          [void Function(ConnectManageListReqBuilder)? updates]) =>
      (new ConnectManageListReqBuilder()..update(updates))._build();

  _$ConnectManageListReq._({required this.connectToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connectToken, r'ConnectManageListReq', 'connectToken');
  }

  @override
  ConnectManageListReq rebuild(
          void Function(ConnectManageListReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageListReqBuilder toBuilder() =>
      new ConnectManageListReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageListReq && connectToken == other.connectToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, connectToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectManageListReq')
          ..add('connectToken', connectToken))
        .toString();
  }
}

class ConnectManageListReqBuilder
    implements Builder<ConnectManageListReq, ConnectManageListReqBuilder> {
  _$ConnectManageListReq? _$v;

  String? _connectToken;
  String? get connectToken => _$this._connectToken;
  set connectToken(String? connectToken) => _$this._connectToken = connectToken;

  ConnectManageListReqBuilder() {
    ConnectManageListReq._defaults(this);
  }

  ConnectManageListReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connectToken = $v.connectToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageListReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageListReq;
  }

  @override
  void update(void Function(ConnectManageListReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageListReq build() => _build();

  _$ConnectManageListReq _build() {
    final _$result = _$v ??
        new _$ConnectManageListReq._(
            connectToken: BuiltValueNullFieldError.checkNotNull(
                connectToken, r'ConnectManageListReq', 'connectToken'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
