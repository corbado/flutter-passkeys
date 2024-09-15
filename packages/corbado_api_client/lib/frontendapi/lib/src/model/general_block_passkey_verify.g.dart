// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_passkey_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const GeneralBlockPasskeyVerifyLoginHintEnum
    _$generalBlockPasskeyVerifyLoginHintEnum_cda =
    const GeneralBlockPasskeyVerifyLoginHintEnum._('cda');

GeneralBlockPasskeyVerifyLoginHintEnum
    _$generalBlockPasskeyVerifyLoginHintEnumValueOf(String name) {
  switch (name) {
    case 'cda':
      return _$generalBlockPasskeyVerifyLoginHintEnum_cda;
    default:
      return _$generalBlockPasskeyVerifyLoginHintEnum_cda;
  }
}

final BuiltSet<GeneralBlockPasskeyVerifyLoginHintEnum>
    _$generalBlockPasskeyVerifyLoginHintEnumValues = new BuiltSet<
        GeneralBlockPasskeyVerifyLoginHintEnum>(const <GeneralBlockPasskeyVerifyLoginHintEnum>[
  _$generalBlockPasskeyVerifyLoginHintEnum_cda,
]);

Serializer<GeneralBlockPasskeyVerifyLoginHintEnum>
    _$generalBlockPasskeyVerifyLoginHintEnumSerializer =
    new _$GeneralBlockPasskeyVerifyLoginHintEnumSerializer();

class _$GeneralBlockPasskeyVerifyLoginHintEnumSerializer
    implements PrimitiveSerializer<GeneralBlockPasskeyVerifyLoginHintEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'cda': 'cda',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'cda': 'cda',
  };

  @override
  final Iterable<Type> types = const <Type>[
    GeneralBlockPasskeyVerifyLoginHintEnum
  ];
  @override
  final String wireName = 'GeneralBlockPasskeyVerifyLoginHintEnum';

  @override
  Object serialize(Serializers serializers,
          GeneralBlockPasskeyVerifyLoginHintEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  GeneralBlockPasskeyVerifyLoginHintEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      GeneralBlockPasskeyVerifyLoginHintEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$GeneralBlockPasskeyVerify extends GeneralBlockPasskeyVerify {
  @override
  final String blockType;
  @override
  final String challenge;
  @override
  final String identifierValue;
  @override
  final GeneralBlockPasskeyVerifyLoginHintEnum? loginHint;

  factory _$GeneralBlockPasskeyVerify(
          [void Function(GeneralBlockPasskeyVerifyBuilder)? updates]) =>
      (new GeneralBlockPasskeyVerifyBuilder()..update(updates))._build();

  _$GeneralBlockPasskeyVerify._(
      {required this.blockType,
      required this.challenge,
      required this.identifierValue,
      this.loginHint})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockPasskeyVerify', 'blockType');
    BuiltValueNullFieldError.checkNotNull(
        challenge, r'GeneralBlockPasskeyVerify', 'challenge');
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'GeneralBlockPasskeyVerify', 'identifierValue');
  }

  @override
  GeneralBlockPasskeyVerify rebuild(
          void Function(GeneralBlockPasskeyVerifyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockPasskeyVerifyBuilder toBuilder() =>
      new GeneralBlockPasskeyVerifyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockPasskeyVerify &&
        blockType == other.blockType &&
        challenge == other.challenge &&
        identifierValue == other.identifierValue &&
        loginHint == other.loginHint;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, challenge.hashCode);
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, loginHint.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockPasskeyVerify')
          ..add('blockType', blockType)
          ..add('challenge', challenge)
          ..add('identifierValue', identifierValue)
          ..add('loginHint', loginHint))
        .toString();
  }
}

class GeneralBlockPasskeyVerifyBuilder
    implements
        Builder<GeneralBlockPasskeyVerify, GeneralBlockPasskeyVerifyBuilder> {
  _$GeneralBlockPasskeyVerify? _$v;

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

  GeneralBlockPasskeyVerifyLoginHintEnum? _loginHint;
  GeneralBlockPasskeyVerifyLoginHintEnum? get loginHint => _$this._loginHint;
  set loginHint(GeneralBlockPasskeyVerifyLoginHintEnum? loginHint) =>
      _$this._loginHint = loginHint;

  GeneralBlockPasskeyVerifyBuilder() {
    GeneralBlockPasskeyVerify._defaults(this);
  }

  GeneralBlockPasskeyVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _challenge = $v.challenge;
      _identifierValue = $v.identifierValue;
      _loginHint = $v.loginHint;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockPasskeyVerify other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockPasskeyVerify;
  }

  @override
  void update(void Function(GeneralBlockPasskeyVerifyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockPasskeyVerify build() => _build();

  _$GeneralBlockPasskeyVerify _build() {
    final _$result = _$v ??
        new _$GeneralBlockPasskeyVerify._(
            blockType: BuiltValueNullFieldError.checkNotNull(
                blockType, r'GeneralBlockPasskeyVerify', 'blockType'),
            challenge: BuiltValueNullFieldError.checkNotNull(
                challenge, r'GeneralBlockPasskeyVerify', 'challenge'),
            identifierValue: BuiltValueNullFieldError.checkNotNull(
                identifierValue,
                r'GeneralBlockPasskeyVerify',
                'identifierValue'),
            loginHint: loginHint);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
