// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_earning_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EarningResponse _$EarningResponseFromJson(Map<String, dynamic> json) {
  return EarningResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => EarningData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EarningResponseToJson(EarningResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

EarningData _$EarningDataFromJson(Map<String, dynamic> json) {
  return EarningData(
    id: json['id'] as int?,
    refer: json['refer'] == null
        ? null
        : Refer.fromJson(json['refer'] as Map<String, dynamic>),
    referPercentage: json['referPercentage'] as int?,
    referAmount: json['refer_amount'] as int?,
    product: json['product'] == null
        ? null
        : Product.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EarningDataToJson(EarningData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'refer': instance.refer,
      'referPercentage': instance.referPercentage,
      'refer_amount': instance.referAmount,
      'product': instance.product,
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    price: json['price'] as int?,
    imagesUrl:
        (json['imagesUrl'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'imagesUrl': instance.imagesUrl,
    };

Refer _$ReferFromJson(Map<String, dynamic> json) {
  return Refer(
    id: json['id'] as int?,
    name: json['name'] as String?,
    referId: json['refer_id'] as int?,
    referEarning: json['referEarning'],
    referAmount: json['referAmount'] as int?,
    membership_no: json['membership_no'] as String?,
  );
}

Map<String, dynamic> _$ReferToJson(Refer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'refer_id': instance.referId,
      'referEarning': instance.referEarning,
      'referAmount': instance.referAmount,
      'membership_no': instance.membership_no,
    };
