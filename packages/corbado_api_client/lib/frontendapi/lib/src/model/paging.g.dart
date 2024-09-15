// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paging.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Paging extends Paging {
  @override
  final int page;
  @override
  final int totalPages;
  @override
  final int totalItems;

  factory _$Paging([void Function(PagingBuilder)? updates]) =>
      (new PagingBuilder()..update(updates))._build();

  _$Paging._(
      {required this.page, required this.totalPages, required this.totalItems})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(page, r'Paging', 'page');
    BuiltValueNullFieldError.checkNotNull(totalPages, r'Paging', 'totalPages');
    BuiltValueNullFieldError.checkNotNull(totalItems, r'Paging', 'totalItems');
  }

  @override
  Paging rebuild(void Function(PagingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PagingBuilder toBuilder() => new PagingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Paging &&
        page == other.page &&
        totalPages == other.totalPages &&
        totalItems == other.totalItems;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, page.hashCode);
    _$hash = $jc(_$hash, totalPages.hashCode);
    _$hash = $jc(_$hash, totalItems.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Paging')
          ..add('page', page)
          ..add('totalPages', totalPages)
          ..add('totalItems', totalItems))
        .toString();
  }
}

class PagingBuilder implements Builder<Paging, PagingBuilder> {
  _$Paging? _$v;

  int? _page;
  int? get page => _$this._page;
  set page(int? page) => _$this._page = page;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  int? _totalItems;
  int? get totalItems => _$this._totalItems;
  set totalItems(int? totalItems) => _$this._totalItems = totalItems;

  PagingBuilder() {
    Paging._defaults(this);
  }

  PagingBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _page = $v.page;
      _totalPages = $v.totalPages;
      _totalItems = $v.totalItems;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Paging other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Paging;
  }

  @override
  void update(void Function(PagingBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Paging build() => _build();

  _$Paging _build() {
    final _$result = _$v ??
        new _$Paging._(
            page:
                BuiltValueNullFieldError.checkNotNull(page, r'Paging', 'page'),
            totalPages: BuiltValueNullFieldError.checkNotNull(
                totalPages, r'Paging', 'totalPages'),
            totalItems: BuiltValueNullFieldError.checkNotNull(
                totalItems, r'Paging', 'totalItems'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
