// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_append_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasskeyAppendStartReq extends PasskeyAppendStartReq {
  @override
  final ClientInformation? clientInformation;

  factory _$PasskeyAppendStartReq(
          [void Function(PasskeyAppendStartReqBuilder)? updates]) =>
      (new PasskeyAppendStartReqBuilder()..update(updates))._build();

  _$PasskeyAppendStartReq._({this.clientInformation}) : super._();

  @override
  PasskeyAppendStartReq rebuild(
          void Function(PasskeyAppendStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyAppendStartReqBuilder toBuilder() =>
      new PasskeyAppendStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyAppendStartReq &&
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
    return (newBuiltValueToStringHelper(r'PasskeyAppendStartReq')
          ..add('clientInformation', clientInformation))
        .toString();
  }
}

class PasskeyAppendStartReqBuilder
    implements Builder<PasskeyAppendStartReq, PasskeyAppendStartReqBuilder> {
  _$PasskeyAppendStartReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  PasskeyAppendStartReqBuilder() {
    PasskeyAppendStartReq._defaults(this);
  }

  PasskeyAppendStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyAppendStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyAppendStartReq;
  }

  @override
  void update(void Function(PasskeyAppendStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyAppendStartReq build() => _build();

  _$PasskeyAppendStartReq _build() {
    _$PasskeyAppendStartReq _$result;
    try {
      _$result = _$v ??
          new _$PasskeyAppendStartReq._(
              clientInformation: _clientInformation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        _clientInformation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PasskeyAppendStartReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
