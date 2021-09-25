import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imgPath;
  const ImageContainer({required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/4,
      height: MediaQuery.of(context).size.width/4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(imgPath),
            fit: BoxFit.fill
        ),
      ),
    );
  }
}
