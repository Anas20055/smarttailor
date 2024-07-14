import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smart_tailor/core/constants/app_colors.dart';
import 'package:smart_tailor/core/di/injection_container.dart';
import 'package:smart_tailor/core/routes/routes.dart';
import 'package:smart_tailor/features/auth/data/data_sources/local/token_save.dart';
import 'package:smart_tailor/features/auth/presentation/pages/confirm_page/cubit/confirm_otp_cubit.dart';
import 'package:smart_tailor/features/auth/presentation/pages/login_page/cubit/login_cubit.dart';
import 'package:smart_tailor/features/auth/presentation/pages/register_page/cubit/register_cubit.dart';
import 'package:smart_tailor/features/organization/cubit/organization_cubit.dart';

part "core/theme/theme.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final localRepo = MyLocalRepo();
  await localRepo.checkAuth();
  runApp(MyApp(
    localRepo: localRepo,
  ));
}

class MyApp extends StatelessWidget {
  final MyLocalRepo localRepo;
  const MyApp({
    super.key,
    required this.localRepo,
  });
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<RegisterCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<ConfirmOtpCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LoginCubit>(),
        ),
        BlocProvider(create: (context) => OrganizationCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute(localRepo.isAuth),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: _theme(),
      ),
    );
  }
}
