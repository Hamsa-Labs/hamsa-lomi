import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final TextButton title;
  final double barHeight = 40.0;
  MainAppBar({Key key, this.title}) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 450.0);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: ClipPath(
          clipper: WaveClip(),
          child: Container(
            color: Color(0xffF4F6F0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: title,
                ),
              ],
            ),
          ),
        ),
        preferredSize: Size.fromHeight(kToolbarHeight + 100));
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final lowPoint = size.height - 30;
    path.lineTo(0, size.height - 150);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, lowPoint / 4);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}


class DrawCircle extends CustomPainter {
  Paint _paint;
  final Color active;

  DrawCircle(this.active) {
    _paint = Paint()
      ..color = active
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), 10.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BuildHeadingText extends StatelessWidget {

  final String text;
  BuildHeadingText(this.text);
  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      style: TextStyle(
          color: HamsaColors.darkGreen,
          fontSize: 20,
          fontFamily: 'Poppins-Bold',
      fontWeight: FontWeight.bold),
    );
  }
}



class BuildBodyText extends StatelessWidget {
  final String text;
  BuildBodyText(this.text);
  @override
  Widget build(BuildContext context) {

    return Text(
      text,
      textAlign: TextAlign.left,
      style: TextStyle(
          color: HamsaColors.darkGreen,
          fontSize: 15,
          fontFamily: 'Poppins-Regular',
          fontWeight: FontWeight.normal),
    );
  }

}

class BuildCircleDot extends StatelessWidget {
  final bool active;
  BuildCircleDot(this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        active? Container(
            child: CustomPaint(painter: DrawCircle(HamsaColors.primaryColor))):
        Container(
            child: CustomPaint(painter: DrawCircle(Colors.grey))) ,

    );
  }
}