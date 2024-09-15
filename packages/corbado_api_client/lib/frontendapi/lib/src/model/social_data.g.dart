// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const SocialDataStatusEnum _$socialDataStatusEnum_initial =
    const SocialDataStatusEnum._('initial');
const SocialDataStatusEnum _$socialDataStatusEnum_started =
    const SocialDataStatusEnum._('started');
const SocialDataStatusEnum _$socialDataStatusEnum_finished =
    const SocialDataStatusEnum._('finished');

SocialDataStatusEnum _$socialDataStatusEnumValueOf(String name) {
  switch (name) {
    case 'initial':
      return _$socialDataStatusEnum_initial;
    case 'started':
      return _$socialDataStatusEnum_started;
    case 'finished':
      return _$socialDataStatusEnum_finished;
    default:
      return _$socialDataStatusEnum_finished;
  }
}

final BuiltSet<SocialDataStatusEnum> _$socialDataStatusEnumValues =
    new BuiltSet<SocialDataStatusEnum>(const <SocialDataStatusEnum>[
  _$socialDataStatusEnum_initial,
  _$socialDataStatusEnum_started,
  _$socialDataStatusEnum_finished,
]);

Serializer<SocialDataStatusEnum> _$socialDataStatusEnumSerializer =
    new _$SocialDataStatusEnumSerializer();

class _$SocialDataStatusEnumSerializer
    implements PrimitiveSerializer<SocialDataStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'initial': 'initial',
    'started': 'started',
    'finished': 'finished',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'initial': 'initial',
    'started': 'started',
    'finished': 'finished',
  };

  @override
  final Iterable<Type> types = const <Type>[SocialDataStatusEnum];
  @override
  final String wireName = 'SocialDataStatusEnum';

  @override
  Object serialize(Serializers serializers, SocialDataStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  SocialDataStatusEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      SocialDataStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$SocialData extends SocialData {
  @override
  final BuiltList<SocialProviderType> providers;
  @override
  final SocialDataStatusEnum status;
  @override
  final String? oauthUrl;
  @override
  final RequestError? error;

  factory _$SocialData([void Function(SocialDataBuilder)? updates]) =>
      (new SocialDataBuilder()..update(updates))._build();

  _$SocialData._(
      {required this.providers,
      required this.status,
      this.oauthUrl,
      this.error})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        providers, r'SocialData', 'providers');
    BuiltValueNullFieldError.checkNotNull(status, r'SocialData', 'status');
  }

  @override
  SocialData rebuild(void Function(SocialDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SocialDataBuilder toBuilder() => new SocialDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SocialData &&
        providers == other.providers &&
        status == other.status &&
        oauthUrl == other.oauthUrl &&
        error == other.error;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, providers.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, oauthUrl.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SocialData')
          ..add('providers', providers)
          ..add('status', status)
          ..add('oauthUrl', oauthUrl)
          ..add('error', error))
        .toString();
  }
}

class SocialDataBuilder implements Builder<SocialData, SocialDataBuilder> {
  _$SocialData? _$v;

  ListBuilder<SocialProviderType>? _providers;
  ListBuilder<SocialProviderType> get providers =>
      _$this._providers ??= new ListBuilder<SocialProviderType>();
  set providers(ListBuilder<SocialProviderType>? providers) =>
      _$this._providers = providers;

  SocialDataStatusEnum? _status;
  SocialDataStatusEnum? get status => _$this._status;
  set status(SocialDataStatusEnum? status) => _$this._status = status;

  String? _oauthUrl;
  String? get oauthUrl => _$this._oauthUrl;
  set oauthUrl(String? oauthUrl) => _$this._oauthUrl = oauthUrl;

  RequestErrorBuilder? _error;
  RequestErrorBuilder get error => _$this._error ??= new RequestErrorBuilder();
  set error(RequestErrorBuilder? error) => _$this._error = error;

  SocialDataBuilder() {
    SocialData._defaults(this);
  }

  SocialDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _providers = $v.providers.toBuilder();
      _status = $v.status;
      _oauthUrl = $v.oauthUrl;
      _error = $v.error?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SocialData other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SocialData;
  }

  @override
  void update(void Function(SocialDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SocialData build() => _build();

  _$SocialData _build() {
    _$SocialData _$result;
    try {
      _$result = _$v ??
          new _$SocialData._(
              providers: providers.build(),
              status: BuiltValueNullFieldError.checkNotNull(
                  status, r'SocialData', 'status'),
              oauthUrl: oauthUrl,
              error: _error?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'providers';
        providers.build();

        _$failedField = 'error';
        _error?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SocialData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
