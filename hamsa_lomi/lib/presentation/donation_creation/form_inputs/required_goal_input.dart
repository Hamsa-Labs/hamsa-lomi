// Package imports:
import 'package:formz/formz.dart';

enum RequiredGoalInputError { lessThanMinimum }

class RequiredGoalInput extends FormzInput<double, RequiredGoalInputError> {
  const RequiredGoalInput.pure() : super.pure(0);

  RequiredGoalInput.dirty(double value) : super.dirty(value);

  @override
  RequiredGoalInputError? validator(double value) {
    return value <= 0 ? RequiredGoalInputError.lessThanMinimum : null;
  }
}
