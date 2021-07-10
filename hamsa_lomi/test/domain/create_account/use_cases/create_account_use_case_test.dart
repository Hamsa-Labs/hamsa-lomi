import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'package:hamsa_lomi/domain/create_account/entities/user.dart';
import 'package:hamsa_lomi/domain/create_account/repositories/create_account_repository.dart';
import 'package:hamsa_lomi/domain/create_account/use_cases/create_account_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'create_account_use_case_test.mocks.dart';

@GenerateMocks([CreateAccountRepository])
void main() {
  late CreateAccountUseCase useCase;
  late MockCreateAccountRepository repository;

  setUp(() {
    repository = MockCreateAccountRepository();
    useCase = CreateAccountUseCase(repository);
  });

  final tUser = User(
      username: 'testusername', email: 'test@domain.com', password: 'pass@123');

  test('should call repository method', () async {
    when(repository.createAccount(tUser))
        .thenAnswer((_) async => await right(tUser));

    final result = await useCase.createAccount(tUser);

    expect(result, right(tUser));
    verify(repository.createAccount(tUser));
  });

  test('should return failure when something goes wrong', () async {
    when(repository.createAccount(tUser))
        .thenAnswer((_) async => await left(Failure()));

    final result = await useCase.createAccount(tUser);

    expect(result, left(Failure()));
    verify(repository.createAccount(tUser));
  });
}
