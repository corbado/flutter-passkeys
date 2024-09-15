// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_static_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessStaticInfo extends ProcessStaticInfo {
  @override
  final String token;
  @override
  final int expiresAt;

  factory _$ProcessStaticInfo(
          [void Function(ProcessStaticInfoBuilder)? updates]) =>
      (new ProcessStaticInfoBuilder()..update(updates))._build();

  _$ProcessStaticInfo._({required this.token, required this.expiresAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(token, r'ProcessStaticInfo', 'token');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'ProcessStaticInfo', 'expiresAt');
  }

  @override
  ProcessStaticInfo rebuild(void Function(ProcessStaticInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessStaticInfoBuilder toBuilder() =>
      new ProcessStaticInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessStaticInfo &&
        token == other.token &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessStaticInfo')
          ..add('token', token)
          ..add('expiresAt', expiresAt))
        .toString();
  }
}

class ProcessStaticInfoBuilder
    implements Builder<ProcessStaticInfo, ProcessStaticInfoBuilder> {
  _$ProcessStaticInfo? _$v;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  int? _expiresAt;
  int? get expiresAt => _$this._expiresAt;
  set expiresAt(int? expiresAt) => _$this._expiresAt = expiresAt;

  ProcessStaticInfoBuilder() {
    ProcessStaticInfo._defaults(this);
  }

  ProcessStaticInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _token = $v.token;
      _expiresAt = $v.expiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessStaticInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcessStaticInfo;
  }

  @override
  void update(void Function(ProcessStaticInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessStaticInfo build() => _build();

  _$ProcessStaticInfo _build() {
    final _$result = _$v ??
        new _$ProcessStaticInfo._(
            token: BuiltValueNullFieldError.checkNotNull(
                token, r'ProcessStaticInfo', 'token'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'ProcessStaticInfo', 'expiresAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
