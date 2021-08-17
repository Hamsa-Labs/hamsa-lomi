// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../share_widgets/appbar_widget.dart';
import '../bloc/sign_in_bloc.dart';
import '../widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLogo: true,
        appBarText: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
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
