import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/NotesWidgets/section_card_widget.dart';

class NotesKeypointsView extends StatelessWidget {
  final Map<String, dynamic> summary;
  const NotesKeypointsView({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      title: 'Key Points',
      icon: Icons.lightbulb_outline,
      content: Padding(
        padding: EdgeInsets.all(context.mw * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              summary['Key Points'].length,
              (index) => Padding(
                padding: EdgeInsets.only(
                    bottom: index < summary['Key Points'].length - 1
                        ? context.mh * 0.016
                        : 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: context.mh * 0.004),
                      width: context.mw * 0.06,
                      height: context.mw * 0.06,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: context.mh * 0.014,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: context.mw * 0.03),
                    Expanded(
                      child: Text(
                        summary['Key Points'][index],
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: AppColor.primaryText,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
