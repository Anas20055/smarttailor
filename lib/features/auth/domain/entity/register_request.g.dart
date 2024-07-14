// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequest _$RegisterRequestFromJson(Map<String, dynamic> json) =>
    RegisterRequest(
      email: json['email'] as String,
      name: json['name'] as String,
      patronymic: json['patronymic'] as String,
      surname: json['surname'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'patronymic': instance.patronymic,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
    };
