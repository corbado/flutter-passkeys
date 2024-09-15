// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_passkey_delete_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MePasskeyDeleteRsp extends MePasskeyDeleteRsp {
  @override
  final String id;

  factory _$MePasskeyDeleteRsp(
          [void Function(MePasskeyDeleteRspBuilder)? updates]) =>
      (new MePasskeyDeleteRspBuilder()..update(updates))._build();

  _$MePasskeyDeleteRsp._({required this.id}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MePasskeyDeleteRsp', 'id');
  }

  @override
  MePasskeyDeleteRsp rebuild(
          void Function(MePasskeyDeleteRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MePasskeyDeleteRspBuilder toBuilder() =>
      new MePasskeyDeleteRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MePasskeyDeleteRsp && id == other.id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MePasskeyDeleteRsp')..add('id', id))
        .toString();
  }
}

class MePasskeyDeleteRspBuilder
    implements Builder<MePasskeyDeleteRsp, MePasskeyDeleteRspBuilder> {
  _$MePasskeyDeleteRsp? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  MePasskeyDeleteRspBuilder() {
    MePasskeyDeleteRsp._defaults(this);
  }

  MePasskeyDeleteRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MePasskeyDeleteRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MePasskeyDeleteRsp;
  }

  @override
  void update(void Function(MePasskeyDeleteRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MePasskeyDeleteRsp build() => _build();

  _$MePasskeyDeleteRsp _build() {
    final _$result = _$v ??
        new _$MePasskeyDeleteRsp._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'MePasskeyDeleteRsp', 'id'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
