import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class RecentSummaryItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback? onTap;
  final VoidCallback? onMorePressed;

  const RecentSummaryItem({
    super.key,
    required this.item,
    this.onTap,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:  EdgeInsets.symmetric(horizontal: context.mw * 0.04, vertical: context.mh * 0.01),
        leading: Container(
          width: context.mw * 0.08,
          height: context.mw * 0.08,
          decoration: BoxDecoration(
            color: item['color'],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item['icon'],
            color: item['iconColor'],
            size: context.mw * 0.04,
          ),
        ),
        title: Text(
          item['title'],
          style: TextStyle(
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryText,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            0.01.ph(context),
            Text(
              '${item['type']} • ${item['wordCount']}',
              style: TextStyle(
                fontSize: context.mh * 0.012,
                color: AppColor.secondaryText,
              ),
            ),
            0.005.ph(context),
            Text(
              item['date'],
              style: TextStyle(
                fontSize: context.mh * 0.012,
                color: AppColor.tertiaryText,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.more_vert,
            color: AppColor.secondaryText,
          ),
          onPressed: onMorePressed,
        ),
        onTap: onTap,
      ),
    );
  }
}
