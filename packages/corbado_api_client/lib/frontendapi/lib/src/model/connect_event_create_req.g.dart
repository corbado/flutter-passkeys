// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_event_create_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectEventCreateReq extends ConnectEventCreateReq {
  @override
  final PasskeyEventType eventType;

  factory _$ConnectEventCreateReq(
          [void Function(ConnectEventCreateReqBuilder)? updates]) =>
      (new ConnectEventCreateReqBuilder()..update(updates))._build();

  _$ConnectEventCreateReq._({required this.eventType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        eventType, r'ConnectEventCreateReq', 'eventType');
  }

  @override
  ConnectEventCreateReq rebuild(
          void Function(ConnectEventCreateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectEventCreateReqBuilder toBuilder() =>
      new ConnectEventCreateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectEventCreateReq && eventType == other.eventType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, eventType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectEventCreateReq')
          ..add('eventType', eventType))
        .toString();
  }
}

class ConnectEventCreateReqBuilder
    implements Builder<ConnectEventCreateReq, ConnectEventCreateReqBuilder> {
  _$ConnectEventCreateReq? _$v;

  PasskeyEventType? _eventType;
  PasskeyEventType? get eventType => _$this._eventType;
  set eventType(PasskeyEventType? eventType) => _$this._eventType = eventType;

  ConnectEventCreateReqBuilder() {
    ConnectEventCreateReq._defaults(this);
  }

  ConnectEventCreateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventType = $v.eventType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectEventCreateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectEventCreateReq;
  }

  @override
  void update(void Function(ConnectEventCreateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectEventCreateReq build() => _build();

  _$ConnectEventCreateReq _build() {
    final _$result = _$v ??
        new _$ConnectEventCreateReq._(
            eventType: BuiltValueNullFieldError.checkNotNull(
                eventType, r'ConnectEventCreateReq', 'eventType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
