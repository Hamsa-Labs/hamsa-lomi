// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
// Project imports:
import 'package:hamsa_lomi/data/core/exceptions/server_exception.dart';
import 'package:hamsa_lomi/data/create_account/data_sources/create_account_data_source.dart';
import 'package:hamsa_lomi/data/create_account/models/user_model.dart';
import 'package:hamsa_lomi/data/create_account/repositories/create_account_repository_impl.dart';
import 'package:hamsa_lomi/domain/core/failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'create_account_repository_impl_test.mocks.dart';

@GenerateMocks([CreateAccountDataSource])
void main() {
  late CreateAccountRepositoryImpl repositoryImpl;
  late MockCreateAccountDataSource mock;

  setUp(() {
    mock = MockCreateAccountDataSource();
    repositoryImpl = CreateAccountRepositoryImpl(mock);
  });

  final tUserModel = UserModel(
      username: 'testusername',
      email: 'test@domain.com',
      password: 'pass@1234');

  test('should call data source method', () async {
    when(mock.createAccount(tUserModel)).thenAnswer((_) async => tUserModel);

    final result = await repositoryImpl.createAccount(tUserModel);

    verify(mock.createAccount(tUserModel));
    expect(result, right(tUserModel));
  });

  test('should return a failure when something goes wrong', () async {
    when(mock.createAccount(tUserModel)).thenThrow(ServerException());

    final result = await repositoryImpl.createAccount(tUserModel);

    expect(result, left(Failure()));
  });
}
