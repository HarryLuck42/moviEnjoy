import 'package:json_annotation/json_annotation.dart';

part 'video_response.g.dart';

@JsonSerializable()
class VideoResponse {
  @JsonKey(name: "id")
  int? id = 0;

  @JsonKey(name: "results")
  List<Video>? results;

  VideoResponse({this.id, this.results});

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}

@JsonSerializable()
class Video {
  @JsonKey(name: "id")
  String? id = "";

  @JsonKey(name: "iso_639_1")
  String? language = "";

  @JsonKey(name: "iso_3166_1")
  String? country = "";

  @JsonKey(name: "key")
  String? key = "";

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "site")
  String? site = "";

  @JsonKey(name: "size")
  int? size = 0;

  @JsonKey(name: "type")
  String? type = "";

  @JsonKey(name: "official")
  bool? official = false;

  @JsonKey(name: "published_at")
  String? publishedAt = "";

  Video(
      {this.id,
      this.language,
      this.country,
      this.key,
      this.name,
      this.site,
      this.size,
      this.type,
      this.official,
      this.publishedAt});

  factory Video.fromJson(Map<String, dynamic> json) =>
      _$VideoFromJson(json);

  Map<String, dynamic> toJson() => _$VideoToJson(this);
}
