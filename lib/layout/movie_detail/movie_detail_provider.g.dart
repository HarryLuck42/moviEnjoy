// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_provider.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailProvider on _MovieDetailProvider, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MovieDetailProvider.isLoading', context: context);

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

  late final _$detailAtom =
      Atom(name: '_MovieDetailProvider.detail', context: context);

  @override
  MovieDetailResponse? get detail {
    _$detailAtom.reportRead();
    return super.detail;
  }

  @override
  set detail(MovieDetailResponse? value) {
    _$detailAtom.reportWrite(value, super.detail, () {
      super.detail = value;
    });
  }

  late final _$videosAtom =
      Atom(name: '_MovieDetailProvider.videos', context: context);

  @override
  ObservableList<Video> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<Video> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  late final _$getMovieDetailAsyncAction =
      AsyncAction('_MovieDetailProvider.getMovieDetail', context: context);

  @override
  Future<dynamic> getMovieDetail(BuildContext ctx, Movie movie) {
    return _$getMovieDetailAsyncAction
        .run(() => super.getMovieDetail(ctx, movie));
  }

  late final _$getVideosAsyncAction =
      AsyncAction('_MovieDetailProvider.getVideos', context: context);

  @override
  Future<dynamic> getVideos(BuildContext ctx, Movie movie) {
    return _$getVideosAsyncAction.run(() => super.getVideos(ctx, movie));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
detail: ${detail},
videos: ${videos}
    ''';
  }
}
