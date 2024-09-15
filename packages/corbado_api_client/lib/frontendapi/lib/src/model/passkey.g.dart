// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PasskeyTransportEnum _$passkeyTransportEnum_usb =
    const PasskeyTransportEnum._('usb');
const PasskeyTransportEnum _$passkeyTransportEnum_nfc =
    const PasskeyTransportEnum._('nfc');
const PasskeyTransportEnum _$passkeyTransportEnum_ble =
    const PasskeyTransportEnum._('ble');
const PasskeyTransportEnum _$passkeyTransportEnum_internal =
    const PasskeyTransportEnum._('internal');
const PasskeyTransportEnum _$passkeyTransportEnum_hybrid =
    const PasskeyTransportEnum._('hybrid');
const PasskeyTransportEnum _$passkeyTransportEnum_smartCard =
    const PasskeyTransportEnum._('smartCard');

PasskeyTransportEnum _$passkeyTransportEnumValueOf(String name) {
  switch (name) {
    case 'usb':
      return _$passkeyTransportEnum_usb;
    case 'nfc':
      return _$passkeyTransportEnum_nfc;
    case 'ble':
      return _$passkeyTransportEnum_ble;
    case 'internal':
      return _$passkeyTransportEnum_internal;
    case 'hybrid':
      return _$passkeyTransportEnum_hybrid;
    case 'smartCard':
      return _$passkeyTransportEnum_smartCard;
    default:
      return _$passkeyTransportEnum_smartCard;
  }
}

final BuiltSet<PasskeyTransportEnum> _$passkeyTransportEnumValues =
    new BuiltSet<PasskeyTransportEnum>(const <PasskeyTransportEnum>[
  _$passkeyTransportEnum_usb,
  _$passkeyTransportEnum_nfc,
  _$passkeyTransportEnum_ble,
  _$passkeyTransportEnum_internal,
  _$passkeyTransportEnum_hybrid,
  _$passkeyTransportEnum_smartCard,
]);

const PasskeyStatusEnum _$passkeyStatusEnum_pending =
    const PasskeyStatusEnum._('pending');
const PasskeyStatusEnum _$passkeyStatusEnum_active =
    const PasskeyStatusEnum._('active');

PasskeyStatusEnum _$passkeyStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$passkeyStatusEnum_pending;
    case 'active':
      return _$passkeyStatusEnum_active;
    default:
      return _$passkeyStatusEnum_active;
  }
}

final BuiltSet<PasskeyStatusEnum> _$passkeyStatusEnumValues =
    new BuiltSet<PasskeyStatusEnum>(const <PasskeyStatusEnum>[
  _$passkeyStatusEnum_pending,
  _$passkeyStatusEnum_active,
]);

Serializer<PasskeyTransportEnum> _$passkeyTransportEnumSerializer =
    new _$PasskeyTransportEnumSerializer();
Serializer<PasskeyStatusEnum> _$passkeyStatusEnumSerializer =
    new _$PasskeyStatusEnumSerializer();

