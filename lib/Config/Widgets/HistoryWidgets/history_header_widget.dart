import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class HistoryHeader extends StatelessWidget {
  const HistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.mw * 0.06,
        right: context.mw * 0.06,
        bottom: context.mh * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "History",
                style: TextStyle(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w700,
                  color: AppColor.primaryText,
                ),
              ),
            ],
          ),
          0.01.ph(context),
          // Subtitle
          Text(
            "View and manage your document history",
            style: TextStyle(
              fontSize: context.mh * 0.016,
              color: AppColor.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
