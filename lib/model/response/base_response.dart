
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "success")
  bool? success = false;

  @JsonKey(name: "status_code")
  int? statusCode = 0;

  @JsonKey(name: "status_message")
  String? statusMessage = "";

  BaseResponse({this.success, this.statusCode, this.statusMessage});

  factory BaseResponse.fromJson(Map<String, dynamic> map) => _$BaseResponseFromJson(map);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}