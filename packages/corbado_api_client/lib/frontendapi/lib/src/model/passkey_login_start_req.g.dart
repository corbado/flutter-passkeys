// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_login_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PasskeyLoginStartReq extends PasskeyLoginStartReq {
  @override
  final ClientInformation? clientInformation;

  factory _$PasskeyLoginStartReq(
          [void Function(PasskeyLoginStartReqBuilder)? updates]) =>
      (new PasskeyLoginStartReqBuilder()..update(updates))._build();

  _$PasskeyLoginStartReq._({this.clientInformation}) : super._();

  @override
  PasskeyLoginStartReq rebuild(
          void Function(PasskeyLoginStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PasskeyLoginStartReqBuilder toBuilder() =>
      new PasskeyLoginStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PasskeyLoginStartReq &&
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
    return (newBuiltValueToStringHelper(r'PasskeyLoginStartReq')
          ..add('clientInformation', clientInformation))
        .toString();
  }
}

class PasskeyLoginStartReqBuilder
    implements Builder<PasskeyLoginStartReq, PasskeyLoginStartReqBuilder> {
  _$PasskeyLoginStartReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  PasskeyLoginStartReqBuilder() {
    PasskeyLoginStartReq._defaults(this);
  }

  PasskeyLoginStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PasskeyLoginStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PasskeyLoginStartReq;
  }

  @override
  void update(void Function(PasskeyLoginStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PasskeyLoginStartReq build() => _build();

  _$PasskeyLoginStartReq _build() {
    _$PasskeyLoginStartReq _$result;
    try {
      _$result = _$v ??
          new _$PasskeyLoginStartReq._(
              clientInformation: _clientInformation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        _clientInformation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PasskeyLoginStartReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
