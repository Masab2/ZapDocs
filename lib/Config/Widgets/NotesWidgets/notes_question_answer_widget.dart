import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/NotesWidgets/section_card_widget.dart';

class NotesQuestionAnswerWidget extends StatelessWidget {
  final Map<String, dynamic> summary;
  const NotesQuestionAnswerWidget({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: "Questions & Answers",
      icon: Icons.question_answer_outlined,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...summary['Questions & Answers'].entries.map((entry) {
            return Padding(
              padding: EdgeInsets.all(context.mw * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.03,
                      vertical: context.mh * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.mediumPurple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Q: ${entry.key}",
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w600,
                        color: AppColor.mediumPurple,
                      ),
                    ),
                  ),
                  SizedBox(height: context.mh * 0.012),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.mw * 0.03,
                      vertical: context.mh * 0.01,
                    ),
                    width: double.infinity,
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: AppColor.primaryText,
                        height: 1.5,
                      ),
                    ),
                  ),
                  if (entry.key != summary['Questions & Answers'].keys.last)
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: context.mh * 0.01),
                      child: Divider(
                        color: Colors.grey.withOpacity(0.2),
                        thickness: 1,
                      ),
                    ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
