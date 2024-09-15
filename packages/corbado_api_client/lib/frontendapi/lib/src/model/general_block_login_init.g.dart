// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_login_init.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockLoginInit extends GeneralBlockLoginInit {
  @override
  final String blockType;
  @override
  final String identifierValue;
  @override
  final bool isPhone;
  @override
  final bool isPhoneAvailable;
  @override
  final bool isEmailAvailable;
  @override
  final bool isUsernameAvailable;
  @override
  final SocialData socialData;
  @override
  final String? conditionalUIChallenge;
  @override
  final RequestError? fieldError;
  @override
  final RequestError? error;

  factory _$GeneralBlockLoginInit(
          [void Function(GeneralBlockLoginInitBuilder)? updates]) =>
      (new GeneralBlockLoginInitBuilder()..update(updates))._build();

  _$GeneralBlockLoginInit._(
      {required this.blockType,
      required this.identifierValue,
      required this.isPhone,
      required this.isPhoneAvailable,
      required this.isEmailAvailable,
      required this.isUsernameAvailable,
      required this.socialData,
      this.conditionalUIChallenge,
      this.fieldError,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockLoginInit', 'blockType');
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'GeneralBlockLoginInit', 'identifierValue');
    BuiltValueNullFieldError.checkNotNull(
        isPhone, r'GeneralBlockLoginInit', 'isPhone');
    BuiltValueNullFieldError.checkNotNull(
        isPhoneAvailable, r'GeneralBlockLoginInit', 'isPhoneAvailable');
    BuiltValueNullFieldError.checkNotNull(
        isEmailAvailable, r'GeneralBlockLoginInit', 'isEmailAvailable');
    BuiltValueNullFieldError.checkNotNull(
        isUsernameAvailable, r'GeneralBlockLoginInit', 'isUsernameAvailable');
    BuiltValueNullFieldError.checkNotNull(
        socialData, r'GeneralBlockLoginInit', 'socialData');
  }

  @override
  GeneralBlockLoginInit rebuild(
          void Function(GeneralBlockLoginInitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockLoginInitBuilder toBuilder() =>
      new GeneralBlockLoginInitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockLoginInit &&
        blockType == other.blockType &&
        identifierValue == other.identifierValue &&
        isPhone == other.isPhone &&
        isPhoneAvailable == other.isPhoneAvailable &&
        isEmailAvailable == other.isEmailAvailable &&
        isUsernameAvailable == other.isUsernameAvailable &&
        socialData == other.socialData &&
        conditionalUIChallenge == other.conditionalUIChallenge &&
        fieldError == other.fieldError &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, isPhone.hashCode);
    _$hash = $jc(_$hash, isPhoneAvailable.hashCode);
    _$hash = $jc(_$hash, isEmailAvailable.hashCode);
    _$hash = $jc(_$hash, isUsernameAvailable.hashCode);
    _$hash = $jc(_$hash, socialData.hashCode);
    _$hash = $jc(_$hash, conditionalUIChallenge.hashCode);
    _$hash = $jc(_$hash, fieldError.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockLoginInit')
          ..add('blockType', blockType)
          ..add('identifierValue', identifierValue)
          ..add('isPhone', isPhone)
          ..add('isPhoneAvailable', isPhoneAvailable)
          ..add('isEmailAvailable', isEmailAvailable)
          ..add('isUsernameAvailable', isUsernameAvailable)
          ..add('socialData', socialData)
          ..add('conditionalUIChallenge', conditionalUIChallenge)
          ..add('fieldError', fieldError)
          ..add('error', error))
        .toString();
  }
}

