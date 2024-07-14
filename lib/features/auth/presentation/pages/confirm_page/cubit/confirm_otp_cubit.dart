import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tailor/features/auth/data/data_sources/local/token_save.dart';
import 'package:smart_tailor/features/auth/domain/entity/confirm_request.dart';
import 'package:smart_tailor/features/auth/domain/usecases/confirm_otp_usecase.dart';
import 'package:smart_tailor/features/auth/domain/usecases/resend_confirm_usecase.dart';

part 'confirm_otp_state.dart';

class ConfirmOtpCubit extends Cubit<ConfirmOtpState> {
  final ResendConfirmUseCase resendConfirmUseCase;
  final ConfirmOtpUseCase confirmOtpUseCase;
  final SessionDataProvider sessionDataProvider;
  ConfirmOtpCubit(
    this.resendConfirmUseCase,
    this.confirmOtpUseCase,
    this.sessionDataProvider,
  ) : super(const ConfirmOtpInitial());
  void confirmOtp(String email, int otpCode) async {
    emit(const ConfirmOtpWaiting());
    try {
      final successMessage = await confirmOtpUseCase.call(
          params: ConfirmRequest(email: email, otpCode: otpCode));
      await sessionDataProvider.setSessionId(successMessage);
      emit(ConfirmOtpSuccess(successMessage));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        emit(const ConfirmOtpError('Код введен неверно, попробуйте еще раз'));
      } else if (e.response?.statusCode == 400) {
        emit(const ConfirmOtpError('Срок действия кода истек'));
      } else {
        emit(const ConfirmOtpError('Someting went wrong try it again later'));
      }
    }
  }

  void resendConfirmOtp(String email) async {
    emit(const ConfirmOtpWaiting());
    try {
      await resendConfirmUseCase.call(params: email);
      emit(const ConfirmOtpInitial());
    } on DioException catch (_) {
      emit(const ConfirmOtpError('Someting went wrong try it again later'));
    }
  }

  void logout() async {
    await sessionDataProvider.setSessionId(null);
    emit(const ConfirmOtpInitial());
  }
}
