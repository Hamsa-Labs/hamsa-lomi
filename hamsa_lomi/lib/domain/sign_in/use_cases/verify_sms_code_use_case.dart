// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../../params/use_case_param.dart';
import '../entities/verify_sms_code_param.dart';
import '../repositories/sign_in_repository.dart';

@injectable
class VerifySmsCodeUseCase
    extends BaseUseCase<Unit, UseCaseParam<VerifySmsCodeParam>> {
  final SignInRepository _signInRepository;

  VerifySmsCodeUseCase(this._signInRepository);

  @override
  Future<Either<Failure, Unit>> call(
      UseCaseParam<VerifySmsCodeParam> useCaseParam) {
    return _signInRepository.verifySmsCode(useCaseParam.param);
  }
}
