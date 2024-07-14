part of 'confirm_otp_cubit.dart';

abstract class ConfirmOtpState extends Equatable {
  final String? error;
  final String? token;
  const ConfirmOtpState({
    this.error,
    this.token,
  });

  @override
  List<Object> get props => [];
}

class ConfirmOtpInitial extends ConfirmOtpState {
  const ConfirmOtpInitial();
}

class ConfirmOtpError extends ConfirmOtpState {
  const ConfirmOtpError(String error) : super(error: error);
}

class ConfirmOtpSuccess extends ConfirmOtpState {
  const ConfirmOtpSuccess(String token) : super(token: token);
}

class ConfirmOtpWaiting extends ConfirmOtpState {
  const ConfirmOtpWaiting();
}
