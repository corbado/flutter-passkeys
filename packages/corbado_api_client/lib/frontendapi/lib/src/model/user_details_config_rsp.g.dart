// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_config_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserDetailsConfigRsp extends UserDetailsConfigRsp {
  @override
  final bool fullNameRequired;
  @override
  final BuiltList<LoginIdentifierConfig> identifiers;

  factory _$UserDetailsConfigRsp(
          [void Function(UserDetailsConfigRspBuilder)? updates]) =>
      (new UserDetailsConfigRspBuilder()..update(updates))._build();

  _$UserDetailsConfigRsp._(
      {required this.fullNameRequired, required this.identifiers})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        fullNameRequired, r'UserDetailsConfigRsp', 'fullNameRequired');
    BuiltValueNullFieldError.checkNotNull(
        identifiers, r'UserDetailsConfigRsp', 'identifiers');
  }

  @override
  UserDetailsConfigRsp rebuild(
          void Function(UserDetailsConfigRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailsConfigRspBuilder toBuilder() =>
      new UserDetailsConfigRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetailsConfigRsp &&
        fullNameRequired == other.fullNameRequired &&
        identifiers == other.identifiers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, fullNameRequired.hashCode);
    _$hash = $jc(_$hash, identifiers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDetailsConfigRsp')
          ..add('fullNameRequired', fullNameRequired)
          ..add('identifiers', identifiers))
        .toString();
  }
}

class UserDetailsConfigRspBuilder
    implements Builder<UserDetailsConfigRsp, UserDetailsConfigRspBuilder> {
  _$UserDetailsConfigRsp? _$v;

  bool? _fullNameRequired;
  bool? get fullNameRequired => _$this._fullNameRequired;
  set fullNameRequired(bool? fullNameRequired) =>
      _$this._fullNameRequired = fullNameRequired;

  ListBuilder<LoginIdentifierConfig>? _identifiers;
  ListBuilder<LoginIdentifierConfig> get identifiers =>
      _$this._identifiers ??= new ListBuilder<LoginIdentifierConfig>();
  set identifiers(ListBuilder<LoginIdentifierConfig>? identifiers) =>
      _$this._identifiers = identifiers;

  UserDetailsConfigRspBuilder() {
    UserDetailsConfigRsp._defaults(this);
  }

  UserDetailsConfigRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _fullNameRequired = $v.fullNameRequired;
      _identifiers = $v.identifiers.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetailsConfigRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetailsConfigRsp;
  }

  @override
  void update(void Function(UserDetailsConfigRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDetailsConfigRsp build() => _build();

  _$UserDetailsConfigRsp _build() {
    _$UserDetailsConfigRsp _$result;
    try {
      _$result = _$v ??
          new _$UserDetailsConfigRsp._(
              fullNameRequired: BuiltValueNullFieldError.checkNotNull(
                  fullNameRequired,
                  r'UserDetailsConfigRsp',
                  'fullNameRequired'),
              identifiers: identifiers.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'identifiers';
        identifiers.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserDetailsConfigRsp', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
