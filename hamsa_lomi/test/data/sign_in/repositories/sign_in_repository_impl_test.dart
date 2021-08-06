// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hamsa_lomi/data/core/exceptions/server_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/sign_in/data_sources/sign_in_data_source.dart';
import 'package:hamsa_lomi/data/sign_in/repositories/sign_in_repository_impl.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'package:hamsa_lomi/domain/sign_in/entities/sign_in_credential.dart';
import 'sign_in_repository_impl_test.mocks.dart';

@GenerateMocks([SignInDataSource])
void main() {
  late SignInRepositoryImpl signInRepositoryImpl;
  late MockSignInDataSource mockSignInDataSource;

  setUp(() {
    mockSignInDataSource = MockSignInDataSource();
    signInRepositoryImpl = SignInRepositoryImpl(mockSignInDataSource);
  });

  final tCredential = SignInCredential('test@domain.com', 'pass@123');

  test('should call data source to sign in a user with email and password',
      () async {
    when(
      mockSignInDataSource.signInWithEmail(
          tCredential.email, tCredential.password),
    ).thenAnswer((_) async => null);

    final result = await signInRepositoryImpl.signInWithEmail(tCredential);

    verify(mockSignInDataSource.signInWithEmail(
        tCredential.email, tCredential.password));

    expect(result, right(unit));
  });

  test('should return left side of either when an exception is thrown',
      () async {
    when(mockSignInDataSource.signInWithEmail(
            tCredential.email, tCredential.password))
        .thenThrow(ServerException());

    final result = await signInRepositoryImpl.signInWithEmail(tCredential);

    expect(result, left(Failure()));
  });
}
