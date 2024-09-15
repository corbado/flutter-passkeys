// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_refresh_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeRefreshRsp extends MeRefreshRsp {
  @override
  final String shortSession;

  factory _$MeRefreshRsp([void Function(MeRefreshRspBuilder)? updates]) =>
      (new MeRefreshRspBuilder()..update(updates))._build();

  _$MeRefreshRsp._({required this.shortSession}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        shortSession, r'MeRefreshRsp', 'shortSession');
  }

  @override
  MeRefreshRsp rebuild(void Function(MeRefreshRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeRefreshRspBuilder toBuilder() => new MeRefreshRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeRefreshRsp && shortSession == other.shortSession;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, shortSession.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeRefreshRsp')
          ..add('shortSession', shortSession))
        .toString();
  }
}

class MeRefreshRspBuilder
    implements Builder<MeRefreshRsp, MeRefreshRspBuilder> {
  _$MeRefreshRsp? _$v;

  String? _shortSession;
  String? get shortSession => _$this._shortSession;
  set shortSession(String? shortSession) => _$this._shortSession = shortSession;

  MeRefreshRspBuilder() {
    MeRefreshRsp._defaults(this);
  }

  MeRefreshRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _shortSession = $v.shortSession;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeRefreshRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeRefreshRsp;
  }

  @override
  void update(void Function(MeRefreshRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeRefreshRsp build() => _build();

  _$MeRefreshRsp _build() {
    final _$result = _$v ??
        new _$MeRefreshRsp._(
            shortSession: BuiltValueNullFieldError.checkNotNull(
                shortSession, r'MeRefreshRsp', 'shortSession'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