class GeneralBlockLoginInitBuilder
    implements Builder<GeneralBlockLoginInit, GeneralBlockLoginInitBuilder> {
  _$GeneralBlockLoginInit? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  String? _identifierValue;
  String? get identifierValue => _$this._identifierValue;
  set identifierValue(String? identifierValue) =>
      _$this._identifierValue = identifierValue;

  bool? _isPhone;
  bool? get isPhone => _$this._isPhone;
  set isPhone(bool? isPhone) => _$this._isPhone = isPhone;

  bool? _isPhoneAvailable;
  bool? get isPhoneAvailable => _$this._isPhoneAvailable;
  set isPhoneAvailable(bool? isPhoneAvailable) =>
      _$this._isPhoneAvailable = isPhoneAvailable;

  bool? _isEmailAvailable;
  bool? get isEmailAvailable => _$this._isEmailAvailable;
  set isEmailAvailable(bool? isEmailAvailable) =>
      _$this._isEmailAvailable = isEmailAvailable;

  bool? _isUsernameAvailable;
  bool? get isUsernameAvailable => _$this._isUsernameAvailable;
  set isUsernameAvailable(bool? isUsernameAvailable) =>
      _$this._isUsernameAvailable = isUsernameAvailable;

  SocialDataBuilder? _socialData;
  SocialDataBuilder get socialData =>
      _$this._socialData ??= new SocialDataBuilder();
  set socialData(SocialDataBuilder? socialData) =>
      _$this._socialData = socialData;

  String? _conditionalUIChallenge;
  String? get conditionalUIChallenge => _$this._conditionalUIChallenge;
  set conditionalUIChallenge(String? conditionalUIChallenge) =>
      _$this._conditionalUIChallenge = conditionalUIChallenge;

  RequestErrorBuilder? _fieldError;
  RequestErrorBuilder get fieldError =>
      _$this._fieldError ??= new RequestErrorBuilder();
  set fieldError(RequestErrorBuilder? fieldError) =>
      _$this._fieldError = fieldError;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  GeneralBlockLoginInitBuilder() {
    GeneralBlockLoginInit._defaults(this);
  }

  GeneralBlockLoginInitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _identifierValue = $v.identifierValue;
      _isPhone = $v.isPhone;
      _isPhoneAvailable = $v.isPhoneAvailable;
      _isEmailAvailable = $v.isEmailAvailable;
      _isUsernameAvailable = $v.isUsernameAvailable;
      _socialData = $v.socialData.toBuilder();
      _conditionalUIChallenge = $v.conditionalUIChallenge;
      _fieldError = $v.fieldError?.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockLoginInit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockLoginInit;
  }

  @override
  void update(void Function(GeneralBlockLoginInitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockLoginInit build() => _build();

  _$GeneralBlockLoginInit _build() {
    _$GeneralBlockLoginInit _$result;
    try {
      _$result = _$v ??
          new _$GeneralBlockLoginInit._(
              blockType: BuiltValueNullFieldError.checkNotNull(
                  blockType, r'GeneralBlockLoginInit', 'blockType'),
              identifierValue: BuiltValueNullFieldError.checkNotNull(
                  identifierValue, r'GeneralBlockLoginInit', 'identifierValue'),
              isPhone: BuiltValueNullFieldError.checkNotNull(
                  isPhone, r'GeneralBlockLoginInit', 'isPhone'),
              isPhoneAvailable: BuiltValueNullFieldError.checkNotNull(
                  isPhoneAvailable,
                  r'GeneralBlockLoginInit',
                  'isPhoneAvailable'),
              isEmailAvailable: BuiltValueNullFieldError.checkNotNull(
                  isEmailAvailable,
                  r'GeneralBlockLoginInit',
                  'isEmailAvailable'),
              isUsernameAvailable: BuiltValueNullFieldError.checkNotNull(
                  isUsernameAvailable,
                  r'GeneralBlockLoginInit',
                  'isUsernameAvailable'),
              socialData: socialData.build(),
              conditionalUIChallenge: conditionalUIChallenge,
              fieldError: _fieldError?.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'socialData';
        socialData.build();

        _$failedField = 'fieldError';
        _fieldError?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneralBlockLoginInit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
