// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MeRsp extends MeRsp {
  @override
  final String id;
  @override
  final String fullName;
  @override
  final BuiltList<Identifier> identifiers;
  @override
  final BuiltList<SocialAccount> socialAccounts;

  factory _$MeRsp([void Function(MeRspBuilder)? updates]) =>
      (new MeRspBuilder()..update(updates))._build();

  _$MeRsp._(
      {required this.id,
      required this.fullName,
      required this.identifiers,
      required this.socialAccounts})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'MeRsp', 'id');
    BuiltValueNullFieldError.checkNotNull(fullName, r'MeRsp', 'fullName');
    BuiltValueNullFieldError.checkNotNull(identifiers, r'MeRsp', 'identifiers');
    BuiltValueNullFieldError.checkNotNull(
        socialAccounts, r'MeRsp', 'socialAccounts');
  }

  @override
  MeRsp rebuild(void Function(MeRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MeRspBuilder toBuilder() => new MeRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MeRsp &&
        id == other.id &&
        fullName == other.fullName &&
        identifiers == other.identifiers &&
        socialAccounts == other.socialAccounts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, identifiers.hashCode);
    _$hash = $jc(_$hash, socialAccounts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MeRsp')
          ..add('id', id)
          ..add('fullName', fullName)
          ..add('identifiers', identifiers)
          ..add('socialAccounts', socialAccounts))
        .toString();
  }
}

class MeRspBuilder implements Builder<MeRsp, MeRspBuilder> {
  _$MeRsp? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  ListBuilder<Identifier>? _identifiers;
  ListBuilder<Identifier> get identifiers =>
      _$this._identifiers ??= new ListBuilder<Identifier>();
  set identifiers(ListBuilder<Identifier>? identifiers) =>
      _$this._identifiers = identifiers;

  ListBuilder<SocialAccount>? _socialAccounts;
  ListBuilder<SocialAccount> get socialAccounts =>
      _$this._socialAccounts ??= new ListBuilder<SocialAccount>();
  set socialAccounts(ListBuilder<SocialAccount>? socialAccounts) =>
      _$this._socialAccounts = socialAccounts;

  MeRspBuilder() {
    MeRsp._defaults(this);
  }

  MeRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _fullName = $v.fullName;
      _identifiers = $v.identifiers.toBuilder();
      _socialAccounts = $v.socialAccounts.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MeRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MeRsp;
  }

  @override
  void update(void Function(MeRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MeRsp build() => _build();

  _$MeRsp _build() {
    _$MeRsp _$result;
    try {
      _$result = _$v ??
          new _$MeRsp._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'MeRsp', 'id'),
              fullName: BuiltValueNullFieldError.checkNotNull(
                  fullName, r'MeRsp', 'fullName'),
              identifiers: identifiers.build(),
              socialAccounts: socialAccounts.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'identifiers';
        identifiers.build();
        _$failedField = 'socialAccounts';
        socialAccounts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MeRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
