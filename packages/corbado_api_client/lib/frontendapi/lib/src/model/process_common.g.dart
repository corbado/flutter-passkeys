// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_common.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessCommon extends ProcessCommon {
  @override
  final String appName;
  @override
  final String frontendApiUrl;
  @override
  final bool hideBadge;
  @override
  final String environment;

  factory _$ProcessCommon([void Function(ProcessCommonBuilder)? updates]) =>
      (new ProcessCommonBuilder()..update(updates))._build();

  _$ProcessCommon._(
      {required this.appName,
      required this.frontendApiUrl,
      required this.hideBadge,
      required this.environment})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(appName, r'ProcessCommon', 'appName');
    BuiltValueNullFieldError.checkNotNull(
        frontendApiUrl, r'ProcessCommon', 'frontendApiUrl');
    BuiltValueNullFieldError.checkNotNull(
        hideBadge, r'ProcessCommon', 'hideBadge');
    BuiltValueNullFieldError.checkNotNull(
        environment, r'ProcessCommon', 'environment');
  }

  @override
  ProcessCommon rebuild(void Function(ProcessCommonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessCommonBuilder toBuilder() => new ProcessCommonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessCommon &&
        appName == other.appName &&
        frontendApiUrl == other.frontendApiUrl &&
        hideBadge == other.hideBadge;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, appName.hashCode);
    _$hash = $jc(_$hash, frontendApiUrl.hashCode);
    _$hash = $jc(_$hash, hideBadge.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessCommon')
          ..add('appName', appName)
          ..add('frontendApiUrl', frontendApiUrl)
          ..add('hideBadge', hideBadge))
        .toString();
  }
}

class ProcessCommonBuilder
    implements Builder<ProcessCommon, ProcessCommonBuilder> {
  _$ProcessCommon? _$v;

  String? _appName;
  String? get appName => _$this._appName;
  set appName(String? appName) => _$this._appName = appName;

  String? _frontendApiUrl;
  String? get frontendApiUrl => _$this._frontendApiUrl;
  set frontendApiUrl(String? frontendApiUrl) =>
      _$this._frontendApiUrl = frontendApiUrl;

  bool? _hideBadge;
  bool? get hideBadge => _$this._hideBadge;
  set hideBadge(bool? hideBadge) => _$this._hideBadge = hideBadge;

  String? _environment;
  String? get environment => _$this._environment;
  set environment(String? environment) =>
      _$this._environment = environment;

  ProcessCommonBuilder() {
    ProcessCommon._defaults(this);
  }

  ProcessCommonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _appName = $v.appName;
      _frontendApiUrl = $v.frontendApiUrl;
      _hideBadge = $v.hideBadge;
      _environment = $v.environment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessCommon other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcessCommon;
  }

  @override
  void update(void Function(ProcessCommonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessCommon build() => _build();

  _$ProcessCommon _build() {
    final _$result = _$v ??
        new _$ProcessCommon._(
          appName: BuiltValueNullFieldError.checkNotNull(
              appName, r'ProcessCommon', 'appName'),
          frontendApiUrl: BuiltValueNullFieldError.checkNotNull(
              frontendApiUrl, r'ProcessCommon', 'frontendApiUrl'),
          hideBadge: BuiltValueNullFieldError.checkNotNull(
              hideBadge, r'ProcessCommon', 'hideBadge'),
          environment: BuiltValueNullFieldError.checkNotNull(
              environment, r'ProcessCommon', 'environment'),
        );
    replace(_$result);
    return _$result;
  }

}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
