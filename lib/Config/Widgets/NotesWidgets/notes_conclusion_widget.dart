import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/NotesWidgets/section_card_widget.dart';

class NotesConclusionWidget extends StatelessWidget {
  final Map<String, dynamic> summary;
  const NotesConclusionWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Conclusion",
      icon: Icons.check_circle_outline,
      content: Padding(
        padding: EdgeInsets.all(context.mw * 0.04),
        child: Text(
          summary['Conclusion'],
          style: TextStyle(
            fontSize: context.mh * 0.016,
            color: AppColor.primaryText,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
