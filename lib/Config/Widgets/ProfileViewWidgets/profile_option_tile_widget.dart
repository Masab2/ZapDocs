import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';


class ProfileOptionTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const ProfileOptionTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: context.mh * 0.026,
              color: iconColor ?? AppColor.primaryColor,
            ),
            SizedBox(width: context.mw * 0.04),
            Text(
              title,
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColor.primaryText,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: context.mh * 0.018,
              color: AppColor.secondaryText,
            ),
          ],
        ),
      ),
    );
  }
}

