// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_assets_constant.dart';

// Project imports:
import '../../../injection/injection.dart';
import '../../constants/app_string_constant.dart';
import '../../share_widgets/appbar_widget.dart';
import '../../theme/hamsa_theme.dart';
import '../bloc/create_account_bloc.dart';
import '../widgets/create_account_form.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: HamsaColors.lightBackground,
      // appBar: HamsaAppBar(
      //   withLogo: false,
      //   appBarText: Text(OnboradingStrings.signup,
      //       style: HamsaTheme.lightTheme.textTheme.headline2),
      // ),
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
