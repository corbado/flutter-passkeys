// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continue_on_other_device.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ContinueOnOtherDeviceReasonEnum
    _$continueOnOtherDeviceReasonEnum_emailLinkVerified =
    const ContinueOnOtherDeviceReasonEnum._('emailLinkVerified');
const ContinueOnOtherDeviceReasonEnum
    _$continueOnOtherDeviceReasonEnum_processAlreadyCompleted =
    const ContinueOnOtherDeviceReasonEnum._('processAlreadyCompleted');

ContinueOnOtherDeviceReasonEnum _$continueOnOtherDeviceReasonEnumValueOf(
    String name) {
  switch (name) {
    case 'emailLinkVerified':
      return _$continueOnOtherDeviceReasonEnum_emailLinkVerified;
    case 'processAlreadyCompleted':
      return _$continueOnOtherDeviceReasonEnum_processAlreadyCompleted;
    default:
      return _$continueOnOtherDeviceReasonEnum_processAlreadyCompleted;
  }
}

final BuiltSet<ContinueOnOtherDeviceReasonEnum>
    _$continueOnOtherDeviceReasonEnumValues = new BuiltSet<
        ContinueOnOtherDeviceReasonEnum>(const <ContinueOnOtherDeviceReasonEnum>[
  _$continueOnOtherDeviceReasonEnum_emailLinkVerified,
  _$continueOnOtherDeviceReasonEnum_processAlreadyCompleted,
]);

Serializer<ContinueOnOtherDeviceReasonEnum>
    _$continueOnOtherDeviceReasonEnumSerializer =
    new _$ContinueOnOtherDeviceReasonEnumSerializer();

class _$ContinueOnOtherDeviceReasonEnumSerializer
    implements PrimitiveSerializer<ContinueOnOtherDeviceReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'emailLinkVerified': 'email-link-verified',
    'processAlreadyCompleted': 'process-already-completed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'email-link-verified': 'emailLinkVerified',
    'process-already-completed': 'processAlreadyCompleted',
  };

  @override
  final Iterable<Type> types = const <Type>[ContinueOnOtherDeviceReasonEnum];
  @override
  final String wireName = 'ContinueOnOtherDeviceReasonEnum';

  @override
  Object serialize(
          Serializers serializers, ContinueOnOtherDeviceReasonEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ContinueOnOtherDeviceReasonEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ContinueOnOtherDeviceReasonEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ContinueOnOtherDevice extends ContinueOnOtherDevice {
  @override
  final ContinueOnOtherDeviceReasonEnum reason;

  factory _$ContinueOnOtherDevice(
          [void Function(ContinueOnOtherDeviceBuilder)? updates]) =>
      (new ContinueOnOtherDeviceBuilder()..update(updates))._build();

  _$ContinueOnOtherDevice._({required this.reason}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        reason, r'ContinueOnOtherDevice', 'reason');
  }

  @override
  ContinueOnOtherDevice rebuild(
          void Function(ContinueOnOtherDeviceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContinueOnOtherDeviceBuilder toBuilder() =>
      new ContinueOnOtherDeviceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContinueOnOtherDevice && reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContinueOnOtherDevice')
          ..add('reason', reason))
        .toString();
  }
}

class ContinueOnOtherDeviceBuilder
    implements Builder<ContinueOnOtherDevice, ContinueOnOtherDeviceBuilder> {
  _$ContinueOnOtherDevice? _$v;

  ContinueOnOtherDeviceReasonEnum? _reason;
  ContinueOnOtherDeviceReasonEnum? get reason => _$this._reason;
  set reason(ContinueOnOtherDeviceReasonEnum? reason) =>
      _$this._reason = reason;

  ContinueOnOtherDeviceBuilder() {
    ContinueOnOtherDevice._defaults(this);
  }

  ContinueOnOtherDeviceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ContinueOnOtherDevice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContinueOnOtherDevice;
  }

  @override
  void update(void Function(ContinueOnOtherDeviceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContinueOnOtherDevice build() => _build();

  _$ContinueOnOtherDevice _build() {
    final _$result = _$v ??
        new _$ContinueOnOtherDevice._(
            reason: BuiltValueNullFieldError.checkNotNull(
                reason, r'ContinueOnOtherDevice', 'reason'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
