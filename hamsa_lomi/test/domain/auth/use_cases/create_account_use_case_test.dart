// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/domain/auth/entities/create_user.dart';
import 'package:hamsa_lomi/domain/auth/repositories/auth_repository.dart';
import 'package:hamsa_lomi/domain/auth/use_cases/create_account_use_case.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'package:hamsa_lomi/domain/params/use_case_param.dart';
import 'create_account_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late CreateAccountUseCase useCase;
  late MockAuthRepository repository;

  setUp(() {
    repository = MockAuthRepository();
    useCase = CreateAccountUseCase(repository);
  });

  final tUser = CreateUser(
      username: 'testusername', email: 'test@domain.com', password: 'pass@123');

  test('should call repository method', () async {
    when(repository.createAccount(tUser))
        .thenAnswer((_) async => await right(tUser));

    final result = await useCase(UseCaseParam<CreateUser>(tUser));

    expect(result, right(tUser));
    verify(repository.createAccount(tUser));
  });

  test('should return failure when something goes wrong', () async {
    when(repository.createAccount(tUser))
        .thenAnswer((_) async => await left(Failure()));

    final result = await useCase(UseCaseParam<CreateUser>(tUser));

    expect(result, left(Failure()));
    verify(repository.createAccount(tUser));
  });
}
