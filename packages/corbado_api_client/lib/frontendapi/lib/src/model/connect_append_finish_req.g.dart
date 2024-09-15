// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_append_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectAppendFinishReq extends ConnectAppendFinishReq {
  @override
  final String attestationResponse;

  factory _$ConnectAppendFinishReq(
          [void Function(ConnectAppendFinishReqBuilder)? updates]) =>
      (new ConnectAppendFinishReqBuilder()..update(updates))._build();

  _$ConnectAppendFinishReq._({required this.attestationResponse}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        attestationResponse, r'ConnectAppendFinishReq', 'attestationResponse');
  }

  @override
  ConnectAppendFinishReq rebuild(
          void Function(ConnectAppendFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectAppendFinishReqBuilder toBuilder() =>
      new ConnectAppendFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectAppendFinishReq &&
        attestationResponse == other.attestationResponse;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attestationResponse.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectAppendFinishReq')
          ..add('attestationResponse', attestationResponse))
        .toString();
  }
}

class ConnectAppendFinishReqBuilder
    implements Builder<ConnectAppendFinishReq, ConnectAppendFinishReqBuilder> {
  _$ConnectAppendFinishReq? _$v;

  String? _attestationResponse;
  String? get attestationResponse => _$this._attestationResponse;
  set attestationResponse(String? attestationResponse) =>
      _$this._attestationResponse = attestationResponse;

  ConnectAppendFinishReqBuilder() {
    ConnectAppendFinishReq._defaults(this);
  }

  ConnectAppendFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attestationResponse = $v.attestationResponse;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectAppendFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectAppendFinishReq;
  }

  @override
  void update(void Function(ConnectAppendFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectAppendFinishReq build() => _build();

  _$ConnectAppendFinishReq _build() {
    final _$result = _$v ??
        new _$ConnectAppendFinishReq._(
            attestationResponse: BuiltValueNullFieldError.checkNotNull(
                attestationResponse,
                r'ConnectAppendFinishReq',
                'attestationResponse'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
