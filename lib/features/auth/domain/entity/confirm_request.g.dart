// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmRequest _$ConfirmRequestFromJson(Map<String, dynamic> json) =>
    ConfirmRequest(
      email: json['email'] as String,
      otpCode: (json['otpCode'] as num).toInt(),
    );

Map<String, dynamic> _$ConfirmRequestToJson(ConfirmRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otpCode': instance.otpCode,
    };
