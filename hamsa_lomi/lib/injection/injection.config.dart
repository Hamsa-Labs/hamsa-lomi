// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/create_account/data_sources/create_account_data_source.dart'
    as _i4;
import '../data/create_account/repositories/create_account_repository_impl.dart'
    as _i6;
import '../domain/create_account/repositories/create_account_repository.dart'
    as _i5;
import '../domain/create_account/use_cases/create_account_use_case.dart' as _i7;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i8;
import 'modules.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i4.CreateAccountDataSource>(
      () => _i4.CreateAccountDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i5.CreateAccountRepository>(() =>
      _i6.CreateAccountRepositoryImpl(get<_i4.CreateAccountDataSource>()));
  gh.lazySingleton<_i7.CreateAccountUseCase>(
      () => _i7.CreateAccountUseCase(get<_i5.CreateAccountRepository>()));
  gh.factory<_i8.CreateAccountBloc>(
      () => _i8.CreateAccountBloc(get<_i7.CreateAccountUseCase>()));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
