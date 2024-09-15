// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_identifier_update_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeIdentifierUpdateReq extends MeIdentifierUpdateReq {
  @override
  final String identifierID;
  @override
  final LoginIdentifierType identifierType;
  @override
  final String value;

  factory _$MeIdentifierUpdateReq(
          [void Function(MeIdentifierUpdateReqBuilder)? updates]) =>
      (new MeIdentifierUpdateReqBuilder()..update(updates))._build();

  _$MeIdentifierUpdateReq._(
      {required this.identifierID,
      required this.identifierType,
      required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierID, r'MeIdentifierUpdateReq', 'identifierID');
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'MeIdentifierUpdateReq', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        value, r'MeIdentifierUpdateReq', 'value');
  }

  @override
  MeIdentifierUpdateReq rebuild(
          void Function(MeIdentifierUpdateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeIdentifierUpdateReqBuilder toBuilder() =>
      new MeIdentifierUpdateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeIdentifierUpdateReq &&
        identifierID == other.identifierID &&
        identifierType == other.identifierType &&
        value == other.value;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierID.hashCode);
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeIdentifierUpdateReq')
          ..add('identifierID', identifierID)
          ..add('identifierType', identifierType)
          ..add('value', value))
        .toString();
  }
}

class MeIdentifierUpdateReqBuilder
    implements Builder<MeIdentifierUpdateReq, MeIdentifierUpdateReqBuilder> {
  _$MeIdentifierUpdateReq? _$v;

  String? _identifierID;
  String? get identifierID => _$this._identifierID;
  set identifierID(String? identifierID) => _$this._identifierID = identifierID;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  MeIdentifierUpdateReqBuilder() {
    MeIdentifierUpdateReq._defaults(this);
  }

  MeIdentifierUpdateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierID = $v.identifierID;
      _identifierType = $v.identifierType;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeIdentifierUpdateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeIdentifierUpdateReq;
  }

  @override
  void update(void Function(MeIdentifierUpdateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeIdentifierUpdateReq build() => _build();

  _$MeIdentifierUpdateReq _build() {
    final _$result = _$v ??
        new _$MeIdentifierUpdateReq._(
            identifierID: BuiltValueNullFieldError.checkNotNull(
                identifierID, r'MeIdentifierUpdateReq', 'identifierID'),
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'MeIdentifierUpdateReq', 'identifierType'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'MeIdentifierUpdateReq', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
