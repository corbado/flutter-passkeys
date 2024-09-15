// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_post_signup_email_verify.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockPostSignupEmailVerify
    extends GeneralBlockPostSignupEmailVerify {
  @override
  final String blockType;
  @override
  final RequestError? error;

  factory _$GeneralBlockPostSignupEmailVerify(
          [void Function(GeneralBlockPostSignupEmailVerifyBuilder)? updates]) =>
      (new GeneralBlockPostSignupEmailVerifyBuilder()..update(updates))
          ._build();

  _$GeneralBlockPostSignupEmailVerify._({required this.blockType, this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockPostSignupEmailVerify', 'blockType');
  }

  @override
  GeneralBlockPostSignupEmailVerify rebuild(
          void Function(GeneralBlockPostSignupEmailVerifyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockPostSignupEmailVerifyBuilder toBuilder() =>
      new GeneralBlockPostSignupEmailVerifyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockPostSignupEmailVerify &&
        blockType == other.blockType &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockPostSignupEmailVerify')
          ..add('blockType', blockType)
          ..add('error', error))
        .toString();
  }
}

class GeneralBlockPostSignupEmailVerifyBuilder
    implements
        Builder<GeneralBlockPostSignupEmailVerify,
            GeneralBlockPostSignupEmailVerifyBuilder> {
  _$GeneralBlockPostSignupEmailVerify? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  GeneralBlockPostSignupEmailVerifyBuilder() {
    GeneralBlockPostSignupEmailVerify._defaults(this);
  }

  GeneralBlockPostSignupEmailVerifyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockPostSignupEmailVerify other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockPostSignupEmailVerify;
  }

  @override
  void update(
      void Function(GeneralBlockPostSignupEmailVerifyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockPostSignupEmailVerify build() => _build();

  _$GeneralBlockPostSignupEmailVerify _build() {
    _$GeneralBlockPostSignupEmailVerify _$result;
    try {
      _$result = _$v ??
          new _$GeneralBlockPostSignupEmailVerify._(
              blockType: BuiltValueNullFieldError.checkNotNull(
                  blockType, r'GeneralBlockPostSignupEmailVerify', 'blockType'),
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneralBlockPostSignupEmailVerify', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
