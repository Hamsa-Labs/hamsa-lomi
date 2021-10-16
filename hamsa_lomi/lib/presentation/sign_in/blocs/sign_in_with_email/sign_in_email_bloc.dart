// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/params/use_case_param.dart';
import '../../../../domain/sign_in/entities/sign_in_credential.dart';
import '../../../../domain/sign_in/use_cases/sign_in_use_case.dart';
import '../../../core/form_inputs/email_input.dart';
import '../../../core/form_inputs/password_input.dart';

// Project imports:

part 'sign_in_email_event.dart';
part 'sign_in_email_state.dart';

@injectable
class SignInWithEmailBloc
    extends Bloc<SignInWithEmailEvent, SignInWithEmailState> {
  final SignInUseCase _signInUseCase;

  SignInWithEmailBloc(this._signInUseCase) : super(SignInWithEmailState());

  @override
  Stream<SignInWithEmailState> mapEventToState(
    SignInWithEmailEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield _mapEmailChangedToState(state, event.email);
    } else if (event is PasswordChanged) {
      yield _mapPasswordChangedToState(state, event.password);
    } else if (event is SignInSubmitted) {
      yield* _mapSubmittedToState(state);
    }
  }

  SignInWithEmailState _mapEmailChangedToState(
      SignInWithEmailState state, String email) {
    final emailInput = EmailInput.dirty(email);
    return state.copyWith(
        email: emailInput,
        password: state.password,
        status: Formz.validate([emailInput, state.password]));
  }

  SignInWithEmailState _mapPasswordChangedToState(
      SignInWithEmailState state, String password) {
    final passwordInput = PasswordInput.dirty(
        Password(password: password, confirmPassword: password));

    return state.copyWith(
        email: state.email,
        password: passwordInput,
        status: Formz.validate([passwordInput, state.email]));
  }

  Stream<SignInWithEmailState> _mapSubmittedToState(
      SignInWithEmailState state) async* {
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
