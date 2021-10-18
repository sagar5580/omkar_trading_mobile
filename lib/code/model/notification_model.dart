import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationRequest {
  @JsonKey(name: "fcm_key")
  String? fcm_key;
  @JsonKey(name: "os")
  String? os;
  @JsonKey(name: "devise_id")
  String? devise_id;

  NotificationRequest({this.fcm_key, this.os, this.devise_id});

  factory NotificationRequest.fromJson(Map<String, dynamic> json) =>
      _$NotificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationRequestToJson(this);
}

@JsonSerializable()
class SaveUserDeviseResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "id")
  int? id;

  SaveUserDeviseResponse({this.status, this.message, this.id});

  factory SaveUserDeviseResponse.fromJson(Map<String, dynamic> json) =>
      _$SaveUserDeviseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SaveUserDeviseResponseToJson(this);
}
