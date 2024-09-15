// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_operation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PasskeyOperationOperationTypeEnum
    _$passkeyOperationOperationTypeEnum_append =
    const PasskeyOperationOperationTypeEnum._('append');
const PasskeyOperationOperationTypeEnum
    _$passkeyOperationOperationTypeEnum_verify =
    const PasskeyOperationOperationTypeEnum._('verify');

PasskeyOperationOperationTypeEnum _$passkeyOperationOperationTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'append':
      return _$passkeyOperationOperationTypeEnum_append;
    case 'verify':
      return _$passkeyOperationOperationTypeEnum_verify;
    default:
      return _$passkeyOperationOperationTypeEnum_verify;
  }
}

final BuiltSet<PasskeyOperationOperationTypeEnum>
    _$passkeyOperationOperationTypeEnumValues = new BuiltSet<
        PasskeyOperationOperationTypeEnum>(const <PasskeyOperationOperationTypeEnum>[
  _$passkeyOperationOperationTypeEnum_append,
  _$passkeyOperationOperationTypeEnum_verify,
]);

const PasskeyOperationCeremonyTypeEnum
    _$passkeyOperationCeremonyTypeEnum_local =
    const PasskeyOperationCeremonyTypeEnum._('local');
const PasskeyOperationCeremonyTypeEnum _$passkeyOperationCeremonyTypeEnum_cda =
    const PasskeyOperationCeremonyTypeEnum._('cda');
const PasskeyOperationCeremonyTypeEnum
    _$passkeyOperationCeremonyTypeEnum_securityKey =
    const PasskeyOperationCeremonyTypeEnum._('securityKey');

PasskeyOperationCeremonyTypeEnum _$passkeyOperationCeremonyTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'local':
      return _$passkeyOperationCeremonyTypeEnum_local;
    case 'cda':
      return _$passkeyOperationCeremonyTypeEnum_cda;
    case 'securityKey':
      return _$passkeyOperationCeremonyTypeEnum_securityKey;
    default:
      return _$passkeyOperationCeremonyTypeEnum_securityKey;
  }
}

final BuiltSet<PasskeyOperationCeremonyTypeEnum>
    _$passkeyOperationCeremonyTypeEnumValues = new BuiltSet<
        PasskeyOperationCeremonyTypeEnum>(const <PasskeyOperationCeremonyTypeEnum>[
  _$passkeyOperationCeremonyTypeEnum_local,
  _$passkeyOperationCeremonyTypeEnum_cda,
  _$passkeyOperationCeremonyTypeEnum_securityKey,
]);

Serializer<PasskeyOperationOperationTypeEnum>
    _$passkeyOperationOperationTypeEnumSerializer =
    new _$PasskeyOperationOperationTypeEnumSerializer();
Serializer<PasskeyOperationCeremonyTypeEnum>
    _$passkeyOperationCeremonyTypeEnumSerializer =
    new _$PasskeyOperationCeremonyTypeEnumSerializer();

