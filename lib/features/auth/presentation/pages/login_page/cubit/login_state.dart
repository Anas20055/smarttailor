part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  final String? error;
  final String? success;
  const LoginState({
    this.error,
    this.success,
  });

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  const LoginInitial();
}

class LoginError extends LoginState {
  const LoginError(String error) : super(error: error);
}

class LoginSuccess extends LoginState {
  const LoginSuccess(String success) : super(success: success);
}

class LoginWaiting extends LoginState {
  const LoginWaiting();
}
