
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/response/movie_detail_response.dart';
import '../model/response/movies_response.dart';
import '../model/response/review_movie_response.dart';
import '../model/response/video_response.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService{
  factory ApiService(Dio dio, {required String baseUrl}) = _ApiService;

  @GET("movie/{movie}")
  Future<MoviesResponse> getListMovies(
  @Path("movie") String movie,
  @Query("page") int page,
  @Query("language") String language);

  @GET("movie/{id}")
  Future<MovieDetailResponse> getMovieDetail(
  @Path("id") String id,
  @Query("language") String language);

  @GET("movie/{id}/reviews")
  Future<ReviewMovieResponse> getMovieReview(
  @Path("id") String id,
  @Query("page") int page,
  @Query("language") String language);

  @GET("movie/{id}/videos")
  Future<VideoResponse> getDataVideo(
  @Path("id") String id,
  @Query("language") String language);

  @GET("search/movie")
  Future<MoviesResponse> searchMovieByKeyWord(
  @Query("page") int page,
  @Query("language") String language,
  @Query("query") String keyword,
  @Query("include_adult") bool includeAdult);

}