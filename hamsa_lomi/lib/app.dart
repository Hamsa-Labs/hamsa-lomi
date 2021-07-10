// Flutter imports:
import 'package:flutter/material.dart';
import 'presentation/create_account/pages/create_account_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamsa Lomi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateAccountPage(),
    );
  }
}
