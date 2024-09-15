// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_manage_init_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectManageInitRsp extends ConnectManageInitRsp {
  @override
  final String processID;
  @override
  final int expiresAt;
  @override
  final String frontendApiUrl;
  @override
  final bool manageAllowed;
  @override
  final BuiltMap<String, String> flags;
  @override
  final String? newClientEnvHandle;

  factory _$ConnectManageInitRsp(
          [void Function(ConnectManageInitRspBuilder)? updates]) =>
      (new ConnectManageInitRspBuilder()..update(updates))._build();

  _$ConnectManageInitRsp._(
      {required this.processID,
      required this.expiresAt,
      required this.frontendApiUrl,
      required this.manageAllowed,
      required this.flags,
      this.newClientEnvHandle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        processID, r'ConnectManageInitRsp', 'processID');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'ConnectManageInitRsp', 'expiresAt');
    BuiltValueNullFieldError.checkNotNull(
        frontendApiUrl, r'ConnectManageInitRsp', 'frontendApiUrl');
    BuiltValueNullFieldError.checkNotNull(
        manageAllowed, r'ConnectManageInitRsp', 'manageAllowed');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectManageInitRsp', 'flags');
  }

  @override
  ConnectManageInitRsp rebuild(
          void Function(ConnectManageInitRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectManageInitRspBuilder toBuilder() =>
      new ConnectManageInitRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectManageInitRsp &&
        processID == other.processID &&
        expiresAt == other.expiresAt &&
        frontendApiUrl == other.frontendApiUrl &&
        manageAllowed == other.manageAllowed &&
        flags == other.flags &&
        newClientEnvHandle == other.newClientEnvHandle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processID.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, frontendApiUrl.hashCode);
    _$hash = $jc(_$hash, manageAllowed.hashCode);
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jc(_$hash, newClientEnvHandle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectManageInitRsp')
          ..add('processID', processID)
          ..add('expiresAt', expiresAt)
          ..add('frontendApiUrl', frontendApiUrl)
          ..add('manageAllowed', manageAllowed)
          ..add('flags', flags)
          ..add('newClientEnvHandle', newClientEnvHandle))
        .toString();
  }
}

class ConnectManageInitRspBuilder
    implements Builder<ConnectManageInitRsp, ConnectManageInitRspBuilder> {
  _$ConnectManageInitRsp? _$v;

  String? _processID;
  String? get processID => _$this._processID;
  set processID(String? processID) => _$this._processID = processID;

  int? _expiresAt;
  int? get expiresAt => _$this._expiresAt;
  set expiresAt(int? expiresAt) => _$this._expiresAt = expiresAt;

  String? _frontendApiUrl;
  String? get frontendApiUrl => _$this._frontendApiUrl;
  set frontendApiUrl(String? frontendApiUrl) =>
      _$this._frontendApiUrl = frontendApiUrl;

  bool? _manageAllowed;
  bool? get manageAllowed => _$this._manageAllowed;
  set manageAllowed(bool? manageAllowed) =>
      _$this._manageAllowed = manageAllowed;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  String? _newClientEnvHandle;
  String? get newClientEnvHandle => _$this._newClientEnvHandle;
  set newClientEnvHandle(String? newClientEnvHandle) =>
      _$this._newClientEnvHandle = newClientEnvHandle;

  ConnectManageInitRspBuilder() {
    ConnectManageInitRsp._defaults(this);
  }

  ConnectManageInitRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processID = $v.processID;
      _expiresAt = $v.expiresAt;
      _frontendApiUrl = $v.frontendApiUrl;
      _manageAllowed = $v.manageAllowed;
      _flags = $v.flags.toBuilder();
      _newClientEnvHandle = $v.newClientEnvHandle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectManageInitRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectManageInitRsp;
  }

  @override
  void update(void Function(ConnectManageInitRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectManageInitRsp build() => _build();

  _$ConnectManageInitRsp _build() {
    _$ConnectManageInitRsp _$result;
    try {
      _$result = _$v ??
          new _$ConnectManageInitRsp._(
              processID: BuiltValueNullFieldError.checkNotNull(
                  processID, r'ConnectManageInitRsp', 'processID'),
              expiresAt: BuiltValueNullFieldError.checkNotNull(
                  expiresAt, r'ConnectManageInitRsp', 'expiresAt'),
              frontendApiUrl: BuiltValueNullFieldError.checkNotNull(
                  frontendApiUrl, r'ConnectManageInitRsp', 'frontendApiUrl'),
              manageAllowed: BuiltValueNullFieldError.checkNotNull(
                  manageAllowed, r'ConnectManageInitRsp', 'manageAllowed'),
              flags: flags.build(),
              newClientEnvHandle: newClientEnvHandle);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flags';
        flags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectManageInitRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
