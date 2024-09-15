// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_passkey_appended.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockPasskeyAppended extends GeneralBlockPasskeyAppended {
  @override
  final String blockType;

  factory _$GeneralBlockPasskeyAppended(
          [void Function(GeneralBlockPasskeyAppendedBuilder)? updates]) =>
      (new GeneralBlockPasskeyAppendedBuilder()..update(updates))._build();

  _$GeneralBlockPasskeyAppended._({required this.blockType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockPasskeyAppended', 'blockType');
  }

  @override
  GeneralBlockPasskeyAppended rebuild(
          void Function(GeneralBlockPasskeyAppendedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockPasskeyAppendedBuilder toBuilder() =>
      new GeneralBlockPasskeyAppendedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockPasskeyAppended && blockType == other.blockType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockPasskeyAppended')
          ..add('blockType', blockType))
        .toString();
  }
}

class GeneralBlockPasskeyAppendedBuilder
    implements
        Builder<GeneralBlockPasskeyAppended,
            GeneralBlockPasskeyAppendedBuilder> {
  _$GeneralBlockPasskeyAppended? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  GeneralBlockPasskeyAppendedBuilder() {
    GeneralBlockPasskeyAppended._defaults(this);
  }

  GeneralBlockPasskeyAppendedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockPasskeyAppended other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockPasskeyAppended;
  }

  @override
  void update(void Function(GeneralBlockPasskeyAppendedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockPasskeyAppended build() => _build();

  _$GeneralBlockPasskeyAppended _build() {
    final _$result = _$v ??
        new _$GeneralBlockPasskeyAppended._(
            blockType: BuiltValueNullFieldError.checkNotNull(
                blockType, r'GeneralBlockPasskeyAppended', 'blockType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
