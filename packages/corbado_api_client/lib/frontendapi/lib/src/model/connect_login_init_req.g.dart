// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_login_init_req.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectLoginInitReq extends ConnectLoginInitReq {
  @override
  final ClientInformation clientInformation;
  @override
  final BuiltMap<String, String> flags;

  factory _$ConnectLoginInitReq(
          [void Function(ConnectLoginInitReqBuilder)? updates]) =>
      (new ConnectLoginInitReqBuilder()..update(updates))._build();

  _$ConnectLoginInitReq._(
      {required this.clientInformation, required this.flags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        clientInformation, r'ConnectLoginInitReq', 'clientInformation');
    BuiltValueNullFieldError.checkNotNull(
        flags, r'ConnectLoginInitReq', 'flags');
  }

  @override
  ConnectLoginInitReq rebuild(
          void Function(ConnectLoginInitReqBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectLoginInitReqBuilder toBuilder() =>
      new ConnectLoginInitReqBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectLoginInitReq &&
        clientInformation == other.clientInformation &&
        flags == other.flags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, clientInformation.hashCode);
    _$hash = $jc(_$hash, flags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectLoginInitReq')
          ..add('clientInformation', clientInformation)
          ..add('flags', flags))
        .toString();
  }
}

class ConnectLoginInitReqBuilder
    implements Builder<ConnectLoginInitReq, ConnectLoginInitReqBuilder> {
  _$ConnectLoginInitReq? _$v;

  ClientInformationBuilder? _clientInformation;
  ClientInformationBuilder get clientInformation =>
      _$this._clientInformation ??= new ClientInformationBuilder();
  set clientInformation(ClientInformationBuilder? clientInformation) =>
      _$this._clientInformation = clientInformation;

  MapBuilder<String, String>? _flags;
  MapBuilder<String, String> get flags =>
      _$this._flags ??= new MapBuilder<String, String>();
  set flags(MapBuilder<String, String>? flags) => _$this._flags = flags;

  ConnectLoginInitReqBuilder() {
    ConnectLoginInitReq._defaults(this);
  }

  ConnectLoginInitReqBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _clientInformation = $v.clientInformation.toBuilder();
      _flags = $v.flags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectLoginInitReq other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectLoginInitReq;
  }

  @override
  void update(void Function(ConnectLoginInitReqBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectLoginInitReq build() => _build();

  _$ConnectLoginInitReq _build() {
    _$ConnectLoginInitReq _$result;
    try {
      _$result = _$v ??
          new _$ConnectLoginInitReq._(
              clientInformation: clientInformation.build(),
              flags: flags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'clientInformation';
        clientInformation.build();
        _$failedField = 'flags';
        flags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConnectLoginInitReq', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
