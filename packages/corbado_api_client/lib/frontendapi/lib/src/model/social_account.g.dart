// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_account.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SocialAccount extends SocialAccount {
  @override
  final SocialProviderType providerType;
  @override
  final String identifierValue;
  @override
  final String avatarUrl;
  @override
  final String fullName;

  factory _$SocialAccount([void Function(SocialAccountBuilder)? updates]) =>
      (new SocialAccountBuilder()..update(updates))._build();

  _$SocialAccount._(
      {required this.providerType,
      required this.identifierValue,
      required this.avatarUrl,
      required this.fullName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        providerType, r'SocialAccount', 'providerType');
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'SocialAccount', 'identifierValue');
    BuiltValueNullFieldError.checkNotNull(
        avatarUrl, r'SocialAccount', 'avatarUrl');
    BuiltValueNullFieldError.checkNotNull(
        fullName, r'SocialAccount', 'fullName');
  }

  @override
  SocialAccount rebuild(void Function(SocialAccountBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialAccountBuilder toBuilder() => new SocialAccountBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialAccount &&
        providerType == other.providerType &&
        identifierValue == other.identifierValue &&
        avatarUrl == other.avatarUrl &&
        fullName == other.fullName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providerType.hashCode);
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, avatarUrl.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SocialAccount')
          ..add('providerType', providerType)
          ..add('identifierValue', identifierValue)
          ..add('avatarUrl', avatarUrl)
          ..add('fullName', fullName))
        .toString();
  }
}

class SocialAccountBuilder
    implements Builder<SocialAccount, SocialAccountBuilder> {
  _$SocialAccount? _$v;

  SocialProviderType? _providerType;
  SocialProviderType? get providerType => _$this._providerType;
  set providerType(SocialProviderType? providerType) =>
      _$this._providerType = providerType;

  String? _identifierValue;
  String? get identifierValue => _$this._identifierValue;
  set identifierValue(String? identifierValue) =>
      _$this._identifierValue = identifierValue;

  String? _avatarUrl;
  String? get avatarUrl => _$this._avatarUrl;
  set avatarUrl(String? avatarUrl) => _$this._avatarUrl = avatarUrl;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  SocialAccountBuilder() {
    SocialAccount._defaults(this);
  }

  SocialAccountBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providerType = $v.providerType;
      _identifierValue = $v.identifierValue;
      _avatarUrl = $v.avatarUrl;
      _fullName = $v.fullName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialAccount other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialAccount;
  }

  @override
  void update(void Function(SocialAccountBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SocialAccount build() => _build();

  _$SocialAccount _build() {
    final _$result = _$v ??
        new _$SocialAccount._(
            providerType: BuiltValueNullFieldError.checkNotNull(
                providerType, r'SocialAccount', 'providerType'),
            identifierValue: BuiltValueNullFieldError.checkNotNull(
                identifierValue, r'SocialAccount', 'identifierValue'),
            avatarUrl: BuiltValueNullFieldError.checkNotNull(
                avatarUrl, r'SocialAccount', 'avatarUrl'),
            fullName: BuiltValueNullFieldError.checkNotNull(
                fullName, r'SocialAccount', 'fullName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
