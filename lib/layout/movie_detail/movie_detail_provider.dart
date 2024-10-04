import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_products/core/base/base_provider.dart';
import 'package:my_products/core/constraint/const.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/response/movie_detail_response.dart';
import 'package:my_products/model/response/movies_response.dart';
import 'package:my_products/model/response/video_response.dart';

import '../../service/api_handling.dart';

part 'movie_detail_provider.g.dart';

class MovieDetailProvider = _MovieDetailProvider with _$MovieDetailProvider;

abstract class _MovieDetailProvider extends BaseProvider with Store{

  @observable
  bool isLoading = false;
  
  @observable
  MovieDetailResponse? detail;

  @action
  Future getMovieDetail(BuildContext ctx, Movie movie) async {
    isLoading = true;
    try {
      await ApiHandling.hitApi<MovieDetailResponse>(
          apiRep.apiService.getMovieDetail(movie.id.toString(), language),
          (response) {
        detail = response;
        isLoading = false;
      }, (failed) {
        ctx.showShackBar(failed.messageError);
        isLoading = false;
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      isLoading = false;
    }
  }

  @observable
  ObservableList<Video> videos = ObservableList<Video>();

  @action
  Future getVideos(BuildContext ctx, Movie movie) async {
    isLoading = true;
    try {
      await ApiHandling.hitApi<VideoResponse>(
          apiRep.apiService.getDataVideo(movie.id.toString(), language),
          (response) {
        videos.addAll(response.results ?? []);
        isLoading = false;
      }, (failed) {
        ctx.showShackBar(failed.messageError);
        isLoading = false;
      });
    } catch (e) {
      ctx.showShackBar(e.toString());
      isLoading = false;
    }
  }
}
