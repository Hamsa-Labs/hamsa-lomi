import 'package:flutter/material.dart';
import 'package:hamsa_lomi/presentation/constants/app_assets_constant.dart';

class SettingContainer extends StatelessWidget {
  final String containerName;
  const SettingContainer({required this.containerName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: HamsaColors.lightGray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Text
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              containerName,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff485550)),
            ),
          ),

          //Back Icon
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 20,
                color: Color(0xff485550),
              ),
            ),
          )
        ],
      ),
    );
  }
}
