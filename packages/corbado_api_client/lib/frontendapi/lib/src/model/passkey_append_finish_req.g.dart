// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_append_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasskeyAppendFinishReq extends PasskeyAppendFinishReq {
  @override
  final String signedChallenge;

  factory _$PasskeyAppendFinishReq(
          [void Function(PasskeyAppendFinishReqBuilder)? updates]) =>
      (new PasskeyAppendFinishReqBuilder()..update(updates))._build();

  _$PasskeyAppendFinishReq._({required this.signedChallenge}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        signedChallenge, r'PasskeyAppendFinishReq', 'signedChallenge');
  }

  @override
  PasskeyAppendFinishReq rebuild(
          void Function(PasskeyAppendFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyAppendFinishReqBuilder toBuilder() =>
      new PasskeyAppendFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyAppendFinishReq &&
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
    return (newBuiltValueToStringHelper(r'PasskeyAppendFinishReq')
          ..add('signedChallenge', signedChallenge))
        .toString();
  }
}

class PasskeyAppendFinishReqBuilder
    implements Builder<PasskeyAppendFinishReq, PasskeyAppendFinishReqBuilder> {
  _$PasskeyAppendFinishReq? _$v;

  String? _signedChallenge;
  String? get signedChallenge => _$this._signedChallenge;
  set signedChallenge(String? signedChallenge) =>
      _$this._signedChallenge = signedChallenge;

  PasskeyAppendFinishReqBuilder() {
    PasskeyAppendFinishReq._defaults(this);
  }

  PasskeyAppendFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _signedChallenge = $v.signedChallenge;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyAppendFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyAppendFinishReq;
  }

  @override
  void update(void Function(PasskeyAppendFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyAppendFinishReq build() => _build();

  _$PasskeyAppendFinishReq _build() {
    final _$result = _$v ??
        new _$PasskeyAppendFinishReq._(
            signedChallenge: BuiltValueNullFieldError.checkNotNull(
                signedChallenge, r'PasskeyAppendFinishReq', 'signedChallenge'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
