import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_products/core/base/base_provider.dart';
import 'package:my_products/core/extention/extention.dart';
import 'package:my_products/model/response/review_movie_response.dart';
import 'package:rxdart/rxdart.dart';

import '../../core/constraint/const.dart';
import '../../model/response/movies_response.dart';

part 'movie_review_provider.g.dart';

class MovieReviewProvider = _MovieReviewProvider with _$MovieReviewProvider;

abstract class _MovieReviewProvider extends BaseProvider with Store{

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Review> reviews = ObservableList<Review>();

  @observable
  int page = 1;

  @observable
  int totalPages = 1;

  @observable
  bool noInternet = false;

  @observable
  bool isEmpty = false;

  @action
  void resetPage(){
    page = 1;
    totalPages = 1;
    isEmpty = false;
  }

  @action
  void stopLoad(){
    totalPages = 0;
  }

  final _reviewItems = BehaviorSubject<List<Review>>.seeded([]);
  Stream<List<Review>> get reviewItems => _reviewItems;

  @action
  Future listenerReviews(BuildContext ctx, Movie movie) async {
    final access = await helper.checkConnections();
    if(access){
      noInternet = false;
      isLoading = true;
      totalPages = 0;
      await Future.delayed(const Duration(milliseconds: 2000));
      _reviewItems.value.clear();
      resetPage();
      getReviews(ctx, movie);
    }else{
      noInternet = true;
    }
  }

  void getReviews(BuildContext ctx, Movie movie,) async {
    List<Review> data = [];
    try {
      while (totalPages == 1 || page <= totalPages) {
        final response = await apiRep.apiService.getMovieReview(movie.id.toString(), page, language);
        totalPages = response.totalPages ?? 0;
        if(page == 1){
          if(response.results?.isEmpty ?? true){
            isEmpty = true;
          }
        }
        await Future.delayed(const Duration(milliseconds: 2000));
        data.addAll(response.results ?? []);
        page++;
        _reviewItems.sink.add(data);
        isLoading = false;
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

}