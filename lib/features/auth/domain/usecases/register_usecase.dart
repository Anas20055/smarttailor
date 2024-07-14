import 'package:smart_tailor/core/usecase/usecase.dart';
import 'package:smart_tailor/features/auth/domain/entity/register_request.dart';
import 'package:smart_tailor/features/auth/domain/repository/auth_repo.dart';

class RegisterUseCase implements UseCases<String, RegisterRequest> {
  final AuthRepo _authRepo;
  RegisterUseCase(
    this._authRepo,
  );

  @override
  Future<String> call({RegisterRequest? params}) {
    return _authRepo.register(params!);
  }
}
