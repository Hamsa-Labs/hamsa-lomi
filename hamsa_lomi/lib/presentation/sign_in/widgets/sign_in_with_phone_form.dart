// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../widgets/hamsa_rounded_button.dart';
import '../blocs/blocs.dart';
import '../pages/phone_verification_page.dart';

class SignInWithPhoneForm extends StatelessWidget {
  const SignInWithPhoneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInWithPhoneBloc>(),
      child: BlocListener<SignInWithPhoneBloc, SignInWithPhoneState>(
        listener: (context, state) {
          if (state.status == PhoneVerificationStatus.codeSent &&
              state.verificationId != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PhoneVerificationPage(
                    verificationId: state.verificationId!),
              ),
            );
          } else if (state.status == PhoneVerificationStatus.failed) {
            final errorMessage = state.error ?? 'Something went wrong!';
            final snackBar = SnackBar(content: Text(errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<SignInWithPhoneBloc, SignInWithPhoneState>(
          builder: (context, state) {
            return Column(
              children: [
                Text(
                  'Phone',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(
                  height: 4.0,
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    hintText: '',
                  ),
                  initialCountryCode: 'ET',
                  onChanged: (phone) {
                    context
                        .read<SignInWithPhoneBloc>()
                        .add(PhoneNumberChanged(phone.completeNumber));
                  },
                  onCountryChanged: (phone) {},
                ),
                Expanded(child: SizedBox.shrink()),
                SignInButton(
                  state: state,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final SignInWithPhoneState state;

  const SignInButton({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (state.status == PhoneVerificationStatus.inProgress) {
      return CircularProgressIndicator();
    }

    return HamsaRoundedButton(
        label: 'LOGIN',
        onPressed: state.phoneNumber.valid
            ? () {
                context
                    .read<SignInWithPhoneBloc>()
                    .add(PhoneVerificationRequested());
              }
            : null);
  }
}
