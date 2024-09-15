// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ProcessResponse extends ProcessResponse {
  @override
  final BlockBody blockBody;
  @override
  final ProcessCommon common;
  @override
  final ProcessStaticInfo? newProcess;

  factory _$ProcessResponse([void Function(ProcessResponseBuilder)? updates]) =>
      (new ProcessResponseBuilder()..update(updates))._build();

  _$ProcessResponse._(
      {required this.blockBody, required this.common, this.newProcess})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        blockBody, r'ProcessResponse', 'blockBody');
    BuiltValueNullFieldError.checkNotNull(common, r'ProcessResponse', 'common');
  }

  @override
  ProcessResponse rebuild(void Function(ProcessResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProcessResponseBuilder toBuilder() =>
      new ProcessResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProcessResponse &&
        blockBody == other.blockBody &&
        common == other.common &&
        newProcess == other.newProcess;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, blockBody.hashCode);
    _$hash = $jc(_$hash, common.hashCode);
    _$hash = $jc(_$hash, newProcess.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProcessResponse')
          ..add('blockBody', blockBody)
          ..add('common', common)
          ..add('newProcess', newProcess))
        .toString();
  }
}

class ProcessResponseBuilder
    implements Builder<ProcessResponse, ProcessResponseBuilder> {
  _$ProcessResponse? _$v;

  BlockBodyBuilder? _blockBody;
  BlockBodyBuilder get blockBody =>
      _$this._blockBody ??= new BlockBodyBuilder();
  set blockBody(BlockBodyBuilder? blockBody) => _$this._blockBody = blockBody;

  ProcessCommonBuilder? _common;
  ProcessCommonBuilder get common =>
      _$this._common ??= new ProcessCommonBuilder();
  set common(ProcessCommonBuilder? common) => _$this._common = common;

  ProcessStaticInfoBuilder? _newProcess;
  ProcessStaticInfoBuilder get newProcess =>
      _$this._newProcess ??= new ProcessStaticInfoBuilder();
  set newProcess(ProcessStaticInfoBuilder? newProcess) =>
      _$this._newProcess = newProcess;

  ProcessResponseBuilder() {
    ProcessResponse._defaults(this);
  }

  ProcessResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _blockBody = $v.blockBody.toBuilder();
      _common = $v.common.toBuilder();
      _newProcess = $v.newProcess?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProcessResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProcessResponse;
  }

  @override
  void update(void Function(ProcessResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProcessResponse build() => _build();

  _$ProcessResponse _build() {
    _$ProcessResponse _$result;
    try {
      _$result = _$v ??
          new _$ProcessResponse._(
              blockBody: blockBody.build(),
              common: common.build(),
              newProcess: _newProcess?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'blockBody';
        blockBody.build();
        _$failedField = 'common';
        common.build();
        _$failedField = 'newProcess';
        _newProcess?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProcessResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
