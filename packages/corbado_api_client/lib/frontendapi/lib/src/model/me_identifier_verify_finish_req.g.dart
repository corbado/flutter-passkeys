// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_identifier_verify_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeIdentifierVerifyFinishReq extends MeIdentifierVerifyFinishReq {
  @override
  final String identifierID;
  @override
  final String code;

  factory _$MeIdentifierVerifyFinishReq(
          [void Function(MeIdentifierVerifyFinishReqBuilder)? updates]) =>
      (new MeIdentifierVerifyFinishReqBuilder()..update(updates))._build();

  _$MeIdentifierVerifyFinishReq._(
      {required this.identifierID, required this.code})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierID, r'MeIdentifierVerifyFinishReq', 'identifierID');
    BuiltValueNullFieldError.checkNotNull(
        code, r'MeIdentifierVerifyFinishReq', 'code');
  }

  @override
  MeIdentifierVerifyFinishReq rebuild(
          void Function(MeIdentifierVerifyFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeIdentifierVerifyFinishReqBuilder toBuilder() =>
      new MeIdentifierVerifyFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeIdentifierVerifyFinishReq &&
        identifierID == other.identifierID &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierID.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeIdentifierVerifyFinishReq')
          ..add('identifierID', identifierID)
          ..add('code', code))
        .toString();
  }
}

class MeIdentifierVerifyFinishReqBuilder
    implements
        Builder<MeIdentifierVerifyFinishReq,
            MeIdentifierVerifyFinishReqBuilder> {
  _$MeIdentifierVerifyFinishReq? _$v;

  String? _identifierID;
  String? get identifierID => _$this._identifierID;
  set identifierID(String? identifierID) => _$this._identifierID = identifierID;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  MeIdentifierVerifyFinishReqBuilder() {
    MeIdentifierVerifyFinishReq._defaults(this);
  }

  MeIdentifierVerifyFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierID = $v.identifierID;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeIdentifierVerifyFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeIdentifierVerifyFinishReq;
  }

  @override
  void update(void Function(MeIdentifierVerifyFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeIdentifierVerifyFinishReq build() => _build();

  _$MeIdentifierVerifyFinishReq _build() {
    final _$result = _$v ??
        new _$MeIdentifierVerifyFinishReq._(
            identifierID: BuiltValueNullFieldError.checkNotNull(
                identifierID, r'MeIdentifierVerifyFinishReq', 'identifierID'),
            code: BuiltValueNullFieldError.checkNotNull(
                code, r'MeIdentifierVerifyFinishReq', 'code'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
