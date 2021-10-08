// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'our_branche_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OurBranchesResponse _$OurBranchesResponseFromJson(Map<String, dynamic> json) {
  return OurBranchesResponse(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => OurBranchesData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OurBranchesResponseToJson(
        OurBranchesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

OurBranchesData _$OurBranchesDataFromJson(Map<String, dynamic> json) {
  return OurBranchesData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    contact: json['contact'] as String?,
    address: json['address'] as String?,
    state: json['state'] as String?,
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$OurBranchesDataToJson(OurBranchesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contact': instance.contact,
      'address': instance.address,
      'state': instance.state,
      'city': instance.city,
    };
