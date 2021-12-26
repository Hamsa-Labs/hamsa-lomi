// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// Project imports:
import '../data/auth/data_sources/auth_data_source.dart' as _i11;
import '../data/auth/repositories/auth_repository_impl.dart' as _i13;
import '../data/donation_creation/data_sources/data_sources.dart' as _i9;
import '../domain/auth/repositories/auth_repository.dart' as _i12;
import '../domain/auth/use_cases/create_account_use_case.dart' as _i14;
import '../domain/auth/use_cases/get_user_changes_stream_use_case.dart' as _i15;
import '../domain/auth/use_cases/sign_in_use_case.dart' as _i16;
import '../domain/auth/use_cases/verify_phone_number_use_case.dart' as _i18;
import '../domain/auth/use_cases/verify_sms_code_use_case.dart' as _i19;
import '../domain/donation_creation/donation_creation.dart' as _i6;
import '../domain/donation_creation/repositories/repositories.dart' as _i4;
import '../presentation/auth/bloc/auth_bloc.dart' as _i20;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i21;

import '../data/donation_creation/data_sources/donation_creation_data_source.dart'
    as _i7;
import '../data/donation_creation/repositories/donation_creation_repository_impl.dart'
    as _i8;
import '../domain/donation_creation/use_cases/create_hamsa_campain_use_case.dart'
    as _i3;
import '../presentation/donation_creation/bloc/donation_creation_bloc.dart'
    as _i5;
import '../presentation/sign_in/blocs/sign_in_with_email/sign_in_email_bloc.dart'
    as _i17;
import '../presentation/sign_in/blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart'
    as _i22;
import 'modules.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.CreateHamsaCampaignUseCase>(() =>
      _i3.CreateHamsaCampaignUseCase(get<_i4.DonationCreationRepository>()));
  gh.factory<_i5.DonationCreationBloc>(
      () => _i5.DonationCreationBloc(get<_i6.CreateHamsaCampaignUseCase>()));
  gh.lazySingleton<_i7.DonationCreationDataSource>(
      () => _i7.DonationCreationDataSourceImpl());
  gh.lazySingleton<_i6.DonationCreationRepository>(() =>
      _i8.DonationCreationRepositoryImpl(
          get<_i9.DonationCreationDataSource>()));
  gh.factory<_i10.FirebaseAuth>(() => registerModule.auth);
  gh.lazySingleton<_i11.AuthDataSource>(
      () => _i11.AuthDataSourceImpl(get<_i10.FirebaseAuth>()));
  gh.lazySingleton<_i12.AuthRepository>(
      () => _i13.AuthRepositoryImpl(get<_i11.AuthDataSource>()));
  gh.lazySingleton<_i14.CreateAccountUseCase>(
      () => _i14.CreateAccountUseCase(get<_i12.AuthRepository>()));
  gh.lazySingleton<_i15.GetUserChangesStreamUseCase>(
      () => _i15.GetUserChangesStreamUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i16.SignInUseCase>(
      () => _i16.SignInUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i17.SignInWithEmailBloc>(
      () => _i17.SignInWithEmailBloc(get<_i16.SignInUseCase>()));
  gh.factory<_i18.VerifyPhoneNumberUseCase>(
      () => _i18.VerifyPhoneNumberUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i19.VerifySmsCodeUseCase>(
      () => _i19.VerifySmsCodeUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i20.AuthBloc>(
      () => _i20.AuthBloc(get<_i15.GetUserChangesStreamUseCase>()));
  gh.factory<_i21.CreateAccountBloc>(
      () => _i21.CreateAccountBloc(get<_i14.CreateAccountUseCase>()));
  gh.factory<_i22.SignInWithPhoneBloc>(() => _i22.SignInWithPhoneBloc(
      get<_i18.VerifyPhoneNumberUseCase>(), get<_i19.VerifySmsCodeUseCase>()));
  return get;
}

class _$RegisterModule extends _i23.RegisterModule {}
