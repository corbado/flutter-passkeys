// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_init_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectAppendInitRsp extends ConnectAppendInitRsp {
  @override
  final String processID;
  @override
  final int expiresAt;
  @override
  final String frontendApiUrl;
  @override
  final bool appendAllowed;
  @override
  final BuiltMap<String, String> flags;
  @override
  final String? newClientEnvHandle;

  factory _$ConnectAppendInitRsp(
          [void Function(ConnectAppendInitRspBuilder)? updates]) =>
      (new ConnectAppendInitRspBuilder()..update(updates))._build();

  _$ConnectAppendInitRsp._(
      {required this.processID,
      required this.expiresAt,
      required this.frontendApiUrl,
      required this.appendAllowed,
      required this.flags,
      this.newClientEnvHandle})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        processID, r'ConnectAppendInitRsp', 'processID');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'ConnectAppendInitRsp', 'expiresAt');
    BuiltValueNullFieldError.checkNotNull(
        frontendApiUrl, r'ConnectAppendInitRsp', 'frontendApiUrl');
    BuiltValueNullFieldError.checkNotNull(
        appendAllowed, r'ConnectAppendInitRsp', 'appendAllowed');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectAppendInitRsp', 'flags');
  }

  @override
  ConnectAppendInitRsp rebuild(
          void Function(ConnectAppendInitRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendInitRspBuilder toBuilder() =>
      new ConnectAppendInitRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendInitRsp &&
        processID == other.processID &&
        expiresAt == other.expiresAt &&
        frontendApiUrl == other.frontendApiUrl &&
        appendAllowed == other.appendAllowed &&
        flags == other.flags &&
        newClientEnvHandle == other.newClientEnvHandle;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, processID.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, frontendApiUrl.hashCode);
    _$hash = $jc(_$hash, appendAllowed.hashCode);
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jc(_$hash, newClientEnvHandle.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendInitRsp')
          ..add('processID', processID)
          ..add('expiresAt', expiresAt)
          ..add('frontendApiUrl', frontendApiUrl)
          ..add('appendAllowed', appendAllowed)
          ..add('flags', flags)
          ..add('newClientEnvHandle', newClientEnvHandle))
        .toString();
  }
}

class ConnectAppendInitRspBuilder
    implements Builder<ConnectAppendInitRsp, ConnectAppendInitRspBuilder> {
  _$ConnectAppendInitRsp? _$v;

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

  bool? _appendAllowed;
  bool? get appendAllowed => _$this._appendAllowed;
  set appendAllowed(bool? appendAllowed) =>
      _$this._appendAllowed = appendAllowed;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  String? _newClientEnvHandle;
  String? get newClientEnvHandle => _$this._newClientEnvHandle;
  set newClientEnvHandle(String? newClientEnvHandle) =>
      _$this._newClientEnvHandle = newClientEnvHandle;

  ConnectAppendInitRspBuilder() {
    ConnectAppendInitRsp._defaults(this);
  }

  ConnectAppendInitRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _processID = $v.processID;
      _expiresAt = $v.expiresAt;
      _frontendApiUrl = $v.frontendApiUrl;
      _appendAllowed = $v.appendAllowed;
      _flags = $v.flags.toBuilder();
      _newClientEnvHandle = $v.newClientEnvHandle;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendInitRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendInitRsp;
  }

  @override
  void update(void Function(ConnectAppendInitRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendInitRsp build() => _build();

  _$ConnectAppendInitRsp _build() {
    _$ConnectAppendInitRsp _$result;
    try {
      _$result = _$v ??
          new _$ConnectAppendInitRsp._(
              processID: BuiltValueNullFieldError.checkNotNull(
                  processID, r'ConnectAppendInitRsp', 'processID'),
              expiresAt: BuiltValueNullFieldError.checkNotNull(
                  expiresAt, r'ConnectAppendInitRsp', 'expiresAt'),
              frontendApiUrl: BuiltValueNullFieldError.checkNotNull(
                  frontendApiUrl, r'ConnectAppendInitRsp', 'frontendApiUrl'),
              appendAllowed: BuiltValueNullFieldError.checkNotNull(
                  appendAllowed, r'ConnectAppendInitRsp', 'appendAllowed'),
              flags: flags.build(),
              newClientEnvHandle: newClientEnvHandle);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'flags';
        flags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectAppendInitRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
