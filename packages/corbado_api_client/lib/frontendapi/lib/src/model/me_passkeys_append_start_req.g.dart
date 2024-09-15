// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_passkeys_append_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MePasskeysAppendStartReq extends MePasskeysAppendStartReq {
  @override
  final ClientInformation clientInformation;

  factory _$MePasskeysAppendStartReq(
          [void Function(MePasskeysAppendStartReqBuilder)? updates]) =>
      (new MePasskeysAppendStartReqBuilder()..update(updates))._build();

  _$MePasskeysAppendStartReq._({required this.clientInformation}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'MePasskeysAppendStartReq', 'clientInformation');
  }

  @override
  MePasskeysAppendStartReq rebuild(
          void Function(MePasskeysAppendStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MePasskeysAppendStartReqBuilder toBuilder() =>
      new MePasskeysAppendStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MePasskeysAppendStartReq &&
        clientInformation == other.clientInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MePasskeysAppendStartReq')
          ..add('clientInformation', clientInformation))
        .toString();
  }
}

class MePasskeysAppendStartReqBuilder
    implements
        Builder<MePasskeysAppendStartReq, MePasskeysAppendStartReqBuilder> {
  _$MePasskeysAppendStartReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MePasskeysAppendStartReqBuilder() {
    MePasskeysAppendStartReq._defaults(this);
  }

  MePasskeysAppendStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MePasskeysAppendStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MePasskeysAppendStartReq;
  }

  @override
  void update(void Function(MePasskeysAppendStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MePasskeysAppendStartReq build() => _build();

  _$MePasskeysAppendStartReq _build() {
    _$MePasskeysAppendStartReq _$result;
    try {
      _$result = _$v ??
          new _$MePasskeysAppendStartReq._(
              clientInformation: clientInformation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MePasskeysAppendStartReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
