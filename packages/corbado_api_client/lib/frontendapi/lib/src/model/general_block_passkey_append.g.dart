// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_passkey_append.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GeneralBlockPasskeyAppendVariantEnum
    _$generalBlockPasskeyAppendVariantEnum_default_ =
    const GeneralBlockPasskeyAppendVariantEnum._('default_');
const GeneralBlockPasskeyAppendVariantEnum
    _$generalBlockPasskeyAppendVariantEnum_afterHybrid =
    const GeneralBlockPasskeyAppendVariantEnum._('afterHybrid');
const GeneralBlockPasskeyAppendVariantEnum
    _$generalBlockPasskeyAppendVariantEnum_afterError =
    const GeneralBlockPasskeyAppendVariantEnum._('afterError');

GeneralBlockPasskeyAppendVariantEnum
    _$generalBlockPasskeyAppendVariantEnumValueOf(String name) {
  switch (name) {
    case 'default_':
      return _$generalBlockPasskeyAppendVariantEnum_default_;
    case 'afterHybrid':
      return _$generalBlockPasskeyAppendVariantEnum_afterHybrid;
    case 'afterError':
      return _$generalBlockPasskeyAppendVariantEnum_afterError;
    default:
      return _$generalBlockPasskeyAppendVariantEnum_afterError;
  }
}

final BuiltSet<GeneralBlockPasskeyAppendVariantEnum>
    _$generalBlockPasskeyAppendVariantEnumValues = new BuiltSet<
        GeneralBlockPasskeyAppendVariantEnum>(const <GeneralBlockPasskeyAppendVariantEnum>[
  _$generalBlockPasskeyAppendVariantEnum_default_,
  _$generalBlockPasskeyAppendVariantEnum_afterHybrid,
  _$generalBlockPasskeyAppendVariantEnum_afterError,
]);

Serializer<GeneralBlockPasskeyAppendVariantEnum>
    _$generalBlockPasskeyAppendVariantEnumSerializer =
    new _$GeneralBlockPasskeyAppendVariantEnumSerializer();

class _$GeneralBlockPasskeyAppendVariantEnumSerializer
    implements PrimitiveSerializer<GeneralBlockPasskeyAppendVariantEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'default_': 'default',
    'afterHybrid': 'after-hybrid',
    'afterError': 'after-error',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'default': 'default_',
    'after-hybrid': 'afterHybrid',
    'after-error': 'afterError',
  };

  @override
  final Iterable<Type> types = const <Type>[
    GeneralBlockPasskeyAppendVariantEnum
  ];
  @override
  final String wireName = 'GeneralBlockPasskeyAppendVariantEnum';

  @override
  Object serialize(
          Serializers serializers, GeneralBlockPasskeyAppendVariantEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GeneralBlockPasskeyAppendVariantEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GeneralBlockPasskeyAppendVariantEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GeneralBlockPasskeyAppend extends GeneralBlockPasskeyAppend {
  @override
  final String blockType;
  @override
  final String challenge;
  @override
  final String identifierValue;
  @override
  final LoginIdentifierType identifierType;
  @override
  final bool autoSubmit;
  @override
  final PasskeyIconSet passkeyIconSet;
  @override
  final GeneralBlockPasskeyAppendVariantEnum variant;

  factory _$GeneralBlockPasskeyAppend(
          [void Function(GeneralBlockPasskeyAppendBuilder)? updates]) =>
      (new GeneralBlockPasskeyAppendBuilder()..update(updates))._build();

  _$GeneralBlockPasskeyAppend._(
      {required this.blockType,
      required this.challenge,
      required this.identifierValue,
      required this.identifierType,
      required this.autoSubmit,
      required this.passkeyIconSet,
      required this.variant})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockPasskeyAppend', 'blockType');
    BuiltValueNullFieldError.checkNotNull(
        challenge, r'GeneralBlockPasskeyAppend', 'challenge');
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'GeneralBlockPasskeyAppend', 'identifierValue');
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'GeneralBlockPasskeyAppend', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        autoSubmit, r'GeneralBlockPasskeyAppend', 'autoSubmit');
    BuiltValueNullFieldError.checkNotNull(
        passkeyIconSet, r'GeneralBlockPasskeyAppend', 'passkeyIconSet');
    BuiltValueNullFieldError.checkNotNull(
        variant, r'GeneralBlockPasskeyAppend', 'variant');
  }

  @override
  GeneralBlockPasskeyAppend rebuild(
          void Function(GeneralBlockPasskeyAppendBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockPasskeyAppendBuilder toBuilder() =>
      new GeneralBlockPasskeyAppendBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockPasskeyAppend &&
        blockType == other.blockType &&
        challenge == other.challenge &&
        identifierValue == other.identifierValue &&
        identifierType == other.identifierType &&
        autoSubmit == other.autoSubmit &&
        passkeyIconSet == other.passkeyIconSet &&
        variant == other.variant;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, challenge.hashCode);
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, autoSubmit.hashCode);
    _$hash = $jc(_$hash, passkeyIconSet.hashCode);
    _$hash = $jc(_$hash, variant.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockPasskeyAppend')
          ..add('blockType', blockType)
          ..add('challenge', challenge)
          ..add('identifierValue', identifierValue)
          ..add('identifierType', identifierType)
          ..add('autoSubmit', autoSubmit)
          ..add('passkeyIconSet', passkeyIconSet)
          ..add('variant', variant))
        .toString();
  }
}

