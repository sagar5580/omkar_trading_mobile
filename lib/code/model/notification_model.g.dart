// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) {
  return NotificationRequest(
    fcm_key: json['fcm_key'] as String?,
    id: json['id'] as String?,
    os: json['os'] as String?,
    devise_id: json['devise_id'] as String?,
  );
}

Map<String, dynamic> _$NotificationRequestToJson(
        NotificationRequest instance) =>
    <String, dynamic>{
      'fcm_key': instance.fcm_key,
      'id': instance.id,
      'os': instance.os,
      'devise_id': instance.devise_id,
    };

SaveUserDeviseResponse _$SaveUserDeviseResponseFromJson(
    Map<String, dynamic> json) {
  return SaveUserDeviseResponse(
    status: json['status'] as String?,
    message: json['message'] as String?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$SaveUserDeviseResponseToJson(
        SaveUserDeviseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
    };
