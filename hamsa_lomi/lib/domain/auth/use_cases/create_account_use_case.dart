// Package imports:
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../core/failure.dart';
import '../../core/use_cases/base_use_case.dart';
import '../../params/use_case_param.dart';
import '../entities/create_user.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class CreateAccountUseCase
    extends BaseUseCase<CreateUser, UseCaseParam<CreateUser>> {
  final AuthRepository _repository;

  CreateAccountUseCase(this._repository);

  @override
  Future<Either<Failure, CreateUser>> call(
      UseCaseParam<CreateUser> param) async {
    return await _repository.createAccount(param.param);
  }
}
