import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection/injection.dart';
import '../bloc/create_account_bloc.dart';
import '../widgets/create_account_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: BlocProvider(
        create: (context) => getIt<CreateAccountBloc>(),
        child: CreateAccountForm(),
      ),
    );
  }
}
