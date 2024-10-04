import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_products/core/base/base_provider.dart';
import 'package:my_products/core/constraint/const.dart';
import 'package:my_products/core/constraint/enum.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/response/movies_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/local/movie_data.dart';
import '../../model/response/video_response.dart';
import '../../service/api_handling.dart';

part 'movies_provider.g.dart';

class MoviesProvider = _MoviesProvider with _$MoviesProvider;

abstract class _MoviesProvider extends BaseProvider with Store {
  @observable
  bool isLoading = false;

  @observable
  String keyword = "";

  @observable
  bool isEmpty = false;

  @observable
  MoviePage currPage = MoviePage.nowPlaying;

  @observable
  int page = 1;

  @observable
  int totalPages = 1;

  @observable
  bool noInternet = false;

  @action
  void resetPage() {
    page = 1;
    totalPages = 1;
    isEmpty = false;
  }

  @action
  void stopLoad(){
    totalPages = 0;
  }

  final _movieItems = BehaviorSubject<List<Movie>>.seeded([]);

  Stream<List<Movie>> get movieItems => _movieItems;

  @action
  Future listenerMovies(BuildContext ctx) async {
    final access = await helper.checkConnections();
    if(access){
      noInternet = false;
      isLoading = true;
      totalPages = 0;
      await Future.delayed(const Duration(milliseconds: 2000));
      _movieItems.value.clear();
      resetPage();
      getMovies(ctx);
    }else{
      noInternet = true;
    }
  }

  void getMovies(BuildContext ctx) async {
    List<Movie> data = [];
    try {
      if (currPage == MoviePage.bookmarks) {
        data.addAll(getMovieFromHive());
        if(data.isEmpty){
          isEmpty = true;
        }
        _movieItems.sink.add(data);

        isLoading = false;
      } else {
        while (totalPages == 1 || page <= totalPages) {
          final response = keyword.isEmpty
              ? await apiRep.apiService.getListMovies(
                  moviePath[currPage] ?? "popular", page, language)
              : await apiRep.apiService
                  .searchMovieByKeyWord(page, language, keyword, true);
          totalPages = response.totalPages ?? 0;
          if(page == 1){
            if(response.results?.isEmpty ?? true){
              isEmpty = true;
            }
          }
          await Future.delayed(const Duration(milliseconds: 2000));
          data.addAll(response.results ?? []);
          page++;
          _movieItems.sink.add(data);
          isLoading = false;
        }
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response == null) {
          ctx.showShackBar("Error: ${e.message}");
        } else {
          Map<String, dynamic> map = e.response?.data ?? {};
          String? message = map["message"];
          ctx.showShackBar("Error: ${message ?? e.message}");
        }
      } else {
        ctx.showShackBar("Error: ${e.toString()}");
      }
      isLoading = false;
    }
  }

  List<Movie> getMovieFromHive() => keyword.isEmpty
      ? memoryAction.getMovies().map((e) => e.convert()).toList()
      : memoryAction
      .getMovies()
      .map((e) => e.convert())
      .toList()
      .where((e) =>
  (e.title?.toLowerCase().contains(keyword.toLowerCase())) ??
      false)
      .toList();

  dispose() {
    _movieItems.close();
  }

  void saveBookmark(Movie data) async {
    final MovieData? current =
        memoryAction.getMovies().where((e) => data.id == e.id).firstOrNull;
    if (current == null) {
      await memoryAction.saveMovie(data.convert());
      await Future.delayed(const Duration(milliseconds: 500));
    } else {
      await memoryAction.deleteMovie(data.convert());
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  bool isBookmarked(Movie movie) {
    final movieData = memoryAction.getMovies();
    final selected = movieData.where((e) {
      return e.id == movie.id;
    }).toList();
    return selected.isNotEmpty;
  }

  Future getVideos(
      BuildContext ctx, Movie movie, Function(List<Video>) onSuccess) async {
    try {
      await ApiHandling.hitApi<VideoResponse>(
          apiRep.apiService.getDataVideo(movie.id.toString(), language),
          (response) {
        onSuccess(response.results ?? []);
      }, (failed) {
        ctx.showShackBar(failed.messageError);
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
    }
  }
}
