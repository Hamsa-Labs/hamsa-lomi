import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  const CustomFormField({
    Key? key,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 4.0,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
