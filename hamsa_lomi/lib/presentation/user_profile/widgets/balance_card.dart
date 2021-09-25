import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';

class BalanceCard extends StatelessWidget {
  final Widget content;

  const BalanceCard({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      height: 90,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: HamsaColors.primarySwatch.shade100,
        child: content,
      ),
    );
  }
}
