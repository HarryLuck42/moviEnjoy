// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_review_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieReviewProvider on _MovieReviewProvider, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MovieReviewProvider.isLoading', context: context);

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

  late final _$reviewsAtom =
      Atom(name: '_MovieReviewProvider.reviews', context: context);

  @override
  ObservableList<Review> get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(ObservableList<Review> value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_MovieReviewProvider.page', context: context);

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
      Atom(name: '_MovieReviewProvider.totalPages', context: context);

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
      Atom(name: '_MovieReviewProvider.noInternet', context: context);

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

  late final _$isEmptyAtom =
      Atom(name: '_MovieReviewProvider.isEmpty', context: context);

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

  late final _$listenerReviewsAsyncAction =
      AsyncAction('_MovieReviewProvider.listenerReviews', context: context);

  @override
  Future<dynamic> listenerReviews(BuildContext ctx, Movie movie) {
    return _$listenerReviewsAsyncAction
        .run(() => super.listenerReviews(ctx, movie));
  }

  late final _$_MovieReviewProviderActionController =
      ActionController(name: '_MovieReviewProvider', context: context);

  @override
  void resetPage() {
    final _$actionInfo = _$_MovieReviewProviderActionController.startAction(
        name: '_MovieReviewProvider.resetPage');
    try {
      return super.resetPage();
    } finally {
      _$_MovieReviewProviderActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopLoad() {
    final _$actionInfo = _$_MovieReviewProviderActionController.startAction(
        name: '_MovieReviewProvider.stopLoad');
    try {
      return super.stopLoad();
    } finally {
      _$_MovieReviewProviderActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
reviews: ${reviews},
page: ${page},
totalPages: ${totalPages},
noInternet: ${noInternet},
isEmpty: ${isEmpty}
    ''';
  }
}
