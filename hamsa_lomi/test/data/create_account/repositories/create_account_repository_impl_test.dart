// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:hamsa_lomi/data/create_account/data_sources/create_account_data_source.dart';
import 'package:hamsa_lomi/data/create_account/models/user_model.dart';
import 'package:hamsa_lomi/data/create_account/repositories/create_account_repository_impl.dart';
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

    await repositoryImpl.createAccount(tUserModel);

    verify(mock.createAccount(tUserModel));
  });
}
