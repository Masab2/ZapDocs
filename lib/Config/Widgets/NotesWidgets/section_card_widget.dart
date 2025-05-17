import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget content;
  final VoidCallback? onEdit;

  const SectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.04,
              vertical: context.mh * 0.018,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: context.mw * 0.08,
                  height: context.mw * 0.08,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: AppColor.primaryColor,
                    size: context.mh * 0.02,
                  ),
                ),
                SizedBox(width: context.mw * 0.03),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: context.mh * 0.02,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryText,
                  ),
                ),
                const Spacer(),
                
              ],
            ),
          ),

          // Divider
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.withOpacity(0.08),
          ),

          // Content
          content,
        ],
      ),
    );
  }
}
