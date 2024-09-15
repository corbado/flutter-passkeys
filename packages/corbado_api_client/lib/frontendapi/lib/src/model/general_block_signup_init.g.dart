// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_signup_init.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockSignupInit extends GeneralBlockSignupInit {
  @override
  final String blockType;
  @override
  final BuiltList<LoginIdentifierWithError> identifiers;
  @override
  final FullNameWithError? fullName;
  @override
  final SocialData? socialData;
  @override
  final RequestError? error;

  factory _$GeneralBlockSignupInit(
          [void Function(GeneralBlockSignupInitBuilder)? updates]) =>
      (new GeneralBlockSignupInitBuilder()..update(updates))._build();

  _$GeneralBlockSignupInit._(
      {required this.blockType,
      required this.identifiers,
      this.fullName,
      this.socialData,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockSignupInit', 'blockType');
    BuiltValueNullFieldError.checkNotNull(
        identifiers, r'GeneralBlockSignupInit', 'identifiers');
  }

  @override
  GeneralBlockSignupInit rebuild(
          void Function(GeneralBlockSignupInitBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockSignupInitBuilder toBuilder() =>
      new GeneralBlockSignupInitBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockSignupInit &&
        blockType == other.blockType &&
        identifiers == other.identifiers &&
        fullName == other.fullName &&
        socialData == other.socialData &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, identifiers.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, socialData.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockSignupInit')
          ..add('blockType', blockType)
          ..add('identifiers', identifiers)
          ..add('fullName', fullName)
          ..add('socialData', socialData)
          ..add('error', error))
        .toString();
  }
}

class GeneralBlockSignupInitBuilder
    implements Builder<GeneralBlockSignupInit, GeneralBlockSignupInitBuilder> {
  _$GeneralBlockSignupInit? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  ListBuilder<LoginIdentifierWithError>? _identifiers;
  ListBuilder<LoginIdentifierWithError> get identifiers =>
      _$this._identifiers ??= new ListBuilder<LoginIdentifierWithError>();
  set identifiers(ListBuilder<LoginIdentifierWithError>? identifiers) =>
      _$this._identifiers = identifiers;

  FullNameWithErrorBuilder? _fullName;
  FullNameWithErrorBuilder get fullName =>
      _$this._fullName ??= new FullNameWithErrorBuilder();
  set fullName(FullNameWithErrorBuilder? fullName) =>
      _$this._fullName = fullName;

  SocialDataBuilder? _socialData;
  SocialDataBuilder get socialData =>
      _$this._socialData ??= new SocialDataBuilder();
  set socialData(SocialDataBuilder? socialData) =>
      _$this._socialData = socialData;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  GeneralBlockSignupInitBuilder() {
    GeneralBlockSignupInit._defaults(this);
  }

  GeneralBlockSignupInitBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _identifiers = $v.identifiers.toBuilder();
      _fullName = $v.fullName?.toBuilder();
      _socialData = $v.socialData?.toBuilder();
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockSignupInit other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockSignupInit;
  }

  @override
  void update(void Function(GeneralBlockSignupInitBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockSignupInit build() => _build();

  _$GeneralBlockSignupInit _build() {
    _$GeneralBlockSignupInit _$result;
    try {
      _$result = _$v ??
          new _$GeneralBlockSignupInit._(
              blockType: BuiltValueNullFieldError.checkNotNull(
                  blockType, r'GeneralBlockSignupInit', 'blockType'),
              identifiers: identifiers.build(),
              fullName: _fullName?.build(),
              socialData: _socialData?.build(),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'identifiers';
        identifiers.build();
        _$failedField = 'fullName';
        _fullName?.build();
        _$failedField = 'socialData';
        _socialData?.build();
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneralBlockSignupInit', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
