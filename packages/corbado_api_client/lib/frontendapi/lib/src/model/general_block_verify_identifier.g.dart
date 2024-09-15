// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_verify_identifier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockVerifyIdentifier extends GeneralBlockVerifyIdentifier {
  @override
  final String blockType;
  @override
  final VerificationMethod verificationMethod;
  @override
  final String identifier;
  @override
  final BuiltList<
          GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>
      alternativeVerificationMethods;
  @override
  final bool isPostLoginVerification;
  @override
  final int? retryNotBefore;
  @override
  final RequestError? error;

  factory _$GeneralBlockVerifyIdentifier(
          [void Function(GeneralBlockVerifyIdentifierBuilder)? updates]) =>
      (new GeneralBlockVerifyIdentifierBuilder()..update(updates))._build();

  _$GeneralBlockVerifyIdentifier._(
      {required this.blockType,
      required this.verificationMethod,
      required this.identifier,
      required this.alternativeVerificationMethods,
      required this.isPostLoginVerification,
      this.retryNotBefore,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockVerifyIdentifier', 'blockType');
    BuiltValueNullFieldError.checkNotNull(verificationMethod,
        r'GeneralBlockVerifyIdentifier', 'verificationMethod');
    BuiltValueNullFieldError.checkNotNull(
        identifier, r'GeneralBlockVerifyIdentifier', 'identifier');
    BuiltValueNullFieldError.checkNotNull(alternativeVerificationMethods,
        r'GeneralBlockVerifyIdentifier', 'alternativeVerificationMethods');
    BuiltValueNullFieldError.checkNotNull(isPostLoginVerification,
        r'GeneralBlockVerifyIdentifier', 'isPostLoginVerification');
  }

  @override
  GeneralBlockVerifyIdentifier rebuild(
          void Function(GeneralBlockVerifyIdentifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockVerifyIdentifierBuilder toBuilder() =>
      new GeneralBlockVerifyIdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockVerifyIdentifier &&
        blockType == other.blockType &&
        verificationMethod == other.verificationMethod &&
        identifier == other.identifier &&
        alternativeVerificationMethods ==
            other.alternativeVerificationMethods &&
        isPostLoginVerification == other.isPostLoginVerification &&
        retryNotBefore == other.retryNotBefore &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, verificationMethod.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jc(_$hash, alternativeVerificationMethods.hashCode);
    _$hash = $jc(_$hash, isPostLoginVerification.hashCode);
    _$hash = $jc(_$hash, retryNotBefore.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockVerifyIdentifier')
          ..add('blockType', blockType)
          ..add('verificationMethod', verificationMethod)
          ..add('identifier', identifier)
          ..add(
              'alternativeVerificationMethods', alternativeVerificationMethods)
          ..add('isPostLoginVerification', isPostLoginVerification)
          ..add('retryNotBefore', retryNotBefore)
          ..add('error', error))
        .toString();
  }
}

class GeneralBlockVerifyIdentifierBuilder
    implements
        Builder<GeneralBlockVerifyIdentifier,
            GeneralBlockVerifyIdentifierBuilder> {
  _$GeneralBlockVerifyIdentifier? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  VerificationMethod? _verificationMethod;
  VerificationMethod? get verificationMethod => _$this._verificationMethod;
  set verificationMethod(VerificationMethod? verificationMethod) =>
      _$this._verificationMethod = verificationMethod;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  ListBuilder<GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>?
      _alternativeVerificationMethods;
  ListBuilder<GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>
      get alternativeVerificationMethods =>
          _$this._alternativeVerificationMethods ??= new ListBuilder<
              GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>();
  set alternativeVerificationMethods(
          ListBuilder<
                  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner>?
              alternativeVerificationMethods) =>
      _$this._alternativeVerificationMethods = alternativeVerificationMethods;

  bool? _isPostLoginVerification;
  bool? get isPostLoginVerification => _$this._isPostLoginVerification;
  set isPostLoginVerification(bool? isPostLoginVerification) =>
      _$this._isPostLoginVerification = isPostLoginVerification;

  int? _retryNotBefore;
  int? get retryNotBefore => _$this._retryNotBefore;
  set retryNotBefore(int? retryNotBefore) =>
      _$this._retryNotBefore = retryNotBefore;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  GeneralBlockVerifyIdentifierBuilder() {
    GeneralBlockVerifyIdentifier._defaults(this);
  }

  GeneralBlockVerifyIdentifierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _verificationMethod = $v.verificationMethod;
      _identifier = $v.identifier;
      _alternativeVerificationMethods =
          $v.alternativeVerificationMethods.toBuilder();
      _isPostLoginVerification = $v.isPostLoginVerification;
      _retryNotBefore = $v.retryNotBefore;
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockVerifyIdentifier other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockVerifyIdentifier;
  }

  @override
  void update(void Function(GeneralBlockVerifyIdentifierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockVerifyIdentifier build() => _build();

  _$GeneralBlockVerifyIdentifier _build() {
    _$GeneralBlockVerifyIdentifier _$result;
    try {
      _$result = _$v ??
          new _$GeneralBlockVerifyIdentifier._(
              blockType: BuiltValueNullFieldError.checkNotNull(
                  blockType, r'GeneralBlockVerifyIdentifier', 'blockType'),
              verificationMethod: BuiltValueNullFieldError.checkNotNull(
                  verificationMethod,
                  r'GeneralBlockVerifyIdentifier',
                  'verificationMethod'),
              identifier: BuiltValueNullFieldError.checkNotNull(
                  identifier, r'GeneralBlockVerifyIdentifier', 'identifier'),
              alternativeVerificationMethods:
                  alternativeVerificationMethods.build(),
              isPostLoginVerification: BuiltValueNullFieldError.checkNotNull(
                  isPostLoginVerification,
                  r'GeneralBlockVerifyIdentifier',
                  'isPostLoginVerification'),
              retryNotBefore: retryNotBefore,
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'alternativeVerificationMethods';
        alternativeVerificationMethods.build();

        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneralBlockVerifyIdentifier', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
