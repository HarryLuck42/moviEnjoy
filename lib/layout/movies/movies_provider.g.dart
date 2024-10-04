// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesProvider on _MoviesProvider, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MoviesProvider.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$keywordAtom =
      Atom(name: '_MoviesProvider.keyword', context: context);

  @override
  String get keyword {
    _$keywordAtom.reportRead();
    return super.keyword;
  }

  @override
  set keyword(String value) {
    _$keywordAtom.reportWrite(value, super.keyword, () {
      super.keyword = value;
    });
  }

  late final _$isEmptyAtom =
      Atom(name: '_MoviesProvider.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$currPageAtom =
      Atom(name: '_MoviesProvider.currPage', context: context);

  @override
  MoviePage get currPage {
    _$currPageAtom.reportRead();
    return super.currPage;
  }

  @override
  set currPage(MoviePage value) {
    _$currPageAtom.reportWrite(value, super.currPage, () {
      super.currPage = value;
    });
  }

  late final _$pageAtom = Atom(name: '_MoviesProvider.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$totalPagesAtom =
      Atom(name: '_MoviesProvider.totalPages', context: context);

  @override
  int get totalPages {
    _$totalPagesAtom.reportRead();
    return super.totalPages;
  }

  @override
  set totalPages(int value) {
    _$totalPagesAtom.reportWrite(value, super.totalPages, () {
      super.totalPages = value;
    });
  }

  late final _$noInternetAtom =
      Atom(name: '_MoviesProvider.noInternet', context: context);

  @override
  bool get noInternet {
    _$noInternetAtom.reportRead();
    return super.noInternet;
  }

  @override
  set noInternet(bool value) {
    _$noInternetAtom.reportWrite(value, super.noInternet, () {
      super.noInternet = value;
    });
  }

  late final _$listenerMoviesAsyncAction =
      AsyncAction('_MoviesProvider.listenerMovies', context: context);

  @override
  Future<dynamic> listenerMovies(BuildContext ctx) {
    return _$listenerMoviesAsyncAction.run(() => super.listenerMovies(ctx));
  }

  late final _$_MoviesProviderActionController =
      ActionController(name: '_MoviesProvider', context: context);

  @override
  void resetPage() {
    final _$actionInfo = _$_MoviesProviderActionController.startAction(
        name: '_MoviesProvider.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_MoviesProviderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoad() {
    final _$actionInfo = _$_MoviesProviderActionController.startAction(
        name: '_MoviesProvider.stopLoad');
    try {
      return super.stopLoad();
    } finally {
      _$_MoviesProviderActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
keyword: ${keyword},
isEmpty: ${isEmpty},
currPage: ${currPage},
page: ${page},
totalPages: ${totalPages},
noInternet: ${noInternet}
    ''';
  }
}
