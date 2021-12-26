// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/auth/entities/create_user.dart';
import '../../../domain/auth/use_cases/create_account_use_case.dart';
import '../../../domain/params/use_case_param.dart';
import '../../core/form_inputs/email_input.dart';
import '../../core/form_inputs/password_input.dart';
import '../../core/form_inputs/required_text_input.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

@injectable
class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final CreateAccountUseCase _useCase;

  CreateAccountBloc(this._useCase) : super(CreateAccountState());

  @override
  Stream<CreateAccountState> mapEventToState(
    CreateAccountEvent event,
  ) async* {
    if (event is UsernameChanged) {
      yield _mapUsernameChangedToState(event.username, state);
    } else if (event is EmailChanged) {
      yield _emailChangedToState(event.email, state);
    } else if (event is PasswordChanged) {
      yield _passwordChangedToState(event.password);
    } else if (event is ConfirmPasswordChanged) {
      yield _confirmPasswordChangedToState(event.confirmPassword);
    } else if (event is CreateAccountSubmitted) {
      yield* _mapSubmittedToState(state);
    }
  }

  CreateAccountState _mapUsernameChangedToState(
      String username, CreateAccountState state) {
    final usernameInput = RequiredTextInput.dirty(username);
    return state.copyWith(
        username: usernameInput,
        error: null,
        status: Formz.validate([usernameInput, state.email, state.password]));
  }

  CreateAccountState _emailChangedToState(
      String email, CreateAccountState state) {
    final emailInput = EmailInput.dirty(email);
    return state.copyWith(
        email: emailInput,
        error: null,
        status: Formz.validate([emailInput, state.username, state.password]));
  }

  CreateAccountState _passwordChangedToState(String password) {
    final passwordInput = PasswordInput.dirty(Password(
        password: password,
        confirmPassword: state.password.value.confirmPassword));
    return state.copyWith(
        password: passwordInput,
        error: null,
        status: Formz.validate([passwordInput, state.username, state.email]));
  }

  CreateAccountState _confirmPasswordChangedToState(String confirmPassword) {
    final passwordInput = PasswordInput.dirty(Password(
        confirmPassword: confirmPassword,
        password: state.password.value.password));
    return state.copyWith(
        password: passwordInput,
        error: null,
        status: Formz.validate([passwordInput, state.username, state.email]));
  }

  Stream<CreateAccountState> _mapSubmittedToState(
      CreateAccountState state) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      final failureOrSuccess = await _useCase(
        UseCaseParam<CreateUser>(
          CreateUser(
              username: state.username.value,
              email: state.email.value,
              password: state.password.value.password),
        ),
      );

      yield* failureOrSuccess.fold((l) async* {
        yield state.copyWith(
            status: FormzStatus.submissionFailure, error: l.message);
      }, (r) async* {
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      });
    }
  }
}
