// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SignupInitReq extends SignupInitReq {
  @override
  final BuiltList<LoginIdentifier> identifiers;
  @override
  final String? fullName;

  factory _$SignupInitReq([void Function(SignupInitReqBuilder)? updates]) =>
      (new SignupInitReqBuilder()..update(updates))._build();

  _$SignupInitReq._({required this.identifiers, this.fullName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifiers, r'SignupInitReq', 'identifiers');
  }

  @override
  SignupInitReq rebuild(void Function(SignupInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignupInitReqBuilder toBuilder() => new SignupInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignupInitReq &&
        identifiers == other.identifiers &&
        fullName == other.fullName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifiers.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SignupInitReq')
          ..add('identifiers', identifiers)
          ..add('fullName', fullName))
        .toString();
  }
}

class SignupInitReqBuilder
    implements Builder<SignupInitReq, SignupInitReqBuilder> {
  _$SignupInitReq? _$v;

  ListBuilder<LoginIdentifier>? _identifiers;
  ListBuilder<LoginIdentifier> get identifiers =>
      _$this._identifiers ??= new ListBuilder<LoginIdentifier>();
  set identifiers(ListBuilder<LoginIdentifier>? identifiers) =>
      _$this._identifiers = identifiers;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  SignupInitReqBuilder() {
    SignupInitReq._defaults(this);
  }

  SignupInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifiers = $v.identifiers.toBuilder();
      _fullName = $v.fullName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignupInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignupInitReq;
  }

  @override
  void update(void Function(SignupInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SignupInitReq build() => _build();

  _$SignupInitReq _build() {
    _$SignupInitReq _$result;
    try {
      _$result = _$v ??
          new _$SignupInitReq._(
              identifiers: identifiers.build(), fullName: fullName);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'identifiers';
        identifiers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SignupInitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
