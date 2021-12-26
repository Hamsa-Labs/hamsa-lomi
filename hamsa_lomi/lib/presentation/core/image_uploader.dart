import 'package:flutter/material.dart';
import '../constants/app_assets_constant.dart';

class ImageUploader extends StatelessWidget {
  const ImageUploader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: 68,
        height: 56,
        decoration: BoxDecoration(
            color: HamsaColors.primaryColor,
            borderRadius: BorderRadius.circular(16)),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
