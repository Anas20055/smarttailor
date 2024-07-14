// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:smart_tailor/features/auth/data/data_sources/remote/auth_api.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';
import 'package:smart_tailor/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthApi _api;
  AuthRepoImpl(
    this._api,
  );
  @override
  Future<String> register(RegisterRequest registerRequest) async {
    final httpResponse = await _api.register(registerRequest);
    return httpResponse;
  }

  @override
  Future<String> confirmOtp(String email, int otpCode) async {
    final httpResponse = await _api.confirmOtp(email, otpCode);
    return httpResponse;
  }

  @override
  Future<void> login(String email) async {
    final httpResponse = await _api.login(email);
    return httpResponse;
  }

  @override
  Future<void> resendConfirmOtp(String email) async {
    final httpResponse = await _api.resendConfirmOtp(email);
    return httpResponse;
  }
}
