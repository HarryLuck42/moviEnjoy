// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesResponse _$MoviesResponseFromJson(Map<String, dynamic> json) =>
    MoviesResponse(
      page: (json['page'] as num?)?.toInt(),
      totalResults: (json['vote_count'] as num?)?.toInt(),
      totalPages: (json['total_results'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..success = json['success'] as bool?
      ..statusCode = (json['status_code'] as num?)?.toInt()
      ..statusMessage = json['status_message'] as String?;

Map<String, dynamic> _$MoviesResponseToJson(MoviesResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'page': instance.page,
      'vote_count': instance.totalResults,
      'total_results': instance.totalPages,
      'results': instance.results,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      id: (json['id'] as num?)?.toInt(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
      video: json['video'] as bool?,
      posterPath: json['poster_path'] as String?,
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      genreIds: (json['genre_ids'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      title: json['title'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'genre_ids': instance.genreIds,
      'title': instance.title,
      'vote_average': instance.voteAverage,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
