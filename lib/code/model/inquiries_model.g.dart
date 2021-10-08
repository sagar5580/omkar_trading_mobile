// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InquiriesResponse _$InquiriesResponseFromJson(Map<String, dynamic> json) {
  return InquiriesResponse(
    id: json['id'] as int?,
    message: json['message'] as String?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$InquiriesResponseToJson(InquiriesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'status': instance.status,
    };
