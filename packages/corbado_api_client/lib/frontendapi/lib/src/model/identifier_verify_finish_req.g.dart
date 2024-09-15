// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier_verify_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IdentifierVerifyFinishReq extends IdentifierVerifyFinishReq {
  @override
  final String code;
  @override
  final LoginIdentifierType identifierType;
  @override
  final VerificationMethod verificationType;
  @override
  final bool isNewDevice;

  factory _$IdentifierVerifyFinishReq(
          [void Function(IdentifierVerifyFinishReqBuilder)? updates]) =>
      (new IdentifierVerifyFinishReqBuilder()..update(updates))._build();

  _$IdentifierVerifyFinishReq._(
      {required this.code,
      required this.identifierType,
      required this.verificationType,
      required this.isNewDevice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        code, r'IdentifierVerifyFinishReq', 'code');
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'IdentifierVerifyFinishReq', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        verificationType, r'IdentifierVerifyFinishReq', 'verificationType');
    BuiltValueNullFieldError.checkNotNull(
        isNewDevice, r'IdentifierVerifyFinishReq', 'isNewDevice');
  }

  @override
  IdentifierVerifyFinishReq rebuild(
          void Function(IdentifierVerifyFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifierVerifyFinishReqBuilder toBuilder() =>
      new IdentifierVerifyFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IdentifierVerifyFinishReq &&
        code == other.code &&
        identifierType == other.identifierType &&
        verificationType == other.verificationType &&
        isNewDevice == other.isNewDevice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, verificationType.hashCode);
    _$hash = $jc(_$hash, isNewDevice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'IdentifierVerifyFinishReq')
          ..add('code', code)
          ..add('identifierType', identifierType)
          ..add('verificationType', verificationType)
          ..add('isNewDevice', isNewDevice))
        .toString();
  }
}

class IdentifierVerifyFinishReqBuilder
    implements
        Builder<IdentifierVerifyFinishReq, IdentifierVerifyFinishReqBuilder> {
  _$IdentifierVerifyFinishReq? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  VerificationMethod? _verificationType;
  VerificationMethod? get verificationType => _$this._verificationType;
  set verificationType(VerificationMethod? verificationType) =>
      _$this._verificationType = verificationType;

  bool? _isNewDevice;
  bool? get isNewDevice => _$this._isNewDevice;
  set isNewDevice(bool? isNewDevice) => _$this._isNewDevice = isNewDevice;

  IdentifierVerifyFinishReqBuilder() {
    IdentifierVerifyFinishReq._defaults(this);
  }

  IdentifierVerifyFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _identifierType = $v.identifierType;
      _verificationType = $v.verificationType;
      _isNewDevice = $v.isNewDevice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IdentifierVerifyFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IdentifierVerifyFinishReq;
  }

  @override
  void update(void Function(IdentifierVerifyFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  IdentifierVerifyFinishReq build() => _build();

  _$IdentifierVerifyFinishReq _build() {
    final _$result = _$v ??
        new _$IdentifierVerifyFinishReq._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'IdentifierVerifyFinishReq', 'code'),
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'IdentifierVerifyFinishReq', 'identifierType'),
            verificationType: BuiltValueNullFieldError.checkNotNull(
                verificationType,
                r'IdentifierVerifyFinishReq',
                'verificationType'),
            isNewDevice: BuiltValueNullFieldError.checkNotNull(
                isNewDevice, r'IdentifierVerifyFinishReq', 'isNewDevice'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
