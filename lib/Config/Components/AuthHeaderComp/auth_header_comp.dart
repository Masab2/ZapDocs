import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class AuthHeaderComp extends StatelessWidget {
  final String title;
  const AuthHeaderComp({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            width: context.mw * 0.15,
            height: context.mw * 0.15,
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primaryText.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                Icons.bolt,
                size: 32,
                color: AppColor.mediumPurple,
              ),
            ),
          ),
        ),

        0.04.ph(context),

        // Welcome Text
        Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: context.mh * 0.025,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
