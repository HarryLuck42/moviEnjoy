import 'package:hive/hive.dart';
import 'package:my_products/model/response/movies_response.dart';

part 'movie_data.g.dart';

@HiveType(typeId: 0)
class MovieData extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  double? popularity;

  @HiveField(2)
  int? voteCount;

  @HiveField(3)
  bool? video;

  @HiveField(4)
  String? posterPath;

  @HiveField(5)
  bool? adult;

  @HiveField(6)
  String? backdropPath;

  @HiveField(7)
  String? originalLanguage;

  @HiveField(8)
  String? originalTitle;

  @HiveField(9)
  List<int>? genreIds;

  @HiveField(10)
  String? title;

  @HiveField(11)
  double? voteAverage;

  @HiveField(12)
  String? overview;

  @HiveField(13)
  String? releaseDate;

  MovieData({
    required this.id,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.posterPath,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
  });

  MovieData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    popularity = json['popularity'];
    voteCount = json['voteCount'];
    video = json['video'];
    posterPath = json['posterPath'];
    adult = json['adult'];
    backdropPath = json['backdropPath'];
    originalLanguage = json['originalLanguage'];
    originalTitle = json['originalTitle'];
    genreIds = json['genreIds'];
    title = json['title'];
    voteAverage = json['voteAverage'];
    overview = json['overview'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['id'] = id;
    result['popularity'] = popularity;
    result['voteCount'] = voteCount;
    result['video'] = video;
    result['posterPath'] = posterPath;
    result['adult'] = adult;
    result['backdropPath'] = backdropPath;
    result['originalLanguage'] = originalLanguage;
    result['originalTitle'] = originalTitle;
    result['genreIds'] = genreIds;
    result['title'] = title;
    result['voteAverage'] = voteAverage;
    result['overview'] = overview;
    result['releaseDate'] = releaseDate;
    return result;
  }

  Movie convert() => Movie(
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
