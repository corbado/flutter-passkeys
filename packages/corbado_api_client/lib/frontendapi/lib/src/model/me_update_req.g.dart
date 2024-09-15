// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_update_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeUpdateReq extends MeUpdateReq {
  @override
  final String fullName;

  factory _$MeUpdateReq([void Function(MeUpdateReqBuilder)? updates]) =>
      (new MeUpdateReqBuilder()..update(updates))._build();

  _$MeUpdateReq._({required this.fullName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(fullName, r'MeUpdateReq', 'fullName');
  }

  @override
  MeUpdateReq rebuild(void Function(MeUpdateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeUpdateReqBuilder toBuilder() => new MeUpdateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeUpdateReq && fullName == other.fullName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeUpdateReq')
          ..add('fullName', fullName))
        .toString();
  }
}

class MeUpdateReqBuilder implements Builder<MeUpdateReq, MeUpdateReqBuilder> {
  _$MeUpdateReq? _$v;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  MeUpdateReqBuilder() {
    MeUpdateReq._defaults(this);
  }

  MeUpdateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullName = $v.fullName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeUpdateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeUpdateReq;
  }

  @override
  void update(void Function(MeUpdateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeUpdateReq build() => _build();

  _$MeUpdateReq _build() {
    final _$result = _$v ??
        new _$MeUpdateReq._(
            fullName: BuiltValueNullFieldError.checkNotNull(
                fullName, r'MeUpdateReq', 'fullName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
