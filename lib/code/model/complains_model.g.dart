// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complains_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplainsResponse _$ComplainsResponseFromJson(Map<String, dynamic> json) {
  return ComplainsResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ComplainsData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ComplainsResponseToJson(ComplainsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ComplainsData _$ComplainsDataFromJson(Map<String, dynamic> json) {
  return ComplainsData(
    id: json['id'] as int?,
    subject: json['subject'] as String?,
    message: json['message'] as String?,
    status: json['status'] as String?,
    date: json['date'] as String?,
  );
}

Map<String, dynamic> _$ComplainsDataToJson(ComplainsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'message': instance.message,
      'status': instance.status,
      'date': instance.date,
    };
