// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_request.g.dart';

@JsonSerializable()
class ConfirmRequest extends Equatable {
  final String email;
  final int otpCode;

  const ConfirmRequest({
    required this.email,
    required this.otpCode,
  });

  factory ConfirmRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ConfirmRequestToJson(this);

  @override
  List<Object> get props => [
        email,
        otpCode,
      ];
}
