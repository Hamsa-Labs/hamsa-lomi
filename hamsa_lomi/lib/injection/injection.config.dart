// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/create_account/data_sources/create_account_data_source.dart'
    as _i8;
import '../data/create_account/repositories/create_account_repository_impl.dart'
    as _i10;
import '../data/sign_in/data_sources/sign_in_data_source.dart' as _i4;
import '../data/sign_in/repositories/sign_in_repository_impl.dart' as _i6;
import '../domain/create_account/repositories/create_account_repository.dart'
    as _i9;
import '../domain/create_account/use_cases/create_account_use_case.dart'
    as _i11;
import '../domain/sign_in/repositories/sign_in_repository.dart' as _i5;
import '../domain/sign_in/use_cases/sign_in_use_case.dart' as _i7;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i13;
import '../presentation/sign_in/bloc/sign_in_bloc.dart' as _i12;
import 'modules.dart' as _i14; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i4.SignInDataSource>(
      () => _i4.SignInDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i5.SignInRepository>(
      () => _i6.SignInRepositoryImpl(get<_i4.SignInDataSource>()));
  gh.factory<_i7.SignInUseCase>(
      () => _i7.SignInUseCase(get<_i5.SignInRepository>()));
  gh.lazySingleton<_i8.CreateAccountDataSource>(
      () => _i8.CreateAccountDataSourceImpl(get<_i3.FirebaseAuth>()));
  gh.lazySingleton<_i9.CreateAccountRepository>(() =>
      _i10.CreateAccountRepositoryImpl(get<_i8.CreateAccountDataSource>()));
  gh.lazySingleton<_i11.CreateAccountUseCase>(
      () => _i11.CreateAccountUseCase(get<_i9.CreateAccountRepository>()));
  gh.factory<_i12.SignInBloc>(() => _i12.SignInBloc(get<_i7.SignInUseCase>()));
  gh.factory<_i13.CreateAccountBloc>(
      () => _i13.CreateAccountBloc(get<_i11.CreateAccountUseCase>()));
  return get;
}

class _$RegisterModule extends _i14.RegisterModule {}
