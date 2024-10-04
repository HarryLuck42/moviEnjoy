

import 'package:json_annotation/json_annotation.dart';
import 'package:my_products/model/response/base_response.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse extends BaseResponse {
  @JsonKey(name: "id")
  int? id = 0;

  @JsonKey(name: "adult")
  bool? adult = false;
  
  @JsonKey(name: "backdrop_path")
  String? backdropPath = "";
  
  @JsonKey(name: "budget")
  int? budget = 0;
  
  @JsonKey(name: "genres")
  List<GenreData>? genres;
  
  @JsonKey(name: "homepage")
  String? homepage = "";
  
  @JsonKey(name: "original_language")
  String? originalLanguage = "";
  
  @JsonKey(name: "original_title")
  String? originalTitle = "";
  
  @JsonKey(name: "overview")
  String? overview = "";
  
  @JsonKey(name: "popularity")
  double? popularity = 0.0;
  
  @JsonKey(name: "poster_path")
  String? posterPath = "";
  
  @JsonKey(name: "production_companies")
  List<Companies>? productionCompanies;
  
  @JsonKey(name: "production_countries")
  List<Countries>? productionCountries;
  
  @JsonKey(name: "release_date")
  String? releaseDate = "";
  
  @JsonKey(name: "revenue")
  int? revenue = 0;
  
  @JsonKey(name: "runtime")
  int? runtime = 0;
  
  @JsonKey(name: "spoken_languages")
  List<LanguageValue>? spokenLanguages;
  
  @JsonKey(name: "status")
  String? status = "";
  
  @JsonKey(name: "tagline")
  String? tagline = "";
  
  @JsonKey(name: "title")
  String? title = "";
  
  @JsonKey(name: "video")
  bool? video = false;
  
  @JsonKey(name: "vote_average")
  double? voteAverage = 0.0;
  
  @JsonKey(name: "vote_count")
  int? voteCount = 0;


  MovieDetailResponse({
    this.id,
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class GenreData{
  @JsonKey(name: "id")
  int? id = 0;

  @JsonKey(name: "name")
  String? desc = "";

  GenreData({this.id, this.desc});

  factory GenreData.fromJson(Map<String, dynamic> json) =>
      _$GenreDataFromJson(json);

  Map<String, dynamic> toJson() => _$GenreDataToJson(this);
}

@JsonSerializable()
class Companies{
  @JsonKey(name: "id")
  int? id = 0;

  @JsonKey(name: "logo_path")
  String? logoPath = "";

  @JsonKey(name: "name")
  String? name = "";

  @JsonKey(name: "origin_country")
  String? originCountry = "";

  Companies({this.id, this.logoPath, this.name, this.originCountry});

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);

  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}

@JsonSerializable()
class Countries{
  @JsonKey(name: "iso_3166_1")
  String? code = "";

  @JsonKey(name: "name")
  String? name = "";

  Countries({this.code, this.name});

  factory Countries.fromJson(Map<String, dynamic> json) =>
      _$CountriesFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}

@JsonSerializable()
class LanguageValue{
  @JsonKey(name: "iso_639_1")
  String? code = "";

  @JsonKey(name: "name")
  String? name = "";

  LanguageValue({this.code, this.name});

  factory LanguageValue.fromJson(Map<String, dynamic> json) =>
      _$LanguageValueFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageValueToJson(this);
}