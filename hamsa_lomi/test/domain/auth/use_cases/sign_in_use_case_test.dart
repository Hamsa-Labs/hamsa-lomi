// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/domain/auth/entities/sign_in_credential.dart';
import 'package:hamsa_lomi/domain/auth/repositories/auth_repository.dart';
import 'package:hamsa_lomi/domain/auth/use_cases/sign_in_use_case.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'package:hamsa_lomi/domain/params/use_case_param.dart';
import 'sign_in_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late SignInUseCase signInUseCase;
  late MockAuthRepository mockSignInRepository;

  setUp(() {
    mockSignInRepository = MockAuthRepository();
    signInUseCase = SignInUseCase(mockSignInRepository);
  });

  final tCredentials = SignInCredential('test@domain.com', 'pass@123');

  test('should call repository to sign a user in', () async {
    when(mockSignInRepository.signInWithEmail(tCredentials))
        .thenAnswer((_) async => await right(unit));

    final result =
        await signInUseCase(UseCaseParam<SignInCredential>(tCredentials));

    verify(mockSignInRepository.signInWithEmail(tCredentials));
    expect(result, right(unit));
  });

  test('should return left side of either if something bad happens', () async {
    when(mockSignInRepository.signInWithEmail(tCredentials))
        .thenAnswer((_) async => await left(Failure()));

    final result =
        await signInUseCase(UseCaseParam<SignInCredential>(tCredentials));

    expect(result, left(Failure()));
  });
}
