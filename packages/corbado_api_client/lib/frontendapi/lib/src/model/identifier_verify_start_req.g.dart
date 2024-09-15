// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier_verify_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IdentifierVerifyStartReq extends IdentifierVerifyStartReq {
  @override
  final LoginIdentifierType identifierType;
  @override
  final VerificationMethod verificationType;

  factory _$IdentifierVerifyStartReq(
          [void Function(IdentifierVerifyStartReqBuilder)? updates]) =>
      (new IdentifierVerifyStartReqBuilder()..update(updates))._build();

  _$IdentifierVerifyStartReq._(
      {required this.identifierType, required this.verificationType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'IdentifierVerifyStartReq', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        verificationType, r'IdentifierVerifyStartReq', 'verificationType');
  }

  @override
  IdentifierVerifyStartReq rebuild(
          void Function(IdentifierVerifyStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifierVerifyStartReqBuilder toBuilder() =>
      new IdentifierVerifyStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IdentifierVerifyStartReq &&
        identifierType == other.identifierType &&
        verificationType == other.verificationType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, verificationType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IdentifierVerifyStartReq')
          ..add('identifierType', identifierType)
          ..add('verificationType', verificationType))
        .toString();
  }
}

class IdentifierVerifyStartReqBuilder
    implements
        Builder<IdentifierVerifyStartReq, IdentifierVerifyStartReqBuilder> {
  _$IdentifierVerifyStartReq? _$v;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  VerificationMethod? _verificationType;
  VerificationMethod? get verificationType => _$this._verificationType;
  set verificationType(VerificationMethod? verificationType) =>
      _$this._verificationType = verificationType;

  IdentifierVerifyStartReqBuilder() {
    IdentifierVerifyStartReq._defaults(this);
  }

  IdentifierVerifyStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierType = $v.identifierType;
      _verificationType = $v.verificationType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IdentifierVerifyStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IdentifierVerifyStartReq;
  }

  @override
  void update(void Function(IdentifierVerifyStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IdentifierVerifyStartReq build() => _build();

  _$IdentifierVerifyStartReq _build() {
    final _$result = _$v ??
        new _$IdentifierVerifyStartReq._(
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'IdentifierVerifyStartReq', 'identifierType'),
            verificationType: BuiltValueNullFieldError.checkNotNull(
                verificationType,
                r'IdentifierVerifyStartReq',
                'verificationType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
