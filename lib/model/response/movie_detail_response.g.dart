// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailResponse _$MovieDetailResponseFromJson(Map<String, dynamic> json) =>
    MovieDetailResponse(
      id: (json['id'] as num?)?.toInt(),
      adult: json['adult'] as bool?,
      backdropPath: json['backdrop_path'] as String?,
      budget: (json['budget'] as num?)?.toInt(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreData.fromJson(e as Map<String, dynamic>))
          .toList(),
      homepage: json['homepage'] as String?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      productionCompanies: (json['production_companies'] as List<dynamic>?)
          ?.map((e) => Companies.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>?)
          ?.map((e) => Countries.fromJson(e as Map<String, dynamic>))
          .toList(),
      releaseDate: json['release_date'] as String?,
      revenue: (json['revenue'] as num?)?.toInt(),
      runtime: (json['runtime'] as num?)?.toInt(),
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => LanguageValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      voteCount: (json['vote_count'] as num?)?.toInt(),
    )
      ..success = json['success'] as bool?
      ..statusCode = (json['status_code'] as num?)?.toInt()
      ..statusMessage = json['status_message'] as String?;

Map<String, dynamic> _$MovieDetailResponseToJson(
        MovieDetailResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_code': instance.statusCode,
      'status_message': instance.statusMessage,
      'id': instance.id,
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCompanies,
      'production_countries': instance.productionCountries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

GenreData _$GenreDataFromJson(Map<String, dynamic> json) => GenreData(
      id: (json['id'] as num?)?.toInt(),
      desc: json['name'] as String?,
    );

Map<String, dynamic> _$GenreDataToJson(GenreData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.desc,
    };

Companies _$CompaniesFromJson(Map<String, dynamic> json) => Companies(
      id: (json['id'] as num?)?.toInt(),
      logoPath: json['logo_path'] as String?,
      name: json['name'] as String?,
      originCountry: json['origin_country'] as String?,
    );

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

Countries _$CountriesFromJson(Map<String, dynamic> json) => Countries(
      code: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CountriesToJson(Countries instance) => <String, dynamic>{
      'iso_3166_1': instance.code,
      'name': instance.name,
    };

LanguageValue _$LanguageValueFromJson(Map<String, dynamic> json) =>
    LanguageValue(
      code: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$LanguageValueToJson(LanguageValue instance) =>
    <String, dynamic>{
      'iso_639_1': instance.code,
      'name': instance.name,
    };
