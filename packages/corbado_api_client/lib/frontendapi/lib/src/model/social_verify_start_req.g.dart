// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_verify_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SocialVerifyStartReq extends SocialVerifyStartReq {
  @override
  final SocialProviderType providerType;
  @override
  final String redirectUrl;
  @override
  final AuthType authType;

  factory _$SocialVerifyStartReq(
          [void Function(SocialVerifyStartReqBuilder)? updates]) =>
      (new SocialVerifyStartReqBuilder()..update(updates))._build();

  _$SocialVerifyStartReq._(
      {required this.providerType,
      required this.redirectUrl,
      required this.authType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        providerType, r'SocialVerifyStartReq', 'providerType');
    BuiltValueNullFieldError.checkNotNull(
        redirectUrl, r'SocialVerifyStartReq', 'redirectUrl');
    BuiltValueNullFieldError.checkNotNull(
        authType, r'SocialVerifyStartReq', 'authType');
  }

  @override
  SocialVerifyStartReq rebuild(
          void Function(SocialVerifyStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialVerifyStartReqBuilder toBuilder() =>
      new SocialVerifyStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialVerifyStartReq &&
        providerType == other.providerType &&
        redirectUrl == other.redirectUrl &&
        authType == other.authType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerType.hashCode);
    _$hash = $jc(_$hash, redirectUrl.hashCode);
    _$hash = $jc(_$hash, authType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SocialVerifyStartReq')
          ..add('providerType', providerType)
          ..add('redirectUrl', redirectUrl)
          ..add('authType', authType))
        .toString();
  }
}

class SocialVerifyStartReqBuilder
    implements Builder<SocialVerifyStartReq, SocialVerifyStartReqBuilder> {
  _$SocialVerifyStartReq? _$v;

  SocialProviderType? _providerType;
  SocialProviderType? get providerType => _$this._providerType;
  set providerType(SocialProviderType? providerType) =>
      _$this._providerType = providerType;

  String? _redirectUrl;
  String? get redirectUrl => _$this._redirectUrl;
  set redirectUrl(String? redirectUrl) => _$this._redirectUrl = redirectUrl;

  AuthType? _authType;
  AuthType? get authType => _$this._authType;
  set authType(AuthType? authType) => _$this._authType = authType;

  SocialVerifyStartReqBuilder() {
    SocialVerifyStartReq._defaults(this);
  }

  SocialVerifyStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerType = $v.providerType;
      _redirectUrl = $v.redirectUrl;
      _authType = $v.authType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialVerifyStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialVerifyStartReq;
  }

  @override
  void update(void Function(SocialVerifyStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SocialVerifyStartReq build() => _build();

  _$SocialVerifyStartReq _build() {
    final _$result = _$v ??
        new _$SocialVerifyStartReq._(
            providerType: BuiltValueNullFieldError.checkNotNull(
                providerType, r'SocialVerifyStartReq', 'providerType'),
            redirectUrl: BuiltValueNullFieldError.checkNotNull(
                redirectUrl, r'SocialVerifyStartReq', 'redirectUrl'),
            authType: BuiltValueNullFieldError.checkNotNull(
                authType, r'SocialVerifyStartReq', 'authType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
