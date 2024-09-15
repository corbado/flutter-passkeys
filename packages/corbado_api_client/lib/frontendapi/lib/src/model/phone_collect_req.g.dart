// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_collect_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PhoneCollectReq extends PhoneCollectReq {
  @override
  final String value;

  factory _$PhoneCollectReq([void Function(PhoneCollectReqBuilder)? updates]) =>
      (new PhoneCollectReqBuilder()..update(updates))._build();

  _$PhoneCollectReq._({required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'PhoneCollectReq', 'value');
  }

  @override
  PhoneCollectReq rebuild(void Function(PhoneCollectReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneCollectReqBuilder toBuilder() =>
      new PhoneCollectReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneCollectReq && value == other.value;
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
    return (newBuiltValueToStringHelper(r'PhoneCollectReq')
          ..add('value', value))
        .toString();
  }
}

class PhoneCollectReqBuilder
    implements Builder<PhoneCollectReq, PhoneCollectReqBuilder> {
  _$PhoneCollectReq? _$v;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  PhoneCollectReqBuilder() {
    PhoneCollectReq._defaults(this);
  }

  PhoneCollectReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneCollectReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhoneCollectReq;
  }

  @override
  void update(void Function(PhoneCollectReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhoneCollectReq build() => _build();

  _$PhoneCollectReq _build() {
    final _$result = _$v ??
        new _$PhoneCollectReq._(
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'PhoneCollectReq', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
