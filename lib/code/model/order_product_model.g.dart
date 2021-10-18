// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderProductModel _$OrderProductModelFromJson(Map<String, dynamic> json) {
  return OrderProductModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => OrderProductData.fromJson(e as Map<String, dynamic>))
        .toList(),
    paginationResponse: json['pagination'] == null
        ? null
        : PaginationResponse.fromJson(
            json['pagination'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderProductModelToJson(OrderProductModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'pagination': instance.paginationResponse,
    };

OrderProductData _$OrderProductDataFromJson(Map<String, dynamic> json) {
  return OrderProductData(
    order_date: json['order_date'] as String?,
    productData: json['product'] == null
        ? null
        : ProductData.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderProductDataToJson(OrderProductData instance) =>
    <String, dynamic>{
      'order_date': instance.order_date,
      'product': instance.productData,
    };
