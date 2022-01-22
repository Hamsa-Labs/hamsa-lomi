// Package imports:
import 'package:formz/formz.dart';

// Project imports:
import '../../../domain/core/core.dart';

enum RequiredCategoryInputError { empty }

class RequiredCategoryInput
    extends FormzInput<DonationCategory?, RequiredCategoryInputError> {
  const RequiredCategoryInput.pure() : super.pure(null);

  RequiredCategoryInput.dirty(DonationCategory value) : super.dirty(value);

  @override
  RequiredCategoryInputError? validator(DonationCategory? value) {
    return value == null ? RequiredCategoryInputError.empty : null;
  }
}
