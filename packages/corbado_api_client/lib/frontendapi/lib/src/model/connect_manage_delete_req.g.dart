// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_delete_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageDeleteReq extends ConnectManageDeleteReq {
  @override
  final String connectToken;
  @override
  final String credentialID;

  factory _$ConnectManageDeleteReq(
          [void Function(ConnectManageDeleteReqBuilder)? updates]) =>
      (new ConnectManageDeleteReqBuilder()..update(updates))._build();

  _$ConnectManageDeleteReq._(
      {required this.connectToken, required this.credentialID})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        connectToken, r'ConnectManageDeleteReq', 'connectToken');
    BuiltValueNullFieldError.checkNotNull(
        credentialID, r'ConnectManageDeleteReq', 'credentialID');
  }

  @override
  ConnectManageDeleteReq rebuild(
          void Function(ConnectManageDeleteReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageDeleteReqBuilder toBuilder() =>
      new ConnectManageDeleteReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageDeleteReq &&
        connectToken == other.connectToken &&
        credentialID == other.credentialID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, connectToken.hashCode);
    _$hash = $jc(_$hash, credentialID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectManageDeleteReq')
          ..add('connectToken', connectToken)
          ..add('credentialID', credentialID))
        .toString();
  }
}

class ConnectManageDeleteReqBuilder
    implements Builder<ConnectManageDeleteReq, ConnectManageDeleteReqBuilder> {
  _$ConnectManageDeleteReq? _$v;

  String? _connectToken;
  String? get connectToken => _$this._connectToken;
  set connectToken(String? connectToken) => _$this._connectToken = connectToken;

  String? _credentialID;
  String? get credentialID => _$this._credentialID;
  set credentialID(String? credentialID) => _$this._credentialID = credentialID;

  ConnectManageDeleteReqBuilder() {
    ConnectManageDeleteReq._defaults(this);
  }

  ConnectManageDeleteReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _connectToken = $v.connectToken;
      _credentialID = $v.credentialID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageDeleteReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageDeleteReq;
  }

  @override
  void update(void Function(ConnectManageDeleteReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageDeleteReq build() => _build();

  _$ConnectManageDeleteReq _build() {
    final _$result = _$v ??
        new _$ConnectManageDeleteReq._(
            connectToken: BuiltValueNullFieldError.checkNotNull(
                connectToken, r'ConnectManageDeleteReq', 'connectToken'),
            credentialID: BuiltValueNullFieldError.checkNotNull(
                credentialID, r'ConnectManageDeleteReq', 'credentialID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
