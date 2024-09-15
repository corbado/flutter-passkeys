// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_passkey_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MePasskeyRsp extends MePasskeyRsp {
  @override
  final BuiltList<Passkey> passkeys;
  @override
  final Paging paging;

  factory _$MePasskeyRsp([void Function(MePasskeyRspBuilder)? updates]) =>
      (new MePasskeyRspBuilder()..update(updates))._build();

  _$MePasskeyRsp._({required this.passkeys, required this.paging}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        passkeys, r'MePasskeyRsp', 'passkeys');
    BuiltValueNullFieldError.checkNotNull(paging, r'MePasskeyRsp', 'paging');
  }

  @override
  MePasskeyRsp rebuild(void Function(MePasskeyRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MePasskeyRspBuilder toBuilder() => new MePasskeyRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MePasskeyRsp &&
        passkeys == other.passkeys &&
        paging == other.paging;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, passkeys.hashCode);
    _$hash = $jc(_$hash, paging.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MePasskeyRsp')
          ..add('passkeys', passkeys)
          ..add('paging', paging))
        .toString();
  }
}

class MePasskeyRspBuilder
    implements Builder<MePasskeyRsp, MePasskeyRspBuilder> {
  _$MePasskeyRsp? _$v;

  ListBuilder<Passkey>? _passkeys;
  ListBuilder<Passkey> get passkeys =>
      _$this._passkeys ??= new ListBuilder<Passkey>();
  set passkeys(ListBuilder<Passkey>? passkeys) => _$this._passkeys = passkeys;

  PagingBuilder? _paging;
  PagingBuilder get paging => _$this._paging ??= new PagingBuilder();
  set paging(PagingBuilder? paging) => _$this._paging = paging;

  MePasskeyRspBuilder() {
    MePasskeyRsp._defaults(this);
  }

  MePasskeyRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _passkeys = $v.passkeys.toBuilder();
      _paging = $v.paging.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MePasskeyRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MePasskeyRsp;
  }

  @override
  void update(void Function(MePasskeyRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MePasskeyRsp build() => _build();

  _$MePasskeyRsp _build() {
    _$MePasskeyRsp _$result;
    try {
      _$result = _$v ??
          new _$MePasskeyRsp._(
              passkeys: passkeys.build(), paging: paging.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeys';
        passkeys.build();
        _$failedField = 'paging';
        paging.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MePasskeyRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
