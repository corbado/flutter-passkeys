// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_mediation_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasskeyMediationFinishReq extends PasskeyMediationFinishReq {
  @override
  final String signedChallenge;

  factory _$PasskeyMediationFinishReq(
          [void Function(PasskeyMediationFinishReqBuilder)? updates]) =>
      (new PasskeyMediationFinishReqBuilder()..update(updates))._build();

  _$PasskeyMediationFinishReq._({required this.signedChallenge}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        signedChallenge, r'PasskeyMediationFinishReq', 'signedChallenge');
  }

  @override
  PasskeyMediationFinishReq rebuild(
          void Function(PasskeyMediationFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyMediationFinishReqBuilder toBuilder() =>
      new PasskeyMediationFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyMediationFinishReq &&
        signedChallenge == other.signedChallenge;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, signedChallenge.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasskeyMediationFinishReq')
          ..add('signedChallenge', signedChallenge))
        .toString();
  }
}

class PasskeyMediationFinishReqBuilder
    implements
        Builder<PasskeyMediationFinishReq, PasskeyMediationFinishReqBuilder> {
  _$PasskeyMediationFinishReq? _$v;

  String? _signedChallenge;
  String? get signedChallenge => _$this._signedChallenge;
  set signedChallenge(String? signedChallenge) =>
      _$this._signedChallenge = signedChallenge;

  PasskeyMediationFinishReqBuilder() {
    PasskeyMediationFinishReq._defaults(this);
  }

  PasskeyMediationFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signedChallenge = $v.signedChallenge;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyMediationFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyMediationFinishReq;
  }

  @override
  void update(void Function(PasskeyMediationFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyMediationFinishReq build() => _build();

  _$PasskeyMediationFinishReq _build() {
    final _$result = _$v ??
        new _$PasskeyMediationFinishReq._(
            signedChallenge: BuiltValueNullFieldError.checkNotNull(
                signedChallenge,
                r'PasskeyMediationFinishReq',
                'signedChallenge'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
