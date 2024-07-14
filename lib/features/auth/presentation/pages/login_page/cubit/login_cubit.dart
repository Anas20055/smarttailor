import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(
    this.loginUseCase,
  ) : super(const LoginInitial());

  void login(String email) async {
    emit(const LoginWaiting());
    try {
      await loginUseCase.call(params: email);
      emit(const LoginSuccess(''));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        emit(const LoginError('User with that email doesnt exists'));
      } else {
        emit(const LoginError('Someting went wrong try it again later'));
      }
    }
  }
}
