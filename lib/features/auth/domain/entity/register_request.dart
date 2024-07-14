// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest extends Equatable {
  final String email;
  final String name;
  final String patronymic;
  final String surname;
  final String phoneNumber;
  const RegisterRequest({
    required this.email,
    required this.name,
    required this.patronymic,
    required this.surname,
    required this.phoneNumber,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);

  @override
  List<Object> get props {
    return [
      email,
      name,
      patronymic,
      surname,
      phoneNumber,
    ];
  }
}
