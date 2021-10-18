// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) {
  return UserLoginResponse(
    status: json['status'] as String?,
    message: json['message'] as String?,
  )
    ..id = json['id'] as int?
    ..name = json['name'] as String?
    ..member_ship_no = json['member_ship_no'] as String?
    ..refer_amount = json['refer_amount'] as int?;
}

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'id': instance.id,
      'name': instance.name,
      'member_ship_no': instance.member_ship_no,
      'refer_amount': instance.refer_amount,
    };
