import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injection.dart';
import '../../widgets/hamsa_rounded_button.dart';
import '../bloc/sign_in_bloc.dart';
import 'custom_form_field.dart';

class SignInWithPhoneForm extends StatelessWidget {
  const SignInWithPhoneForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInBloc>(),
      child: Column(
        children: [
          CustomFormField(label: 'Phone', onChanged: (value) {}),
          Expanded(child: SizedBox.shrink()),
          HamsaRoundedButton(label: 'LOGIN', onPressed: null)
        ],
      ),
    );
  }
}
