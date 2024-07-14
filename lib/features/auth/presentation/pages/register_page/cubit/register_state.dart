part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  final String? error;
  final String? success;
  const RegisterState({
    this.error,
    this.success,
  });

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();
}

class RegisterError extends RegisterState {
  const RegisterError(String error) : super(error: error);
}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess(String success) : super(success: success);
}

class RegisterWaiting extends RegisterState {
  const RegisterWaiting();
}
