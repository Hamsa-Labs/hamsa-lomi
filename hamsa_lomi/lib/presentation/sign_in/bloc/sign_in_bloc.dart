// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/params/use_case_param.dart';
import '../../../domain/sign_in/entities/sign_in_credential.dart';
import '../../../domain/sign_in/use_cases/sign_in_use_case.dart';
import '../../core/form_inputs/email_input.dart';
import '../../core/form_inputs/password_input.dart';

part 'sign_in_bloc_event.dart';
part 'sign_in_bloc_state.dart';

@injectable
class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInBlocState());

  @override
  Stream<SignInBlocState> mapEventToState(
    SignInBlocEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield _mapEmailChangedToState(state, event.email);
    } else if (event is PasswordChanged) {
      yield _mapPasswordChangedToState(state, event.password);
    } else if (event is SignInSubmitted) {
      yield* _mapSubmittedToState(state);
    }
  }

  SignInBlocState _mapEmailChangedToState(SignInBlocState state, String email) {
    final emailInput = EmailInput.dirty(email);
    return state.copyWith(
        email: emailInput,
        password: state.password,
        status: Formz.validate([emailInput, state.password]));
  }

  SignInBlocState _mapPasswordChangedToState(
      SignInBlocState state, String password) {
    final passwordInput = PasswordInput.dirty(
        Password(password: password, confirmPassword: password));

    return state.copyWith(
        email: state.email,
        password: passwordInput,
        status: Formz.validate([passwordInput, state.email]));
  }

  Stream<SignInBlocState> _mapSubmittedToState(SignInBlocState state) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      final failureOrSuccess = await _signInUseCase(UseCaseParam<
              SignInCredential>(
          SignInCredential(state.email.value, state.password.value.password)));

      yield failureOrSuccess.fold(
          (l) => state.copyWith(
              status: FormzStatus.submissionFailure, error: l.message),
          (r) => state.copyWith(status: FormzStatus.submissionSuccess));
    }
  }
}
