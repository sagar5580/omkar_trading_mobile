import 'package:json_annotation/json_annotation.dart';

part 'complains_model.g.dart';

@JsonSerializable()
class ComplainsResponse {
  @JsonKey(name: "data")
  List<ComplainsData>? data;

  ComplainsResponse({this.data});

  factory ComplainsResponse.fromJson(Map<String, dynamic> json) =>
      _$ComplainsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainsResponseToJson(this);
}

@JsonSerializable()
class ComplainsData {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "subject")
  String? subject;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "date")
  String? date;

  ComplainsData({
    this.id,
    this.subject,
    this.message,
    this.status,
    this.date,
  });

  factory ComplainsData.fromJson(Map<String, dynamic> json) =>
      _$ComplainsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ComplainsDataToJson(this);
}
