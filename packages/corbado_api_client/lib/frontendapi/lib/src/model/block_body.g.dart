// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'block_body.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BlockBody extends BlockBody {
  @override
  final BlockType block;
  @override
  final AuthType authType;
  @override
  final BlockBodyData data;
  @override
  final BuiltList<BlockBody>? alternatives;
  @override
  final RequestError? error;
  @override
  final ContinueOnOtherDevice? continueOnOtherDevice;

  factory _$BlockBody([void Function(BlockBodyBuilder)? updates]) =>
      (new BlockBodyBuilder()..update(updates))._build();

  _$BlockBody._(
      {required this.block,
      required this.authType,
      required this.data,
      this.alternatives,
      this.error,
      this.continueOnOtherDevice})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(block, r'BlockBody', 'block');
    BuiltValueNullFieldError.checkNotNull(authType, r'BlockBody', 'authType');
    BuiltValueNullFieldError.checkNotNull(data, r'BlockBody', 'data');
  }

  @override
  BlockBody rebuild(void Function(BlockBodyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BlockBodyBuilder toBuilder() => new BlockBodyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BlockBody &&
        block == other.block &&
        authType == other.authType &&
        data == other.data &&
        alternatives == other.alternatives &&
        error == other.error &&
        continueOnOtherDevice == other.continueOnOtherDevice;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, block.hashCode);
    _$hash = $jc(_$hash, authType.hashCode);
    _$hash = $jc(_$hash, data.hashCode);
    _$hash = $jc(_$hash, alternatives.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, continueOnOtherDevice.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BlockBody')
          ..add('block', block)
          ..add('authType', authType)
          ..add('data', data)
          ..add('alternatives', alternatives)
          ..add('error', error)
          ..add('continueOnOtherDevice', continueOnOtherDevice))
        .toString();
  }
}

class BlockBodyBuilder implements Builder<BlockBody, BlockBodyBuilder> {
  _$BlockBody? _$v;

  BlockType? _block;
  BlockType? get block => _$this._block;
  set block(BlockType? block) => _$this._block = block;

  AuthType? _authType;
  AuthType? get authType => _$this._authType;
  set authType(AuthType? authType) => _$this._authType = authType;

  BlockBodyDataBuilder? _data;
  BlockBodyDataBuilder get data => _$this._data ??= new BlockBodyDataBuilder();
  set data(BlockBodyDataBuilder? data) => _$this._data = data;

  ListBuilder<BlockBody>? _alternatives;
  ListBuilder<BlockBody> get alternatives =>
      _$this._alternatives ??= new ListBuilder<BlockBody>();
  set alternatives(ListBuilder<BlockBody>? alternatives) =>
      _$this._alternatives = alternatives;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  ContinueOnOtherDeviceBuilder? _continueOnOtherDevice;
  ContinueOnOtherDeviceBuilder get continueOnOtherDevice =>
      _$this._continueOnOtherDevice ??= new ContinueOnOtherDeviceBuilder();
  set continueOnOtherDevice(
          ContinueOnOtherDeviceBuilder? continueOnOtherDevice) =>
      _$this._continueOnOtherDevice = continueOnOtherDevice;

  BlockBodyBuilder() {
    BlockBody._defaults(this);
  }

  BlockBodyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _block = $v.block;
      _authType = $v.authType;
      _data = $v.data.toBuilder();
      _alternatives = $v.alternatives?.toBuilder();
      _error = $v.error?.toBuilder();
      _continueOnOtherDevice = $v.continueOnOtherDevice?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BlockBody other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BlockBody;
  }

  @override
  void update(void Function(BlockBodyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BlockBody build() => _build();

  _$BlockBody _build() {
    _$BlockBody _$result;
    try {
      _$result = _$v ??
          new _$BlockBody._(
              block: BuiltValueNullFieldError.checkNotNull(
                  block, r'BlockBody', 'block'),
              authType: BuiltValueNullFieldError.checkNotNull(
                  authType, r'BlockBody', 'authType'),
              data: data.build(),
              alternatives: _alternatives?.build(),
              error: _error?.build(),
              continueOnOtherDevice: _continueOnOtherDevice?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
        _$failedField = 'alternatives';
        _alternatives?.build();
        _$failedField = 'error';
        _error?.build();
        _$failedField = 'continueOnOtherDevice';
        _continueOnOtherDevice?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'BlockBody', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
