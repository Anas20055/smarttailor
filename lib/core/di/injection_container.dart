import 'package:get_it/get_it.dart';

import 'package:dio/dio.dart';
import 'package:smart_tailor/core/constants/app_api.dart';
import 'package:smart_tailor/features/auth/data/data_sources/local/token_save.dart';
import 'package:smart_tailor/features/auth/data/data_sources/remote/auth_api.dart';
import 'package:smart_tailor/features/auth/data/repository/auth_repo_impl.dart';
import 'package:smart_tailor/features/auth/domain/repository/auth_repo.dart';
import 'package:smart_tailor/features/auth/domain/usecases/confirm_otp_usecase.dart';
import 'package:smart_tailor/features/auth/domain/usecases/login_usecase.dart';
import 'package:smart_tailor/features/auth/domain/usecases/register_usecase.dart';
import 'package:smart_tailor/features/auth/domain/usecases/resend_confirm_usecase.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/cubit/confirm_otp_cubit.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/cubit/login_cubit.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/cubit/register_cubit.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

part "dio_client.dart";

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = _buildDioClient(AppApi.baseUri);
  sl.registerSingleton<AuthApi>(AuthApi(dio));
  sl.registerSingleton<SessionDataProvider>(SessionDataProvider());
  sl.registerSingleton<AuthRepo>(AuthRepoImpl(sl()));
  sl.registerSingleton<RegisterUseCase>(RegisterUseCase(sl()));
  sl.registerSingleton<ConfirmOtpUseCase>(ConfirmOtpUseCase(sl()));
  sl.registerSingleton<LoginUseCase>(LoginUseCase(sl()));
  sl.registerSingleton<ResendConfirmUseCase>(ResendConfirmUseCase(sl()));
  sl.registerSingleton<RegisterCubit>(RegisterCubit(sl()));
  sl.registerSingleton<LoginCubit>(LoginCubit(sl()));
  sl.registerSingleton<ConfirmOtpCubit>(ConfirmOtpCubit(sl(), sl(), sl()));
}
