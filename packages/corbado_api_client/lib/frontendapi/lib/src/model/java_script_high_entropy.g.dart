// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'java_script_high_entropy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JavaScriptHighEntropy extends JavaScriptHighEntropy {
  @override
  final String platform;
  @override
  final String platformVersion;
  @override
  final bool mobile;

  factory _$JavaScriptHighEntropy(
          [void Function(JavaScriptHighEntropyBuilder)? updates]) =>
      (new JavaScriptHighEntropyBuilder()..update(updates))._build();

  _$JavaScriptHighEntropy._(
      {required this.platform,
      required this.platformVersion,
      required this.mobile})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        platform, r'JavaScriptHighEntropy', 'platform');
    BuiltValueNullFieldError.checkNotNull(
        platformVersion, r'JavaScriptHighEntropy', 'platformVersion');
    BuiltValueNullFieldError.checkNotNull(
        mobile, r'JavaScriptHighEntropy', 'mobile');
  }

  @override
  JavaScriptHighEntropy rebuild(
          void Function(JavaScriptHighEntropyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JavaScriptHighEntropyBuilder toBuilder() =>
      new JavaScriptHighEntropyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JavaScriptHighEntropy &&
        platform == other.platform &&
        platformVersion == other.platformVersion &&
        mobile == other.mobile;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, platformVersion.hashCode);
    _$hash = $jc(_$hash, mobile.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JavaScriptHighEntropy')
          ..add('platform', platform)
          ..add('platformVersion', platformVersion)
          ..add('mobile', mobile))
        .toString();
  }
}

class JavaScriptHighEntropyBuilder
    implements Builder<JavaScriptHighEntropy, JavaScriptHighEntropyBuilder> {
  _$JavaScriptHighEntropy? _$v;

  String? _platform;
  String? get platform => _$this._platform;
  set platform(String? platform) => _$this._platform = platform;

  String? _platformVersion;
  String? get platformVersion => _$this._platformVersion;
  set platformVersion(String? platformVersion) =>
      _$this._platformVersion = platformVersion;

  bool? _mobile;
  bool? get mobile => _$this._mobile;
  set mobile(bool? mobile) => _$this._mobile = mobile;

  JavaScriptHighEntropyBuilder() {
    JavaScriptHighEntropy._defaults(this);
  }

  JavaScriptHighEntropyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _platform = $v.platform;
      _platformVersion = $v.platformVersion;
      _mobile = $v.mobile;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JavaScriptHighEntropy other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$JavaScriptHighEntropy;
  }

  @override
  void update(void Function(JavaScriptHighEntropyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JavaScriptHighEntropy build() => _build();

  _$JavaScriptHighEntropy _build() {
    final _$result = _$v ??
        new _$JavaScriptHighEntropy._(
            platform: BuiltValueNullFieldError.checkNotNull(
                platform, r'JavaScriptHighEntropy', 'platform'),
            platformVersion: BuiltValueNullFieldError.checkNotNull(
                platformVersion, r'JavaScriptHighEntropy', 'platformVersion'),
            mobile: BuiltValueNullFieldError.checkNotNull(
                mobile, r'JavaScriptHighEntropy', 'mobile'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
