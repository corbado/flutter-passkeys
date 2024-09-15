// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier_update_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IdentifierUpdateReq extends IdentifierUpdateReq {
  @override
  final LoginIdentifierType identifierType;
  @override
  final String value;

  factory _$IdentifierUpdateReq(
          [void Function(IdentifierUpdateReqBuilder)? updates]) =>
      (new IdentifierUpdateReqBuilder()..update(updates))._build();

  _$IdentifierUpdateReq._({required this.identifierType, required this.value})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'IdentifierUpdateReq', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        value, r'IdentifierUpdateReq', 'value');
  }

  @override
  IdentifierUpdateReq rebuild(
          void Function(IdentifierUpdateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifierUpdateReqBuilder toBuilder() =>
      new IdentifierUpdateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IdentifierUpdateReq &&
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
    return (newBuiltValueToStringHelper(r'IdentifierUpdateReq')
          ..add('identifierType', identifierType)
          ..add('value', value))
        .toString();
  }
}

class IdentifierUpdateReqBuilder
    implements Builder<IdentifierUpdateReq, IdentifierUpdateReqBuilder> {
  _$IdentifierUpdateReq? _$v;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  IdentifierUpdateReqBuilder() {
    IdentifierUpdateReq._defaults(this);
  }

  IdentifierUpdateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierType = $v.identifierType;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IdentifierUpdateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IdentifierUpdateReq;
  }

  @override
  void update(void Function(IdentifierUpdateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IdentifierUpdateReq build() => _build();

  _$IdentifierUpdateReq _build() {
    final _$result = _$v ??
        new _$IdentifierUpdateReq._(
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'IdentifierUpdateReq', 'identifierType'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'IdentifierUpdateReq', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
