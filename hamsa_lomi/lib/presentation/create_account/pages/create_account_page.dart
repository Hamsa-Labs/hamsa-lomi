// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamsa_lomi/presentation/constants/app_string_constant.dart';
import 'package:hamsa_lomi/presentation/theme/hamsa_theme.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../share_widgets/appbar_widget.dart';
import '../bloc/create_account_bloc.dart';
import '../widgets/create_account_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HamsaAppBar(
        withLogo: true,
        appBarText: Text(OnboradingStrings.signup,
        textAlign: TextAlign.left,
        style: HamsaTheme.lightTheme.textTheme.headline5),
      ),
      body: BlocProvider(
        create: (context) => getIt<CreateAccountBloc>(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: CreateAccountForm(),
        ),
      ),
    );
  }
}
