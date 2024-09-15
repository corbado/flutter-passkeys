// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_start_rsp.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectLoginStartRsp extends ConnectLoginStartRsp {
  @override
  final String assertionOptions;
  @override
  final bool isCDA;

  factory _$ConnectLoginStartRsp(
          [void Function(ConnectLoginStartRspBuilder)? updates]) =>
      (new ConnectLoginStartRspBuilder()..update(updates))._build();

  _$ConnectLoginStartRsp._(
      {required this.assertionOptions, required this.isCDA})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        assertionOptions, r'ConnectLoginStartRsp', 'assertionOptions');
    BuiltValueNullFieldError.checkNotNull(
        isCDA, r'ConnectLoginStartRsp', 'isCDA');
  }

  @override
  ConnectLoginStartRsp rebuild(
          void Function(ConnectLoginStartRspBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginStartRspBuilder toBuilder() =>
      new ConnectLoginStartRspBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginStartRsp &&
        assertionOptions == other.assertionOptions &&
        isCDA == other.isCDA;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assertionOptions.hashCode);
    _$hash = $jc(_$hash, isCDA.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginStartRsp')
          ..add('assertionOptions', assertionOptions)
          ..add('isCDA', isCDA))
        .toString();
  }
}

class ConnectLoginStartRspBuilder
    implements Builder<ConnectLoginStartRsp, ConnectLoginStartRspBuilder> {
  _$ConnectLoginStartRsp? _$v;

  String? _assertionOptions;
  String? get assertionOptions => _$this._assertionOptions;
  set assertionOptions(String? assertionOptions) =>
      _$this._assertionOptions = assertionOptions;

  bool? _isCDA;
  bool? get isCDA => _$this._isCDA;
  set isCDA(bool? isCDA) => _$this._isCDA = isCDA;

  ConnectLoginStartRspBuilder() {
    ConnectLoginStartRsp._defaults(this);
  }

  ConnectLoginStartRspBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assertionOptions = $v.assertionOptions;
      _isCDA = $v.isCDA;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginStartRsp other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginStartRsp;
  }

  @override
  void update(void Function(ConnectLoginStartRspBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginStartRsp build() => _build();

  _$ConnectLoginStartRsp _build() {
    final _$result = _$v ??
        new _$ConnectLoginStartRsp._(
            assertionOptions: BuiltValueNullFieldError.checkNotNull(
                assertionOptions, r'ConnectLoginStartRsp', 'assertionOptions'),
            isCDA: BuiltValueNullFieldError.checkNotNull(
                isCDA, r'ConnectLoginStartRsp', 'isCDA'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
