// Flutter imports:
import 'package:flutter/material.dart';

class HamsaRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const HamsaRoundedButton(
      {Key? key, required this.label, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: Theme.of(context).textTheme.button,
      ),
    );
  }
}
