// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_identifier_delete_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeIdentifierDeleteReq extends MeIdentifierDeleteReq {
  @override
  final String identifierID;

  factory _$MeIdentifierDeleteReq(
          [void Function(MeIdentifierDeleteReqBuilder)? updates]) =>
      (new MeIdentifierDeleteReqBuilder()..update(updates))._build();

  _$MeIdentifierDeleteReq._({required this.identifierID}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierID, r'MeIdentifierDeleteReq', 'identifierID');
  }

  @override
  MeIdentifierDeleteReq rebuild(
          void Function(MeIdentifierDeleteReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeIdentifierDeleteReqBuilder toBuilder() =>
      new MeIdentifierDeleteReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeIdentifierDeleteReq && identifierID == other.identifierID;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierID.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeIdentifierDeleteReq')
          ..add('identifierID', identifierID))
        .toString();
  }
}

class MeIdentifierDeleteReqBuilder
    implements Builder<MeIdentifierDeleteReq, MeIdentifierDeleteReqBuilder> {
  _$MeIdentifierDeleteReq? _$v;

  String? _identifierID;
  String? get identifierID => _$this._identifierID;
  set identifierID(String? identifierID) => _$this._identifierID = identifierID;

  MeIdentifierDeleteReqBuilder() {
    MeIdentifierDeleteReq._defaults(this);
  }

  MeIdentifierDeleteReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierID = $v.identifierID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeIdentifierDeleteReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeIdentifierDeleteReq;
  }

  @override
  void update(void Function(MeIdentifierDeleteReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeIdentifierDeleteReq build() => _build();

  _$MeIdentifierDeleteReq _build() {
    final _$result = _$v ??
        new _$MeIdentifierDeleteReq._(
            identifierID: BuiltValueNullFieldError.checkNotNull(
                identifierID, r'MeIdentifierDeleteReq', 'identifierID'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
