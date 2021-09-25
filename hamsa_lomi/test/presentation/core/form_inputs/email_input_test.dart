// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

// Project imports:
import 'package:hamsa_lomi/presentation/core/form_inputs/email_input.dart';

// Project imports:

void main() {
  test('pure constructor works', () {
    final input = EmailInput.pure();
    expect(input.pure, isTrue);
    expect(input.status, FormzInputStatus.pure);
  });

  test('dirty constructor works', () {
    final input = EmailInput.dirty('test-email');
    expect(input.pure, isFalse);
    expect(input.status, FormzInputStatus.invalid);
  });

  test('validator works for empty email', () {
    final input = EmailInput.dirty('');
    expect(input.valid, isFalse);
    expect(input.error, EmailInputError.empty);
  });

  test('validator works for invalid email address', () {
    final input = EmailInput.dirty('invalid-email');
    expect(input.valid, isFalse);
    expect(input.error, EmailInputError.invalid);
  });
}
