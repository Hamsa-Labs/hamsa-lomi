// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../../params/use_case_param.dart';
import '../entities/verify_phone_number_param.dart';
import '../repositories/auth_repository.dart';

@injectable
class VerifyPhoneNumberUseCase
    extends BaseUseCase<Unit, UseCaseParam<VerifyPhoneNumberParam>> {
  final AuthRepository _repository;

  VerifyPhoneNumberUseCase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(
      UseCaseParam<VerifyPhoneNumberParam> param) async {
    await _repository.signInWithPhone(param.param);
    return right(unit);
  }
}
