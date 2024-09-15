// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessInitReq extends ProcessInitReq {
  @override
  final ClientInformation clientInformation;
  @override
  final int? passkeyAppendShown;
  @override
  final bool? optOutOfPasskeyAppendAfterHybrid;
  @override
  final BlockType? preferredBlock;

  factory _$ProcessInitReq([void Function(ProcessInitReqBuilder)? updates]) =>
      (new ProcessInitReqBuilder()..update(updates))._build();

  _$ProcessInitReq._(
      {required this.clientInformation,
      this.passkeyAppendShown,
      this.optOutOfPasskeyAppendAfterHybrid,
      this.preferredBlock})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'ProcessInitReq', 'clientInformation');
  }

  @override
  ProcessInitReq rebuild(void Function(ProcessInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessInitReqBuilder toBuilder() =>
      new ProcessInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessInitReq &&
        clientInformation == other.clientInformation &&
        passkeyAppendShown == other.passkeyAppendShown &&
        optOutOfPasskeyAppendAfterHybrid ==
            other.optOutOfPasskeyAppendAfterHybrid &&
        preferredBlock == other.preferredBlock;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jc(_$hash, passkeyAppendShown.hashCode);
    _$hash = $jc(_$hash, optOutOfPasskeyAppendAfterHybrid.hashCode);
    _$hash = $jc(_$hash, preferredBlock.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessInitReq')
          ..add('clientInformation', clientInformation)
          ..add('passkeyAppendShown', passkeyAppendShown)
          ..add('optOutOfPasskeyAppendAfterHybrid',
              optOutOfPasskeyAppendAfterHybrid)
          ..add('preferredBlock', preferredBlock))
        .toString();
  }
}

class ProcessInitReqBuilder
    implements Builder<ProcessInitReq, ProcessInitReqBuilder> {
  _$ProcessInitReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  int? _passkeyAppendShown;
  int? get passkeyAppendShown => _$this._passkeyAppendShown;
  set passkeyAppendShown(int? passkeyAppendShown) =>
      _$this._passkeyAppendShown = passkeyAppendShown;

  bool? _optOutOfPasskeyAppendAfterHybrid;
  bool? get optOutOfPasskeyAppendAfterHybrid =>
      _$this._optOutOfPasskeyAppendAfterHybrid;
  set optOutOfPasskeyAppendAfterHybrid(
          bool? optOutOfPasskeyAppendAfterHybrid) =>
      _$this._optOutOfPasskeyAppendAfterHybrid =
          optOutOfPasskeyAppendAfterHybrid;

  BlockType? _preferredBlock;
  BlockType? get preferredBlock => _$this._preferredBlock;
  set preferredBlock(BlockType? preferredBlock) =>
      _$this._preferredBlock = preferredBlock;

  ProcessInitReqBuilder() {
    ProcessInitReq._defaults(this);
  }

  ProcessInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation.toBuilder();
      _passkeyAppendShown = $v.passkeyAppendShown;
      _optOutOfPasskeyAppendAfterHybrid = $v.optOutOfPasskeyAppendAfterHybrid;
      _preferredBlock = $v.preferredBlock;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcessInitReq;
  }

  @override
  void update(void Function(ProcessInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessInitReq build() => _build();

  _$ProcessInitReq _build() {
    _$ProcessInitReq _$result;
    try {
      _$result = _$v ??
          new _$ProcessInitReq._(
              clientInformation: clientInformation.build(),
              passkeyAppendShown: passkeyAppendShown,
              optOutOfPasskeyAppendAfterHybrid:
                  optOutOfPasskeyAppendAfterHybrid,
              preferredBlock: preferredBlock);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProcessInitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
