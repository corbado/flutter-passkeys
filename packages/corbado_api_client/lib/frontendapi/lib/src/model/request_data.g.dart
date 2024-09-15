// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RequestData extends RequestData {
  @override
  final String requestID;
  @override
  final String link;

  factory _$RequestData([void Function(RequestDataBuilder)? updates]) =>
      (new RequestDataBuilder()..update(updates))._build();

  _$RequestData._({required this.requestID, required this.link}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        requestID, r'RequestData', 'requestID');
    BuiltValueNullFieldError.checkNotNull(link, r'RequestData', 'link');
  }

  @override
  RequestData rebuild(void Function(RequestDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestDataBuilder toBuilder() => new RequestDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestData &&
        requestID == other.requestID &&
        link == other.link;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, requestID.hashCode);
    _$hash = $jc(_$hash, link.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestData')
          ..add('requestID', requestID)
          ..add('link', link))
        .toString();
  }
}

class RequestDataBuilder implements Builder<RequestData, RequestDataBuilder> {
  _$RequestData? _$v;

  String? _requestID;
  String? get requestID => _$this._requestID;
  set requestID(String? requestID) => _$this._requestID = requestID;

  String? _link;
  String? get link => _$this._link;
  set link(String? link) => _$this._link = link;

  RequestDataBuilder() {
    RequestData._defaults(this);
  }

  RequestDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _requestID = $v.requestID;
      _link = $v.link;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestData;
  }

  @override
  void update(void Function(RequestDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestData build() => _build();

  _$RequestData _build() {
    final _$result = _$v ??
        new _$RequestData._(
            requestID: BuiltValueNullFieldError.checkNotNull(
                requestID, r'RequestData', 'requestID'),
            link: BuiltValueNullFieldError.checkNotNull(
                link, r'RequestData', 'link'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
