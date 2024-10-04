// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewMovieResponse _$ReviewMovieResponseFromJson(Map<String, dynamic> json) =>
    ReviewMovieResponse(
      page: (json['page'] as num?)?.toInt(),
      totalResults: (json['vote_count'] as num?)?.toInt(),
      totalPages: (json['total_results'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewMovieResponseToJson(
        ReviewMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'vote_count': instance.totalResults,
      'total_results': instance.totalPages,
      'results': instance.results,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      id: json['id'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'url': instance.url,
    };
