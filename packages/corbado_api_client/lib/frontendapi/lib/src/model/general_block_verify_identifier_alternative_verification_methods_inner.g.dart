// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_verify_identifier_alternative_verification_methods_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner
    extends GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner {
  @override
  final VerificationMethod verificationMethod;
  @override
  final String identifier;

  factory _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner(
          [void Function(
                  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder)?
              updates]) =>
      (new GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder()
            ..update(updates))
          ._build();

  _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner._(
      {required this.verificationMethod, required this.identifier})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        verificationMethod,
        r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner',
        'verificationMethod');
    BuiltValueNullFieldError.checkNotNull(
        identifier,
        r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner',
        'identifier');
  }

  @override
  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner rebuild(
          void Function(
                  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
      toBuilder() =>
          new GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner &&
        verificationMethod == other.verificationMethod &&
        identifier == other.identifier;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, verificationMethod.hashCode);
    _$hash = $jc(_$hash, identifier.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner')
          ..add('verificationMethod', verificationMethod)
          ..add('identifier', identifier))
        .toString();
  }
}

class GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
    implements
        Builder<GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner,
            GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder> {
  _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner? _$v;

  VerificationMethod? _verificationMethod;
  VerificationMethod? get verificationMethod => _$this._verificationMethod;
  set verificationMethod(VerificationMethod? verificationMethod) =>
      _$this._verificationMethod = verificationMethod;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder() {
    GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner._defaults(
        this);
  }

  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _verificationMethod = $v.verificationMethod;
      _identifier = $v.identifier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner;
  }

  @override
  void update(
      void Function(
              GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInnerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner build() =>
      _build();

  _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner _build() {
    final _$result = _$v ??
        new _$GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner._(
            verificationMethod: BuiltValueNullFieldError.checkNotNull(
                verificationMethod,
                r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner',
                'verificationMethod'),
            identifier: BuiltValueNullFieldError.checkNotNull(
                identifier,
                r'GeneralBlockVerifyIdentifierAlternativeVerificationMethodsInner',
                'identifier'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
