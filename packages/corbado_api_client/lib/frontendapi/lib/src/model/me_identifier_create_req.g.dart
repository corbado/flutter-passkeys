// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_identifier_create_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeIdentifierCreateReq extends MeIdentifierCreateReq {
  @override
  final LoginIdentifierType identifierType;
  @override
  final String value;

  factory _$MeIdentifierCreateReq(
          [void Function(MeIdentifierCreateReqBuilder)? updates]) =>
      (new MeIdentifierCreateReqBuilder()..update(updates))._build();

  _$MeIdentifierCreateReq._({required this.identifierType, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'MeIdentifierCreateReq', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        value, r'MeIdentifierCreateReq', 'value');
  }

  @override
  MeIdentifierCreateReq rebuild(
          void Function(MeIdentifierCreateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeIdentifierCreateReqBuilder toBuilder() =>
      new MeIdentifierCreateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeIdentifierCreateReq &&
        identifierType == other.identifierType &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeIdentifierCreateReq')
          ..add('identifierType', identifierType)
          ..add('value', value))
        .toString();
  }
}

class MeIdentifierCreateReqBuilder
    implements Builder<MeIdentifierCreateReq, MeIdentifierCreateReqBuilder> {
  _$MeIdentifierCreateReq? _$v;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  MeIdentifierCreateReqBuilder() {
    MeIdentifierCreateReq._defaults(this);
  }

  MeIdentifierCreateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierType = $v.identifierType;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeIdentifierCreateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeIdentifierCreateReq;
  }

  @override
  void update(void Function(MeIdentifierCreateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeIdentifierCreateReq build() => _build();

  _$MeIdentifierCreateReq _build() {
    final _$result = _$v ??
        new _$MeIdentifierCreateReq._(
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'MeIdentifierCreateReq', 'identifierType'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'MeIdentifierCreateReq', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