class GeneralBlockPasskeyAppendBuilder
    implements
        Builder<GeneralBlockPasskeyAppend, GeneralBlockPasskeyAppendBuilder> {
  _$GeneralBlockPasskeyAppend? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  String? _challenge;
  String? get challenge => _$this._challenge;
  set challenge(String? challenge) => _$this._challenge = challenge;

  String? _identifierValue;
  String? get identifierValue => _$this._identifierValue;
  set identifierValue(String? identifierValue) =>
      _$this._identifierValue = identifierValue;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  bool? _autoSubmit;
  bool? get autoSubmit => _$this._autoSubmit;
  set autoSubmit(bool? autoSubmit) => _$this._autoSubmit = autoSubmit;

  PasskeyIconSet? _passkeyIconSet;
  PasskeyIconSet? get passkeyIconSet => _$this._passkeyIconSet;
  set passkeyIconSet(PasskeyIconSet? passkeyIconSet) =>
      _$this._passkeyIconSet = passkeyIconSet;

  GeneralBlockPasskeyAppendVariantEnum? _variant;
  GeneralBlockPasskeyAppendVariantEnum? get variant => _$this._variant;
  set variant(GeneralBlockPasskeyAppendVariantEnum? variant) =>
      _$this._variant = variant;

  GeneralBlockPasskeyAppendBuilder() {
    GeneralBlockPasskeyAppend._defaults(this);
  }

  GeneralBlockPasskeyAppendBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _challenge = $v.challenge;
      _identifierValue = $v.identifierValue;
      _identifierType = $v.identifierType;
      _autoSubmit = $v.autoSubmit;
      _passkeyIconSet = $v.passkeyIconSet;
      _variant = $v.variant;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockPasskeyAppend other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockPasskeyAppend;
  }

  @override
  void update(void Function(GeneralBlockPasskeyAppendBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockPasskeyAppend build() => _build();

  _$GeneralBlockPasskeyAppend _build() {
    final _$result = _$v ??
        new _$GeneralBlockPasskeyAppend._(
            blockType: BuiltValueNullFieldError.checkNotNull(
                blockType, r'GeneralBlockPasskeyAppend', 'blockType'),
            challenge: BuiltValueNullFieldError.checkNotNull(
                challenge, r'GeneralBlockPasskeyAppend', 'challenge'),
            identifierValue: BuiltValueNullFieldError.checkNotNull(
                identifierValue,
                r'GeneralBlockPasskeyAppend',
                'identifierValue'),
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'GeneralBlockPasskeyAppend', 'identifierType'),
            autoSubmit: BuiltValueNullFieldError.checkNotNull(
                autoSubmit, r'GeneralBlockPasskeyAppend', 'autoSubmit'),
            passkeyIconSet: BuiltValueNullFieldError.checkNotNull(
                passkeyIconSet, r'GeneralBlockPasskeyAppend', 'passkeyIconSet'),
            variant: BuiltValueNullFieldError.checkNotNull(
                variant, r'GeneralBlockPasskeyAppend', 'variant'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
