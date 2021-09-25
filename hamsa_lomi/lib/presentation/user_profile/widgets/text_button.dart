import 'package:flutter/material.dart';
// import '../../constants/app_assets_constant.dart';

class PrimaryTextButton extends StatelessWidget {
  final String buttonText;
  const PrimaryTextButton({required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x9ad9d9d9),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 80,
      width: MediaQuery.of(context).size.width/2.5,
        child: TextButton(
         child: Text(
             buttonText,
             style: TextStyle(
                 fontSize: 14,
               fontWeight: FontWeight.w600,
               color: Colors.black
           ),
         ),
          onPressed: (){},
        ),

    );
  }
}


class SecondaryTextButton extends StatelessWidget {
  const SecondaryTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

