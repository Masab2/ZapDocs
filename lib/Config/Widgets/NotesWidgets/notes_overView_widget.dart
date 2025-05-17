import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/NotesWidgets/section_card_widget.dart';

class NotesOverviewWidget extends StatelessWidget {
  final Map<String, dynamic> summary;
  const NotesOverviewWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Overview",
      icon: Icons.info_outline,
      content: Padding(
        padding: EdgeInsets.all(context.mw * 0.04),
        child: Text(
          summary['Title'] ?? "",
          style: TextStyle(
            fontSize: context.mh * 0.017,
            fontWeight: FontWeight.w400,
            color: AppColor.primaryText,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
