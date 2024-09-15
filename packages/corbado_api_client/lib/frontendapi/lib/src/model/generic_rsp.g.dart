// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenericRsp extends GenericRsp {
  @override
  final int httpStatusCode;
  @override
  final String message;
  @override
  final RequestData requestData;
  @override
  final double runtime;

  factory _$GenericRsp([void Function(GenericRspBuilder)? updates]) =>
      (new GenericRspBuilder()..update(updates))._build();

  _$GenericRsp._(
      {required this.httpStatusCode,
      required this.message,
      required this.requestData,
      required this.runtime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        httpStatusCode, r'GenericRsp', 'httpStatusCode');
    BuiltValueNullFieldError.checkNotNull(message, r'GenericRsp', 'message');
    BuiltValueNullFieldError.checkNotNull(
        requestData, r'GenericRsp', 'requestData');
    BuiltValueNullFieldError.checkNotNull(runtime, r'GenericRsp', 'runtime');
  }

  @override
  GenericRsp rebuild(void Function(GenericRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenericRspBuilder toBuilder() => new GenericRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenericRsp &&
        httpStatusCode == other.httpStatusCode &&
        message == other.message &&
        requestData == other.requestData &&
        runtime == other.runtime;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, httpStatusCode.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, requestData.hashCode);
    _$hash = $jc(_$hash, runtime.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GenericRsp')
          ..add('httpStatusCode', httpStatusCode)
          ..add('message', message)
          ..add('requestData', requestData)
          ..add('runtime', runtime))
        .toString();
  }
}

class GenericRspBuilder implements Builder<GenericRsp, GenericRspBuilder> {
  _$GenericRsp? _$v;

  int? _httpStatusCode;
  int? get httpStatusCode => _$this._httpStatusCode;
  set httpStatusCode(int? httpStatusCode) =>
      _$this._httpStatusCode = httpStatusCode;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  RequestDataBuilder? _requestData;
  RequestDataBuilder get requestData =>
      _$this._requestData ??= new RequestDataBuilder();
  set requestData(RequestDataBuilder? requestData) =>
      _$this._requestData = requestData;

  double? _runtime;
  double? get runtime => _$this._runtime;
  set runtime(double? runtime) => _$this._runtime = runtime;

  GenericRspBuilder() {
    GenericRsp._defaults(this);
  }

  GenericRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _httpStatusCode = $v.httpStatusCode;
      _message = $v.message;
      _requestData = $v.requestData.toBuilder();
      _runtime = $v.runtime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenericRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenericRsp;
  }

  @override
  void update(void Function(GenericRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GenericRsp build() => _build();

  _$GenericRsp _build() {
    _$GenericRsp _$result;
    try {
      _$result = _$v ??
          new _$GenericRsp._(
              httpStatusCode: BuiltValueNullFieldError.checkNotNull(
                  httpStatusCode, r'GenericRsp', 'httpStatusCode'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'GenericRsp', 'message'),
              requestData: requestData.build(),
              runtime: BuiltValueNullFieldError.checkNotNull(
                  runtime, r'GenericRsp', 'runtime'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'requestData';
        requestData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GenericRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
