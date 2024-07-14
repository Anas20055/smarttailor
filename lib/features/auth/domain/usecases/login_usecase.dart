import 'package:smart_tailor/core/usecase/usecase.dart';
import 'package:smart_tailor/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase implements UseCases<void, String> {
  final AuthRepo _authRepo;
  LoginUseCase(
    this._authRepo,
  );

  @override
  Future<void> call({String? params}) {
    return _authRepo.login(params!);
  }
}
