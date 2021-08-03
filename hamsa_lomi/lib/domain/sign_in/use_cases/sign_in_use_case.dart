import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../../params/use_case_param.dart';
import '../entities/sign_in_credential.dart';
import '../repositories/sign_in_repository.dart';

class SignInUseCase extends BaseUseCase<Unit, UseCaseParam<SignInCredential>> {
  final SignInRepository _signInRepository;

  SignInUseCase(this._signInRepository);

  @override
  Future<Either<Failure, Unit>> call(UseCaseParam<SignInCredential> param) {
    return _signInRepository.signInWithEmail(param.param);
  }
}
