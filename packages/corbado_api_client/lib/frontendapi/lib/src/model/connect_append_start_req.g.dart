// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectAppendStartReq extends ConnectAppendStartReq {
  @override
  final String appendTokenValue;
  @override
  final int loadedMs;
  @override
  final bool? forcePasskeyAppend;

  factory _$ConnectAppendStartReq(
          [void Function(ConnectAppendStartReqBuilder)? updates]) =>
      (new ConnectAppendStartReqBuilder()..update(updates))._build();

  _$ConnectAppendStartReq._(
      {required this.appendTokenValue,
      required this.loadedMs,
      this.forcePasskeyAppend})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        appendTokenValue, r'ConnectAppendStartReq', 'appendTokenValue');
    BuiltValueNullFieldError.checkNotNull(
        loadedMs, r'ConnectAppendStartReq', 'loadedMs');
  }

  @override
  ConnectAppendStartReq rebuild(
          void Function(ConnectAppendStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendStartReqBuilder toBuilder() =>
      new ConnectAppendStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendStartReq &&
        appendTokenValue == other.appendTokenValue &&
        loadedMs == other.loadedMs &&
        forcePasskeyAppend == other.forcePasskeyAppend;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appendTokenValue.hashCode);
    _$hash = $jc(_$hash, loadedMs.hashCode);
    _$hash = $jc(_$hash, forcePasskeyAppend.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendStartReq')
          ..add('appendTokenValue', appendTokenValue)
          ..add('loadedMs', loadedMs)
          ..add('forcePasskeyAppend', forcePasskeyAppend))
        .toString();
  }
}

class ConnectAppendStartReqBuilder
    implements Builder<ConnectAppendStartReq, ConnectAppendStartReqBuilder> {
  _$ConnectAppendStartReq? _$v;

  String? _appendTokenValue;
  String? get appendTokenValue => _$this._appendTokenValue;
  set appendTokenValue(String? appendTokenValue) =>
      _$this._appendTokenValue = appendTokenValue;

  int? _loadedMs;
  int? get loadedMs => _$this._loadedMs;
  set loadedMs(int? loadedMs) => _$this._loadedMs = loadedMs;

  bool? _forcePasskeyAppend;
  bool? get forcePasskeyAppend => _$this._forcePasskeyAppend;
  set forcePasskeyAppend(bool? forcePasskeyAppend) =>
      _$this._forcePasskeyAppend = forcePasskeyAppend;

  ConnectAppendStartReqBuilder() {
    ConnectAppendStartReq._defaults(this);
  }

  ConnectAppendStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appendTokenValue = $v.appendTokenValue;
      _loadedMs = $v.loadedMs;
      _forcePasskeyAppend = $v.forcePasskeyAppend;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendStartReq;
  }

  @override
  void update(void Function(ConnectAppendStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendStartReq build() => _build();

  _$ConnectAppendStartReq _build() {
    final _$result = _$v ??
        new _$ConnectAppendStartReq._(
            appendTokenValue: BuiltValueNullFieldError.checkNotNull(
                appendTokenValue, r'ConnectAppendStartReq', 'appendTokenValue'),
            loadedMs: BuiltValueNullFieldError.checkNotNull(
                loadedMs, r'ConnectAppendStartReq', 'loadedMs'),
            forcePasskeyAppend: forcePasskeyAppend);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
