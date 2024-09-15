// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'username_collect_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsernameCollectReq extends UsernameCollectReq {
  @override
  final String value;

  factory _$UsernameCollectReq(
          [void Function(UsernameCollectReqBuilder)? updates]) =>
      (new UsernameCollectReqBuilder()..update(updates))._build();

  _$UsernameCollectReq._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        value, r'UsernameCollectReq', 'value');
  }

  @override
  UsernameCollectReq rebuild(
          void Function(UsernameCollectReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsernameCollectReqBuilder toBuilder() =>
      new UsernameCollectReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsernameCollectReq && value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsernameCollectReq')
          ..add('value', value))
        .toString();
  }
}

class UsernameCollectReqBuilder
    implements Builder<UsernameCollectReq, UsernameCollectReqBuilder> {
  _$UsernameCollectReq? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  UsernameCollectReqBuilder() {
    UsernameCollectReq._defaults(this);
  }

  UsernameCollectReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsernameCollectReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsernameCollectReq;
  }

  @override
  void update(void Function(UsernameCollectReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsernameCollectReq build() => _build();

  _$UsernameCollectReq _build() {
    final _$result = _$v ??
        new _$UsernameCollectReq._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'UsernameCollectReq', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint