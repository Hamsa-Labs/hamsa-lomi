// Flutter imports:
import 'package:flutter/material.dart';

class CreationFormField extends StatelessWidget {
  final String label;
  final Widget child;

  const CreationFormField({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.caption,
        ),
        SizedBox(
          height: 4.0,
        ),
        child,
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
