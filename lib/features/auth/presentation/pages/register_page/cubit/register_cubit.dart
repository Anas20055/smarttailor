import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';
import 'package:smart_tailor/features/auth/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;
  RegisterCubit(
    this.registerUseCase,
  ) : super(const RegisterInitial());

  void register(RegisterRequest request) async {
    emit(const RegisterWaiting());
    try {
      final successMessage = await registerUseCase.call(params: request);
      emit(RegisterSuccess(successMessage));
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        emit(const RegisterError('User with that email already exists'));
      } else {
        emit(const RegisterError('Someting went wrong try it again later'));
      }
    }
  }
}
