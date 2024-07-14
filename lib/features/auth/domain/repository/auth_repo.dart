import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';

abstract class AuthRepo {
  Future<String> register(RegisterRequest registerRequest);
  Future<String> confirmOtp(String email, int otpCode);
  Future<void> resendConfirmOtp(String email);
  Future<void> login(String email);
}
