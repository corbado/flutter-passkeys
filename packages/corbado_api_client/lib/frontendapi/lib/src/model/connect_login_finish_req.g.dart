// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_finish_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectLoginFinishReq extends ConnectLoginFinishReq {
  @override
  final bool isConditionalUI;
  @override
  final String assertionResponse;

  factory _$ConnectLoginFinishReq(
          [void Function(ConnectLoginFinishReqBuilder)? updates]) =>
      (new ConnectLoginFinishReqBuilder()..update(updates))._build();

  _$ConnectLoginFinishReq._(
      {required this.isConditionalUI, required this.assertionResponse})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isConditionalUI, r'ConnectLoginFinishReq', 'isConditionalUI');
    BuiltValueNullFieldError.checkNotNull(
        assertionResponse, r'ConnectLoginFinishReq', 'assertionResponse');
  }

  @override
  ConnectLoginFinishReq rebuild(
          void Function(ConnectLoginFinishReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginFinishReqBuilder toBuilder() =>
      new ConnectLoginFinishReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginFinishReq &&
        isConditionalUI == other.isConditionalUI &&
        assertionResponse == other.assertionResponse;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, isConditionalUI.hashCode);
    _$hash = $jc(_$hash, assertionResponse.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginFinishReq')
          ..add('isConditionalUI', isConditionalUI)
          ..add('assertionResponse', assertionResponse))
        .toString();
  }
}

class ConnectLoginFinishReqBuilder
    implements Builder<ConnectLoginFinishReq, ConnectLoginFinishReqBuilder> {
  _$ConnectLoginFinishReq? _$v;

  bool? _isConditionalUI;
  bool? get isConditionalUI => _$this._isConditionalUI;
  set isConditionalUI(bool? isConditionalUI) =>
      _$this._isConditionalUI = isConditionalUI;

  String? _assertionResponse;
  String? get assertionResponse => _$this._assertionResponse;
  set assertionResponse(String? assertionResponse) =>
      _$this._assertionResponse = assertionResponse;

  ConnectLoginFinishReqBuilder() {
    ConnectLoginFinishReq._defaults(this);
  }

  ConnectLoginFinishReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isConditionalUI = $v.isConditionalUI;
      _assertionResponse = $v.assertionResponse;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginFinishReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginFinishReq;
  }

  @override
  void update(void Function(ConnectLoginFinishReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginFinishReq build() => _build();

  _$ConnectLoginFinishReq _build() {
    final _$result = _$v ??
        new _$ConnectLoginFinishReq._(
            isConditionalUI: BuiltValueNullFieldError.checkNotNull(
                isConditionalUI, r'ConnectLoginFinishReq', 'isConditionalUI'),
            assertionResponse: BuiltValueNullFieldError.checkNotNull(
                assertionResponse,
                r'ConnectLoginFinishReq',
                'assertionResponse'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
