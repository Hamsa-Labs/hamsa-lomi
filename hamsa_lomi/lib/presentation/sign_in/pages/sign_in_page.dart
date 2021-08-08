// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../bloc/sign_in_bloc.dart';
import '../widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: Replace with hamsa app bar
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => getIt<SignInBloc>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SignInForm(),
        ),
      ),
    );
  }
}
