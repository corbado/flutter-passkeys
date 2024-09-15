// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_identifier_verify_start_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeIdentifierVerifyStartReq extends MeIdentifierVerifyStartReq {
  @override
  final String identifierID;
  @override
  final ClientInformation clientInformation;

  factory _$MeIdentifierVerifyStartReq(
          [void Function(MeIdentifierVerifyStartReqBuilder)? updates]) =>
      (new MeIdentifierVerifyStartReqBuilder()..update(updates))._build();

  _$MeIdentifierVerifyStartReq._(
      {required this.identifierID, required this.clientInformation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        identifierID, r'MeIdentifierVerifyStartReq', 'identifierID');
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'MeIdentifierVerifyStartReq', 'clientInformation');
  }

  @override
  MeIdentifierVerifyStartReq rebuild(
          void Function(MeIdentifierVerifyStartReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeIdentifierVerifyStartReqBuilder toBuilder() =>
      new MeIdentifierVerifyStartReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeIdentifierVerifyStartReq &&
        identifierID == other.identifierID &&
        clientInformation == other.clientInformation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, identifierID.hashCode);
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeIdentifierVerifyStartReq')
          ..add('identifierID', identifierID)
          ..add('clientInformation', clientInformation))
        .toString();
  }
}

class MeIdentifierVerifyStartReqBuilder
    implements
        Builder<MeIdentifierVerifyStartReq, MeIdentifierVerifyStartReqBuilder> {
  _$MeIdentifierVerifyStartReq? _$v;

  String? _identifierID;
  String? get identifierID => _$this._identifierID;
  set identifierID(String? identifierID) => _$this._identifierID = identifierID;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MeIdentifierVerifyStartReqBuilder() {
    MeIdentifierVerifyStartReq._defaults(this);
  }

  MeIdentifierVerifyStartReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifierID = $v.identifierID;
      _clientInformation = $v.clientInformation.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeIdentifierVerifyStartReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeIdentifierVerifyStartReq;
  }

  @override
  void update(void Function(MeIdentifierVerifyStartReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeIdentifierVerifyStartReq build() => _build();

  _$MeIdentifierVerifyStartReq _build() {
    _$MeIdentifierVerifyStartReq _$result;
    try {
      _$result = _$v ??
          new _$MeIdentifierVerifyStartReq._(
              identifierID: BuiltValueNullFieldError.checkNotNull(
                  identifierID, r'MeIdentifierVerifyStartReq', 'identifierID'),
              clientInformation: clientInformation.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MeIdentifierVerifyStartReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
