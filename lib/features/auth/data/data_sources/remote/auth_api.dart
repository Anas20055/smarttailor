import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:smart_tailor/core/constants/app_api.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: AppApi.baseUri)
abstract class AuthApi {
  factory AuthApi(Dio dio) = _AuthApi;

  @POST(AppApi.registerPath)
  Future<String> register(@Body() RegisterRequest body);

  @POST(AppApi.confirmEmailPath)
  Future<String> confirmOtp(
    @Query('email') String email,
    @Query('code') int otpCode,
  );
  @POST(AppApi.resendConfirmEmailPath)
  Future<void> resendConfirmOtp(
    @Query('email') String email,
  );
  @POST(AppApi.loginPath)
  Future<void> login(
    @Query('email') String email,
  );
}
