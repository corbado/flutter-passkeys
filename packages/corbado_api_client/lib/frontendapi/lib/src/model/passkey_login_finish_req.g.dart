// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_login_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasskeyLoginFinishReq extends PasskeyLoginFinishReq {
  @override
  final String signedChallenge;

  factory _$PasskeyLoginFinishReq(
          [void Function(PasskeyLoginFinishReqBuilder)? updates]) =>
      (new PasskeyLoginFinishReqBuilder()..update(updates))._build();

  _$PasskeyLoginFinishReq._({required this.signedChallenge}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        signedChallenge, r'PasskeyLoginFinishReq', 'signedChallenge');
  }

  @override
  PasskeyLoginFinishReq rebuild(
          void Function(PasskeyLoginFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyLoginFinishReqBuilder toBuilder() =>
      new PasskeyLoginFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyLoginFinishReq &&
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
    return (newBuiltValueToStringHelper(r'PasskeyLoginFinishReq')
          ..add('signedChallenge', signedChallenge))
        .toString();
  }
}

class PasskeyLoginFinishReqBuilder
    implements Builder<PasskeyLoginFinishReq, PasskeyLoginFinishReqBuilder> {
  _$PasskeyLoginFinishReq? _$v;

  String? _signedChallenge;
  String? get signedChallenge => _$this._signedChallenge;
  set signedChallenge(String? signedChallenge) =>
      _$this._signedChallenge = signedChallenge;

  PasskeyLoginFinishReqBuilder() {
    PasskeyLoginFinishReq._defaults(this);
  }

  PasskeyLoginFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signedChallenge = $v.signedChallenge;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyLoginFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyLoginFinishReq;
  }

  @override
  void update(void Function(PasskeyLoginFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyLoginFinishReq build() => _build();

  _$PasskeyLoginFinishReq _build() {
    final _$result = _$v ??
        new _$PasskeyLoginFinishReq._(
            signedChallenge: BuiltValueNullFieldError.checkNotNull(
                signedChallenge, r'PasskeyLoginFinishReq', 'signedChallenge'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
