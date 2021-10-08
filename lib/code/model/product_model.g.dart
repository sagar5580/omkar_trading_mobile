// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => ProductData.fromJson(e as Map<String, dynamic>))
        .toList(),
    paginationResponse: json['pagination'] == null
        ? null
        : PaginationResponse.fromJson(
            json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.paginationResponse,
    };

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return ProductData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    imageUrl: (json['images_url'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    description: json['description'] as String?,
    price: json['price'] as String?,
    testimonials: (json['testimonals'] as List<dynamic>?)
        ?.map((e) => TestimonialsData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images_url': instance.imageUrl,
      'testimonals': instance.testimonials,
    };
