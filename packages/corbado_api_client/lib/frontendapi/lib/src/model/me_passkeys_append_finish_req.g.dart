// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_passkeys_append_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MePasskeysAppendFinishReq extends MePasskeysAppendFinishReq {
  @override
  final String attestationResponse;
  @override
  final ClientInformation clientInformation;

  factory _$MePasskeysAppendFinishReq(
          [void Function(MePasskeysAppendFinishReqBuilder)? updates]) =>
      (new MePasskeysAppendFinishReqBuilder()..update(updates))._build();

  _$MePasskeysAppendFinishReq._(
      {required this.attestationResponse, required this.clientInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(attestationResponse,
        r'MePasskeysAppendFinishReq', 'attestationResponse');
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'MePasskeysAppendFinishReq', 'clientInformation');
  }

  @override
  MePasskeysAppendFinishReq rebuild(
          void Function(MePasskeysAppendFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MePasskeysAppendFinishReqBuilder toBuilder() =>
      new MePasskeysAppendFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MePasskeysAppendFinishReq &&
        attestationResponse == other.attestationResponse &&
        clientInformation == other.clientInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, attestationResponse.hashCode);
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MePasskeysAppendFinishReq')
          ..add('attestationResponse', attestationResponse)
          ..add('clientInformation', clientInformation))
        .toString();
  }
}

class MePasskeysAppendFinishReqBuilder
    implements
        Builder<MePasskeysAppendFinishReq, MePasskeysAppendFinishReqBuilder> {
  _$MePasskeysAppendFinishReq? _$v;

  String? _attestationResponse;
  String? get attestationResponse => _$this._attestationResponse;
  set attestationResponse(String? attestationResponse) =>
      _$this._attestationResponse = attestationResponse;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MePasskeysAppendFinishReqBuilder() {
    MePasskeysAppendFinishReq._defaults(this);
  }

  MePasskeysAppendFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _attestationResponse = $v.attestationResponse;
      _clientInformation = $v.clientInformation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MePasskeysAppendFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MePasskeysAppendFinishReq;
  }

  @override
  void update(void Function(MePasskeysAppendFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MePasskeysAppendFinishReq build() => _build();

  _$MePasskeysAppendFinishReq _build() {
    _$MePasskeysAppendFinishReq _$result;
    try {
      _$result = _$v ??
          new _$MePasskeysAppendFinishReq._(
              attestationResponse: BuiltValueNullFieldError.checkNotNull(
                  attestationResponse,
                  r'MePasskeysAppendFinishReq',
                  'attestationResponse'),
              clientInformation: clientInformation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MePasskeysAppendFinishReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
