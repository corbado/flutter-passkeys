// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_block_completed.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GeneralBlockCompleted extends GeneralBlockCompleted {
  @override
  final String blockType;
  @override
  final String shortSession;
  @override
  final String? longSession;
  @override
  final PasskeyOperation? passkeyOperation;

  factory _$GeneralBlockCompleted(
          [void Function(GeneralBlockCompletedBuilder)? updates]) =>
      (new GeneralBlockCompletedBuilder()..update(updates))._build();

  _$GeneralBlockCompleted._(
      {required this.blockType,
      required this.shortSession,
      this.longSession,
      this.passkeyOperation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockType, r'GeneralBlockCompleted', 'blockType');
    BuiltValueNullFieldError.checkNotNull(
        shortSession, r'GeneralBlockCompleted', 'shortSession');
  }

  @override
  GeneralBlockCompleted rebuild(
          void Function(GeneralBlockCompletedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GeneralBlockCompletedBuilder toBuilder() =>
      new GeneralBlockCompletedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GeneralBlockCompleted &&
        blockType == other.blockType &&
        shortSession == other.shortSession &&
        longSession == other.longSession &&
        passkeyOperation == other.passkeyOperation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockType.hashCode);
    _$hash = $jc(_$hash, shortSession.hashCode);
    _$hash = $jc(_$hash, longSession.hashCode);
    _$hash = $jc(_$hash, passkeyOperation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GeneralBlockCompleted')
          ..add('blockType', blockType)
          ..add('shortSession', shortSession)
          ..add('longSession', longSession)
          ..add('passkeyOperation', passkeyOperation))
        .toString();
  }
}

class GeneralBlockCompletedBuilder
    implements Builder<GeneralBlockCompleted, GeneralBlockCompletedBuilder> {
  _$GeneralBlockCompleted? _$v;

  String? _blockType;
  String? get blockType => _$this._blockType;
  set blockType(String? blockType) => _$this._blockType = blockType;

  String? _shortSession;
  String? get shortSession => _$this._shortSession;
  set shortSession(String? shortSession) => _$this._shortSession = shortSession;

  String? _longSession;
  String? get longSession => _$this._longSession;
  set longSession(String? longSession) => _$this._longSession = longSession;

  PasskeyOperationBuilder? _passkeyOperation;
  PasskeyOperationBuilder get passkeyOperation =>
      _$this._passkeyOperation ??= new PasskeyOperationBuilder();
  set passkeyOperation(PasskeyOperationBuilder? passkeyOperation) =>
      _$this._passkeyOperation = passkeyOperation;

  GeneralBlockCompletedBuilder() {
    GeneralBlockCompleted._defaults(this);
  }

  GeneralBlockCompletedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockType = $v.blockType;
      _shortSession = $v.shortSession;
      _longSession = $v.longSession;
      _passkeyOperation = $v.passkeyOperation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GeneralBlockCompleted other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GeneralBlockCompleted;
  }

  @override
  void update(void Function(GeneralBlockCompletedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GeneralBlockCompleted build() => _build();

  _$GeneralBlockCompleted _build() {
    _$GeneralBlockCompleted _$result;
    try {
      _$result = _$v ??
          new _$GeneralBlockCompleted._(
              blockType: BuiltValueNullFieldError.checkNotNull(
                  blockType, r'GeneralBlockCompleted', 'blockType'),
              shortSession: BuiltValueNullFieldError.checkNotNull(
                  shortSession, r'GeneralBlockCompleted', 'shortSession'),
              longSession: longSession,
              passkeyOperation: _passkeyOperation?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'passkeyOperation';
        _passkeyOperation?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GeneralBlockCompleted', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
