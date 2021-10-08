// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse _$PaginationResponseFromJson(Map<String, dynamic> json) {
  return PaginationResponse(
    per_page: json['per_page'] as int?,
    items: json['items'] as int?,
    from: json['from'] as int?,
    to: json['to'] as int?,
    next: json['next'] as int?,
    current_page: json['current_page'] as int?,
    total_pages: json['total_pages'] as int?,
    total_count: json['total_count'] as int?,
  );
}

Map<String, dynamic> _$PaginationResponseToJson(PaginationResponse instance) =>
    <String, dynamic>{
      'per_page': instance.per_page,
      'items': instance.items,
      'from': instance.from,
      'to': instance.to,
      'next': instance.next,
      'current_page': instance.current_page,
      'total_pages': instance.total_pages,
      'total_count': instance.total_count,
    };
