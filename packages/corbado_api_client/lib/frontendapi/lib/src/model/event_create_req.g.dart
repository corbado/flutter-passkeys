// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_create_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$EventCreateReq extends EventCreateReq {
  @override
  final PasskeyEventType eventType;

  factory _$EventCreateReq([void Function(EventCreateReqBuilder)? updates]) =>
      (new EventCreateReqBuilder()..update(updates))._build();

  _$EventCreateReq._({required this.eventType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        eventType, r'EventCreateReq', 'eventType');
  }

  @override
  EventCreateReq rebuild(void Function(EventCreateReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EventCreateReqBuilder toBuilder() =>
      new EventCreateReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is EventCreateReq && eventType == other.eventType;
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
    return (newBuiltValueToStringHelper(r'EventCreateReq')
          ..add('eventType', eventType))
        .toString();
  }
}

class EventCreateReqBuilder
    implements Builder<EventCreateReq, EventCreateReqBuilder> {
  _$EventCreateReq? _$v;

  PasskeyEventType? _eventType;
  PasskeyEventType? get eventType => _$this._eventType;
  set eventType(PasskeyEventType? eventType) => _$this._eventType = eventType;

  EventCreateReqBuilder() {
    EventCreateReq._defaults(this);
  }

  EventCreateReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventType = $v.eventType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(EventCreateReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$EventCreateReq;
  }

  @override
  void update(void Function(EventCreateReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  EventCreateReq build() => _build();

  _$EventCreateReq _build() {
    final _$result = _$v ??
        new _$EventCreateReq._(
            eventType: BuiltValueNullFieldError.checkNotNull(
                eventType, r'EventCreateReq', 'eventType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
