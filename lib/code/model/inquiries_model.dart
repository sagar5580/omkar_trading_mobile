import 'package:json_annotation/json_annotation.dart';

part 'inquiries_model.g.dart';

@JsonSerializable()
class InquiriesResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;

  InquiriesResponse({
    this.id,
    this.message,
    this.status,
  });

  factory InquiriesResponse.fromJson(Map<String, dynamic> json) =>
      _$InquiriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InquiriesResponseToJson(this);
}