class _$PasskeyOperationOperationTypeEnumSerializer
    implements PrimitiveSerializer<PasskeyOperationOperationTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'append': 'append',
    'verify': 'verify',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'append': 'append',
    'verify': 'verify',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyOperationOperationTypeEnum];
  @override
  final String wireName = 'PasskeyOperationOperationTypeEnum';

  @override
  Object serialize(
          Serializers serializers, PasskeyOperationOperationTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyOperationOperationTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyOperationOperationTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PasskeyOperationCeremonyTypeEnumSerializer
    implements PrimitiveSerializer<PasskeyOperationCeremonyTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'local': 'local',
    'cda': 'cda',
    'securityKey': 'security-key',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'local': 'local',
    'cda': 'cda',
    'security-key': 'securityKey',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyOperationCeremonyTypeEnum];
  @override
  final String wireName = 'PasskeyOperationCeremonyTypeEnum';

  @override
  Object serialize(
          Serializers serializers, PasskeyOperationCeremonyTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyOperationCeremonyTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyOperationCeremonyTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PasskeyOperation extends PasskeyOperation {
  @override
  final PasskeyOperationOperationTypeEnum operationType;
  @override
  final String identifierValue;
  @override
  final LoginIdentifierType identifierType;
  @override
  final PasskeyOperationCeremonyTypeEnum ceremonyType;

  factory _$PasskeyOperation(
          [void Function(PasskeyOperationBuilder)? updates]) =>
      (new PasskeyOperationBuilder()..update(updates))._build();

  _$PasskeyOperation._(
      {required this.operationType,
      required this.identifierValue,
      required this.identifierType,
      required this.ceremonyType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        operationType, r'PasskeyOperation', 'operationType');
    BuiltValueNullFieldError.checkNotNull(
        identifierValue, r'PasskeyOperation', 'identifierValue');
    BuiltValueNullFieldError.checkNotNull(
        identifierType, r'PasskeyOperation', 'identifierType');
    BuiltValueNullFieldError.checkNotNull(
        ceremonyType, r'PasskeyOperation', 'ceremonyType');
  }

  @override
  PasskeyOperation rebuild(void Function(PasskeyOperationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyOperationBuilder toBuilder() =>
      new PasskeyOperationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyOperation &&
        operationType == other.operationType &&
        identifierValue == other.identifierValue &&
        identifierType == other.identifierType &&
        ceremonyType == other.ceremonyType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, operationType.hashCode);
    _$hash = $jc(_$hash, identifierValue.hashCode);
    _$hash = $jc(_$hash, identifierType.hashCode);
    _$hash = $jc(_$hash, ceremonyType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PasskeyOperation')
          ..add('operationType', operationType)
          ..add('identifierValue', identifierValue)
          ..add('identifierType', identifierType)
          ..add('ceremonyType', ceremonyType))
        .toString();
  }
}

class PasskeyOperationBuilder
    implements Builder<PasskeyOperation, PasskeyOperationBuilder> {
  _$PasskeyOperation? _$v;

  PasskeyOperationOperationTypeEnum? _operationType;
  PasskeyOperationOperationTypeEnum? get operationType => _$this._operationType;
  set operationType(PasskeyOperationOperationTypeEnum? operationType) =>
      _$this._operationType = operationType;

  String? _identifierValue;
  String? get identifierValue => _$this._identifierValue;
  set identifierValue(String? identifierValue) =>
      _$this._identifierValue = identifierValue;

  LoginIdentifierType? _identifierType;
  LoginIdentifierType? get identifierType => _$this._identifierType;
  set identifierType(LoginIdentifierType? identifierType) =>
      _$this._identifierType = identifierType;

  PasskeyOperationCeremonyTypeEnum? _ceremonyType;
  PasskeyOperationCeremonyTypeEnum? get ceremonyType => _$this._ceremonyType;
  set ceremonyType(PasskeyOperationCeremonyTypeEnum? ceremonyType) =>
      _$this._ceremonyType = ceremonyType;

  PasskeyOperationBuilder() {
    PasskeyOperation._defaults(this);
  }

  PasskeyOperationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _operationType = $v.operationType;
      _identifierValue = $v.identifierValue;
      _identifierType = $v.identifierType;
      _ceremonyType = $v.ceremonyType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyOperation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyOperation;
  }

  @override
  void update(void Function(PasskeyOperationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyOperation build() => _build();

  _$PasskeyOperation _build() {
    final _$result = _$v ??
        new _$PasskeyOperation._(
            operationType: BuiltValueNullFieldError.checkNotNull(
                operationType, r'PasskeyOperation', 'operationType'),
            identifierValue: BuiltValueNullFieldError.checkNotNull(
                identifierValue, r'PasskeyOperation', 'identifierValue'),
            identifierType: BuiltValueNullFieldError.checkNotNull(
                identifierType, r'PasskeyOperation', 'identifierType'),
            ceremonyType: BuiltValueNullFieldError.checkNotNull(
                ceremonyType, r'PasskeyOperation', 'ceremonyType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
