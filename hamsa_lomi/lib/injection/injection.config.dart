// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// Package imports:
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// Project imports:
import '../data/auth/data_sources/auth_data_source.dart' as _i13;
import '../data/auth/repositories/auth_repository_impl.dart' as _i15;
import '../data/donation_creation/donation_creation.dart' as _i9;
import '../domain/auth/repositories/auth_repository.dart' as _i14;
import '../domain/auth/use_cases/create_account_use_case.dart' as _i16;
import '../domain/auth/use_cases/get_user_changes_stream_use_case.dart' as _i17;
import '../domain/auth/use_cases/sign_in_use_case.dart' as _i18;
import '../domain/auth/use_cases/verify_phone_number_use_case.dart' as _i20;
import '../domain/auth/use_cases/verify_sms_code_use_case.dart' as _i21;
import '../domain/donation_creation/donation_creation.dart' as _i6;
import '../domain/donation_creation/repositories/repositories.dart' as _i4;
import '../presentation/auth/bloc/auth_bloc.dart' as _i22;
import '../presentation/create_account/bloc/create_account_bloc.dart' as _i23;

import '../data/donation_creation/data_sources/donation_creation_data_source.dart'
    as _i7;
import '../data/donation_creation/repositories/donation_creation_repository_impl.dart'
    as _i8;
import '../domain/donation_creation/use_cases/create_hamsa_campain_use_case.dart'
    as _i3;
import '../domain/donation_creation/use_cases/upload_attachment_use_case.dart'
    as _i11;
import '../presentation/donation_creation/bloc/donation_creation/donation_creation_bloc.dart'
    as _i5;
import '../presentation/donation_creation/bloc/image_upload/attachment_upload_bloc.dart'
    as _i12;
import '../presentation/sign_in/blocs/sign_in_with_email/sign_in_email_bloc.dart'
    as _i19;
import '../presentation/sign_in/blocs/sign_in_with_phone/sign_in_with_phone_bloc.dart'
    as _i24;
import 'modules.dart' as _i25; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i11.UploadAttachmentUseCase>(() =>
      _i11.UploadAttachmentUseCase(get<_i4.DonationCreationRepository>()));
  gh.factory<_i12.AttachmentUploadBloc>(
      () => _i12.AttachmentUploadBloc(get<_i11.UploadAttachmentUseCase>()));
  gh.lazySingleton<_i13.AuthDataSource>(
      () => _i13.AuthDataSourceImpl(get<_i10.FirebaseAuth>()));
  gh.lazySingleton<_i14.AuthRepository>(
      () => _i15.AuthRepositoryImpl(get<_i13.AuthDataSource>()));
  gh.lazySingleton<_i16.CreateAccountUseCase>(
      () => _i16.CreateAccountUseCase(get<_i14.AuthRepository>()));
  gh.lazySingleton<_i17.GetUserChangesStreamUseCase>(
      () => _i17.GetUserChangesStreamUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i18.SignInUseCase>(
      () => _i18.SignInUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i19.SignInWithEmailBloc>(
      () => _i19.SignInWithEmailBloc(get<_i18.SignInUseCase>()));
  gh.factory<_i20.VerifyPhoneNumberUseCase>(
      () => _i20.VerifyPhoneNumberUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i21.VerifySmsCodeUseCase>(
      () => _i21.VerifySmsCodeUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i22.AuthBloc>(
      () => _i22.AuthBloc(get<_i17.GetUserChangesStreamUseCase>()));
  gh.factory<_i23.CreateAccountBloc>(
      () => _i23.CreateAccountBloc(get<_i16.CreateAccountUseCase>()));
  gh.factory<_i24.SignInWithPhoneBloc>(() => _i24.SignInWithPhoneBloc(
      get<_i20.VerifyPhoneNumberUseCase>(), get<_i21.VerifySmsCodeUseCase>()));
  return get;
}

class _$RegisterModule extends _i25.RegisterModule {}
