// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identifier.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Identifier extends Identifier {
  @override
  final String id;
  @override
  final String value;
  @override
  final LoginIdentifierType type;
  @override
  final String status;

  factory _$Identifier([void Function(IdentifierBuilder)? updates]) =>
      (new IdentifierBuilder()..update(updates))._build();

  _$Identifier._(
      {required this.id,
      required this.value,
      required this.type,
      required this.status})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Identifier', 'id');
    BuiltValueNullFieldError.checkNotNull(value, r'Identifier', 'value');
    BuiltValueNullFieldError.checkNotNull(type, r'Identifier', 'type');
    BuiltValueNullFieldError.checkNotNull(status, r'Identifier', 'status');
  }

  @override
  Identifier rebuild(void Function(IdentifierBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentifierBuilder toBuilder() => new IdentifierBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Identifier &&
        id == other.id &&
        value == other.value &&
        type == other.type &&
        status == other.status;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Identifier')
          ..add('id', id)
          ..add('value', value)
          ..add('type', type)
          ..add('status', status))
        .toString();
  }
}

class IdentifierBuilder implements Builder<Identifier, IdentifierBuilder> {
  _$Identifier? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _value;
  String? get value => _$this._value;
  set value(String? value) => _$this._value = value;

  LoginIdentifierType? _type;
  LoginIdentifierType? get type => _$this._type;
  set type(LoginIdentifierType? type) => _$this._type = type;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  IdentifierBuilder() {
    Identifier._defaults(this);
  }

  IdentifierBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _value = $v.value;
      _type = $v.type;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Identifier other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Identifier;
  }

  @override
  void update(void Function(IdentifierBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Identifier build() => _build();

  _$Identifier _build() {
    final _$result = _$v ??
        new _$Identifier._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Identifier', 'id'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, r'Identifier', 'value'),
            type: BuiltValueNullFieldError.checkNotNull(
                type, r'Identifier', 'type'),
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'Identifier', 'status'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
