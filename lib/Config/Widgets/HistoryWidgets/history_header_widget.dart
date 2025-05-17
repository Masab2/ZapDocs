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
              Row(
                children: [
                  // Sort button
                  Container(
                    padding:  EdgeInsets.all(context.mh * 0.012),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.sort,
                          size: 18,
                          color: AppColor.mediumPurple,
                        ),
                        0.01.pw(context),
                        Text(
                          "Sort",
                          style: TextStyle(
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w500,
                            color: AppColor.mediumPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                  0.02.pw(context),
                  // More options button
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.more_horiz,
                      size: 18,
                      color: AppColor.mediumPurple,
                    ),
                  ),
                ],
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
