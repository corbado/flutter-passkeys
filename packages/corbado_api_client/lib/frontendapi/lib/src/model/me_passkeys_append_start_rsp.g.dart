// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_passkeys_append_start_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MePasskeysAppendStartRspAppendNotAllowedReasonEnum
    _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeyAlreadyExists =
    const MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(
        'passkeyAlreadyExists');
const MePasskeysAppendStartRspAppendNotAllowedReasonEnum
    _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeysNotSupported =
    const MePasskeysAppendStartRspAppendNotAllowedReasonEnum._(
        'passkeysNotSupported');

MePasskeysAppendStartRspAppendNotAllowedReasonEnum
    _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumValueOf(String name) {
  switch (name) {
    case 'passkeyAlreadyExists':
      return _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeyAlreadyExists;
    case 'passkeysNotSupported':
      return _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeysNotSupported;
    default:
      return _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeysNotSupported;
  }
}

final BuiltSet<MePasskeysAppendStartRspAppendNotAllowedReasonEnum>
    _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumValues = new BuiltSet<
        MePasskeysAppendStartRspAppendNotAllowedReasonEnum>(const <MePasskeysAppendStartRspAppendNotAllowedReasonEnum>[
  _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeyAlreadyExists,
  _$mePasskeysAppendStartRspAppendNotAllowedReasonEnum_passkeysNotSupported,
]);

Serializer<MePasskeysAppendStartRspAppendNotAllowedReasonEnum>
    _$mePasskeysAppendStartRspAppendNotAllowedReasonEnumSerializer =
    new _$MePasskeysAppendStartRspAppendNotAllowedReasonEnumSerializer();

class _$MePasskeysAppendStartRspAppendNotAllowedReasonEnumSerializer
    implements
        PrimitiveSerializer<
            MePasskeysAppendStartRspAppendNotAllowedReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'passkeyAlreadyExists': 'passkey_already_exists',
    'passkeysNotSupported': 'passkeys_not_supported',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'passkey_already_exists': 'passkeyAlreadyExists',
    'passkeys_not_supported': 'passkeysNotSupported',
  };

  @override
  final Iterable<Type> types = const <Type>[
    MePasskeysAppendStartRspAppendNotAllowedReasonEnum
  ];
  @override
  final String wireName = 'MePasskeysAppendStartRspAppendNotAllowedReasonEnum';

  @override
  Object serialize(Serializers serializers,
          MePasskeysAppendStartRspAppendNotAllowedReasonEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  MePasskeysAppendStartRspAppendNotAllowedReasonEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MePasskeysAppendStartRspAppendNotAllowedReasonEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$MePasskeysAppendStartRsp extends MePasskeysAppendStartRsp {
  @override
  final String attestationOptions;
  @override
  final String? newClientEnvHandle;
  @override
  final MePasskeysAppendStartRspAppendNotAllowedReasonEnum?
      appendNotAllowedReason;

  factory _$MePasskeysAppendStartRsp(
          [void Function(MePasskeysAppendStartRspBuilder)? updates]) =>
      (new MePasskeysAppendStartRspBuilder()..update(updates))._build();

  _$MePasskeysAppendStartRsp._(
      {required this.attestationOptions,
      this.newClientEnvHandle,
      this.appendNotAllowedReason})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        attestationOptions, r'MePasskeysAppendStartRsp', 'attestationOptions');
  }

  @override
  MePasskeysAppendStartRsp rebuild(
          void Function(MePasskeysAppendStartRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MePasskeysAppendStartRspBuilder toBuilder() =>
      new MePasskeysAppendStartRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MePasskeysAppendStartRsp &&
        attestationOptions == other.attestationOptions &&
        newClientEnvHandle == other.newClientEnvHandle &&
        appendNotAllowedReason == other.appendNotAllowedReason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attestationOptions.hashCode);
    _$hash = $jc(_$hash, newClientEnvHandle.hashCode);
    _$hash = $jc(_$hash, appendNotAllowedReason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MePasskeysAppendStartRsp')
          ..add('attestationOptions', attestationOptions)
          ..add('newClientEnvHandle', newClientEnvHandle)
          ..add('appendNotAllowedReason', appendNotAllowedReason))
        .toString();
  }
}

class MePasskeysAppendStartRspBuilder
    implements
        Builder<MePasskeysAppendStartRsp, MePasskeysAppendStartRspBuilder> {
  _$MePasskeysAppendStartRsp? _$v;

  String? _attestationOptions;
  String? get attestationOptions => _$this._attestationOptions;
  set attestationOptions(String? attestationOptions) =>
      _$this._attestationOptions = attestationOptions;

  String? _newClientEnvHandle;
  String? get newClientEnvHandle => _$this._newClientEnvHandle;
  set newClientEnvHandle(String? newClientEnvHandle) =>
      _$this._newClientEnvHandle = newClientEnvHandle;

  MePasskeysAppendStartRspAppendNotAllowedReasonEnum? _appendNotAllowedReason;
  MePasskeysAppendStartRspAppendNotAllowedReasonEnum?
      get appendNotAllowedReason => _$this._appendNotAllowedReason;
  set appendNotAllowedReason(
          MePasskeysAppendStartRspAppendNotAllowedReasonEnum?
              appendNotAllowedReason) =>
      _$this._appendNotAllowedReason = appendNotAllowedReason;

  MePasskeysAppendStartRspBuilder() {
    MePasskeysAppendStartRsp._defaults(this);
  }

  MePasskeysAppendStartRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attestationOptions = $v.attestationOptions;
      _newClientEnvHandle = $v.newClientEnvHandle;
      _appendNotAllowedReason = $v.appendNotAllowedReason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MePasskeysAppendStartRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MePasskeysAppendStartRsp;
  }

  @override
  void update(void Function(MePasskeysAppendStartRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MePasskeysAppendStartRsp build() => _build();

  _$MePasskeysAppendStartRsp _build() {
    final _$result = _$v ??
        new _$MePasskeysAppendStartRsp._(
            attestationOptions: BuiltValueNullFieldError.checkNotNull(
                attestationOptions,
                r'MePasskeysAppendStartRsp',
                'attestationOptions'),
            newClientEnvHandle: newClientEnvHandle,
            appendNotAllowedReason: appendNotAllowedReason);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
