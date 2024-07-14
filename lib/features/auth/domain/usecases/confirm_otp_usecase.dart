import 'package:smart_tailor/core/usecase/usecase.dart';
import 'package:smart_tailor/features/auth/domain/entity/confirm_request.dart';

import 'package:smart_tailor/features/auth/domain/repository/auth_repo.dart';

class ConfirmOtpUseCase implements UseCases<String, ConfirmRequest> {
  final AuthRepo _authRepo;
  ConfirmOtpUseCase(
    this._authRepo,
  );

  @override
  Future<String> call({ConfirmRequest? params}) {
    return _authRepo.confirmOtp(params!.email, params.otpCode);
  }
}
