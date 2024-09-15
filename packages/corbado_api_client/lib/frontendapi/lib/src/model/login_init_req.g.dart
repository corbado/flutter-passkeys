// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginInitReq extends LoginInitReq {
  @override
  final String identifierValue;
  @override
  final bool isPhone;

  factory _$LoginInitReq([void Function(LoginInitReqBuilder)? updates]) =>
      (new LoginInitReqBuilder()..update(updates))._build();

  _$LoginInitReq._({required this.identifierValue, required this.isPhone})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'LoginInitReq', 'identifierValue');
    BuiltValueNullFieldError.checkNotNull(isPhone, r'LoginInitReq', 'isPhone');
  }

  @override
  LoginInitReq rebuild(void Function(LoginInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginInitReqBuilder toBuilder() => new LoginInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginInitReq &&
        identifierValue == other.identifierValue &&
        isPhone == other.isPhone;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, isPhone.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LoginInitReq')
          ..add('identifierValue', identifierValue)
          ..add('isPhone', isPhone))
        .toString();
  }
}

class LoginInitReqBuilder
    implements Builder<LoginInitReq, LoginInitReqBuilder> {
  _$LoginInitReq? _$v;

  String? _identifierValue;
  String? get identifierValue => _$this._identifierValue;
  set identifierValue(String? identifierValue) =>
      _$this._identifierValue = identifierValue;

  bool? _isPhone;
  bool? get isPhone => _$this._isPhone;
  set isPhone(bool? isPhone) => _$this._isPhone = isPhone;

  LoginInitReqBuilder() {
    LoginInitReq._defaults(this);
  }

  LoginInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierValue = $v.identifierValue;
      _isPhone = $v.isPhone;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LoginInitReq;
  }

  @override
  void update(void Function(LoginInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LoginInitReq build() => _build();

  _$LoginInitReq _build() {
    final _$result = _$v ??
        new _$LoginInitReq._(
            identifierValue: BuiltValueNullFieldError.checkNotNull(
                identifierValue, r'LoginInitReq', 'identifierValue'),
            isPhone: BuiltValueNullFieldError.checkNotNull(
                isPhone, r'LoginInitReq', 'isPhone'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
