
import 'package:json_annotation/json_annotation.dart';

part 'review_movie_response.g.dart';

@JsonSerializable()
class ReviewMovieResponse{
  @JsonKey(name: "page")
  int? page = 0;
  @JsonKey(name: "vote_count")
  int? totalResults = 0;
  @JsonKey(name: "total_results")
  int? totalPages = 0;
  @JsonKey(name: "results")
  List<Review>? results;

  ReviewMovieResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory ReviewMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewMovieResponseToJson(this);
}

@JsonSerializable()
class Review{
  @JsonKey(name: "id")
  String? id = "";

  @JsonKey(name: "author")
  String? author = "";

  @JsonKey(name: "content")
  String? content = "";

  @JsonKey(name: "url")
  String? url = "";

  Review({this.id, this.author, this.content, this.url});

  factory Review.fromJson(Map<String, dynamic> json) =>
      _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}