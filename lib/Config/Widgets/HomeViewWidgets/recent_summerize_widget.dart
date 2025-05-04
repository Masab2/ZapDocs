import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

import '../widgets.dart';

class RecentSummerizeWidget extends StatelessWidget {
  final List<Map<String, dynamic>> recentSummaries;
  const RecentSummerizeWidget({super.key, required this.recentSummaries});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent Summaries',
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryText,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: context.mh * 0.014,
                  fontWeight: FontWeight.w600,
                  color: AppColor.mediumPurple,
                ),
              ),
            ),
          ],
        ),
        0.01.ph(context),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentSummaries.length,
          itemBuilder: (context, index) {
            final item = recentSummaries[index];
            return RecentSummaryItem(item: item);
          },
        ),
        0.08.ph(context),
      ],
    );
  }
}
