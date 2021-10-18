// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestimonialsResponse _$TestimonialsResponseFromJson(Map<String, dynamic> json) {
  return TestimonialsResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => TestimonialsData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TestimonialsResponseToJson(
        TestimonialsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

TestimonialsData _$TestimonialsDataFromJson(Map<String, dynamic> json) {
  return TestimonialsData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    rate: json['rate'] as int?,
    imageUrl: json['image_url'] as String?,
    productData: json['product'] == null
        ? null
        : ProductData.fromJson(json['product'] as Map<String, dynamic>),
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$TestimonialsDataToJson(TestimonialsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'image_url': instance.imageUrl,
      'product': instance.productData,
      'message': instance.message,
    };
