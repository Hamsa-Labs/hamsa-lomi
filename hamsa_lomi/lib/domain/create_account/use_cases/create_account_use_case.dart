// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../../params/use_case_param.dart';
import '../entities/user.dart';
import '../repositories/create_account_repository.dart';

@lazySingleton
class CreateAccountUseCase extends BaseUseCase<User, UseCaseParam<User>> {
  final CreateAccountRepository _repository;

  CreateAccountUseCase(this._repository);

  @override
  Future<Either<Failure, User>> call(UseCaseParam<User> param) async {
    return await _repository.createAccount(param.param);
  }
}
