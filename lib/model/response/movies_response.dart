import 'package:json_annotation/json_annotation.dart';
import 'package:my_products/model/local/movie_data.dart';
import 'package:my_products/model/response/base_response.dart';

part 'movies_response.g.dart';

@JsonSerializable()
class MoviesResponse extends BaseResponse {
  @JsonKey(name: "page")
  int? page = 0;
  @JsonKey(name: "vote_count")
  int? totalResults = 0;
  @JsonKey(name: "total_results")
  int? totalPages = 0;
  @JsonKey(name: "results")
  List<Movie>? results;

  MoviesResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesResponseToJson(this);
}

@JsonSerializable()
class Movie {
  @JsonKey(name: "id")
  int? id = 0;

  @JsonKey(name: "popularity")
  double? popularity = 0.0;

  @JsonKey(name: "vote_count")
  int? voteCount = 0;

  @JsonKey(name: "video")
  bool? video = false;

  @JsonKey(name: "poster_path")
  String? posterPath = "";

  @JsonKey(name: "adult")
  bool? adult = false;

  @JsonKey(name: "backdrop_path")
  String? backdropPath = "";

  @JsonKey(name: "original_language")
  String? originalLanguage = "";

  @JsonKey(name: "original_title")
  String? originalTitle = "";

  @JsonKey(name: "genre_ids")
  List<int>? genreIds;

  @JsonKey(name: "title")
  String? title = "";

  @JsonKey(name: "vote_average")
  double? voteAverage = 0.0;

  @JsonKey(name: "overview")
  String? overview = "";

  @JsonKey(name: "release_date")
  String? releaseDate = "";

  Movie({
    this.id,
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  MovieData convert() => MovieData(
      id: id,
      popularity: popularity,
      voteCount: voteCount,
      video: video,
      posterPath: posterPath,
      adult: adult,
      backdropPath: backdropPath,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      genreIds: genreIds,
      title: title,
      voteAverage: voteAverage,
      overview: overview,
      releaseDate: releaseDate);
}