class _$PasskeyTransportEnumSerializer
    implements PrimitiveSerializer<PasskeyTransportEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'usb': 'usb',
    'nfc': 'nfc',
    'ble': 'ble',
    'internal': 'internal',
    'hybrid': 'hybrid',
    'smartCard': 'smart-card',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'usb': 'usb',
    'nfc': 'nfc',
    'ble': 'ble',
    'internal': 'internal',
    'hybrid': 'hybrid',
    'smart-card': 'smartCard',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyTransportEnum];
  @override
  final String wireName = 'PasskeyTransportEnum';

  @override
  Object serialize(Serializers serializers, PasskeyTransportEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyTransportEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyTransportEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PasskeyStatusEnumSerializer
    implements PrimitiveSerializer<PasskeyStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'active': 'active',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'active': 'active',
  };

  @override
  final Iterable<Type> types = const <Type>[PasskeyStatusEnum];
  @override
  final String wireName = 'PasskeyStatusEnum';

  @override
  Object serialize(Serializers serializers, PasskeyStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PasskeyStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PasskeyStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Passkey extends Passkey {
  @override
  final String id;
  @override
  final String credentialID;
  @override
  final String attestationType;
  @override
  final BuiltList<PasskeyTransportEnum> transport;
  @override
  final bool backupEligible;
  @override
  final bool backupState;
  @override
  final String authenticatorAAGUID;
  @override
  final String sourceOS;
  @override
  final String sourceBrowser;
  @override
  final String lastUsed;
  @override
  final String created;
  @override
  final PasskeyStatusEnum status;

  factory _$Passkey([void Function(PasskeyBuilder)? updates]) =>
      (new PasskeyBuilder()..update(updates))._build();

  _$Passkey._(
      {required this.id,
      required this.credentialID,
      required this.attestationType,
      required this.transport,
      required this.backupEligible,
      required this.backupState,
      required this.authenticatorAAGUID,
      required this.sourceOS,
      required this.sourceBrowser,
      required this.lastUsed,
      required this.created,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Passkey', 'id');
    BuiltValueNullFieldError.checkNotNull(
        credentialID, r'Passkey', 'credentialID');
    BuiltValueNullFieldError.checkNotNull(
        attestationType, r'Passkey', 'attestationType');
    BuiltValueNullFieldError.checkNotNull(transport, r'Passkey', 'transport');
    BuiltValueNullFieldError.checkNotNull(
        backupEligible, r'Passkey', 'backupEligible');
    BuiltValueNullFieldError.checkNotNull(
        backupState, r'Passkey', 'backupState');
    BuiltValueNullFieldError.checkNotNull(
        authenticatorAAGUID, r'Passkey', 'authenticatorAAGUID');
    BuiltValueNullFieldError.checkNotNull(sourceOS, r'Passkey', 'sourceOS');
    BuiltValueNullFieldError.checkNotNull(
        sourceBrowser, r'Passkey', 'sourceBrowser');
    BuiltValueNullFieldError.checkNotNull(lastUsed, r'Passkey', 'lastUsed');
    BuiltValueNullFieldError.checkNotNull(created, r'Passkey', 'created');
    BuiltValueNullFieldError.checkNotNull(status, r'Passkey', 'status');
  }

  @override
  Passkey rebuild(void Function(PasskeyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyBuilder toBuilder() => new PasskeyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Passkey &&
        id == other.id &&
        credentialID == other.credentialID &&
        attestationType == other.attestationType &&
        transport == other.transport &&
        backupEligible == other.backupEligible &&
        backupState == other.backupState &&
        authenticatorAAGUID == other.authenticatorAAGUID &&
        sourceOS == other.sourceOS &&
        sourceBrowser == other.sourceBrowser &&
        lastUsed == other.lastUsed &&
        created == other.created &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, credentialID.hashCode);
    _$hash = $jc(_$hash, attestationType.hashCode);
    _$hash = $jc(_$hash, transport.hashCode);
    _$hash = $jc(_$hash, backupEligible.hashCode);
    _$hash = $jc(_$hash, backupState.hashCode);
    _$hash = $jc(_$hash, authenticatorAAGUID.hashCode);
    _$hash = $jc(_$hash, sourceOS.hashCode);
    _$hash = $jc(_$hash, sourceBrowser.hashCode);
    _$hash = $jc(_$hash, lastUsed.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Passkey')
          ..add('id', id)
          ..add('credentialID', credentialID)
          ..add('attestationType', attestationType)
          ..add('transport', transport)
          ..add('backupEligible', backupEligible)
          ..add('backupState', backupState)
          ..add('authenticatorAAGUID', authenticatorAAGUID)
          ..add('sourceOS', sourceOS)
          ..add('sourceBrowser', sourceBrowser)
          ..add('lastUsed', lastUsed)
          ..add('created', created)
          ..add('status', status))
        .toString();
  }
}

class PasskeyBuilder implements Builder<Passkey, PasskeyBuilder> {
  _$Passkey? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _credentialID;
  String? get credentialID => _$this._credentialID;
  set credentialID(String? credentialID) => _$this._credentialID = credentialID;

  String? _attestationType;
  String? get attestationType => _$this._attestationType;
  set attestationType(String? attestationType) =>
      _$this._attestationType = attestationType;

  ListBuilder<PasskeyTransportEnum>? _transport;
  ListBuilder<PasskeyTransportEnum> get transport =>
      _$this._transport ??= new ListBuilder<PasskeyTransportEnum>();
  set transport(ListBuilder<PasskeyTransportEnum>? transport) =>
      _$this._transport = transport;

  bool? _backupEligible;
  bool? get backupEligible => _$this._backupEligible;
  set backupEligible(bool? backupEligible) =>
      _$this._backupEligible = backupEligible;

  bool? _backupState;
  bool? get backupState => _$this._backupState;
  set backupState(bool? backupState) => _$this._backupState = backupState;

  String? _authenticatorAAGUID;
  String? get authenticatorAAGUID => _$this._authenticatorAAGUID;
  set authenticatorAAGUID(String? authenticatorAAGUID) =>
      _$this._authenticatorAAGUID = authenticatorAAGUID;

  String? _sourceOS;
  String? get sourceOS => _$this._sourceOS;
  set sourceOS(String? sourceOS) => _$this._sourceOS = sourceOS;

  String? _sourceBrowser;
  String? get sourceBrowser => _$this._sourceBrowser;
  set sourceBrowser(String? sourceBrowser) =>
      _$this._sourceBrowser = sourceBrowser;

  String? _lastUsed;
  String? get lastUsed => _$this._lastUsed;
  set lastUsed(String? lastUsed) => _$this._lastUsed = lastUsed;

  String? _created;
  String? get created => _$this._created;
  set created(String? created) => _$this._created = created;

  PasskeyStatusEnum? _status;
  PasskeyStatusEnum? get status => _$this._status;
  set status(PasskeyStatusEnum? status) => _$this._status = status;

  PasskeyBuilder() {
    Passkey._defaults(this);
  }

  PasskeyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _credentialID = $v.credentialID;
      _attestationType = $v.attestationType;
      _transport = $v.transport.toBuilder();
      _backupEligible = $v.backupEligible;
      _backupState = $v.backupState;
      _authenticatorAAGUID = $v.authenticatorAAGUID;
      _sourceOS = $v.sourceOS;
      _sourceBrowser = $v.sourceBrowser;
      _lastUsed = $v.lastUsed;
      _created = $v.created;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Passkey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Passkey;
  }

  @override
  void update(void Function(PasskeyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Passkey build() => _build();

  _$Passkey _build() {
    _$Passkey _$result;
    try {
      _$result = _$v ??
          new _$Passkey._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Passkey', 'id'),
              credentialID: BuiltValueNullFieldError.checkNotNull(
                  credentialID, r'Passkey', 'credentialID'),
              attestationType: BuiltValueNullFieldError.checkNotNull(
                  attestationType, r'Passkey', 'attestationType'),
              transport: transport.build(),
              backupEligible: BuiltValueNullFieldError.checkNotNull(
                  backupEligible, r'Passkey', 'backupEligible'),
              backupState: BuiltValueNullFieldError.checkNotNull(
                  backupState, r'Passkey', 'backupState'),
              authenticatorAAGUID: BuiltValueNullFieldError.checkNotNull(
                  authenticatorAAGUID, r'Passkey', 'authenticatorAAGUID'),
              sourceOS: BuiltValueNullFieldError.checkNotNull(
                  sourceOS, r'Passkey', 'sourceOS'),
              sourceBrowser: BuiltValueNullFieldError.checkNotNull(
                  sourceBrowser, r'Passkey', 'sourceBrowser'),
              lastUsed: BuiltValueNullFieldError.checkNotNull(
                  lastUsed, r'Passkey', 'lastUsed'),
              created: BuiltValueNullFieldError.checkNotNull(created, r'Passkey', 'created'),
              status: BuiltValueNullFieldError.checkNotNull(status, r'Passkey', 'status'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'transport';
        transport.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Passkey', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
