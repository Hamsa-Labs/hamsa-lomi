// Flutter imports:
import 'package:flutter/material.dart';

class HamsaRoundedButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;

  const HamsaRoundedButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.buttonStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed,
      child: Text(
        label,
      ),
    );
  }
}
