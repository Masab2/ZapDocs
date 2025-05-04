import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class DottedBorderWidget extends StatelessWidget {
  const DottedBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: context.mh * 0.025,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryText,
              ),
            ),
            0.01.ph(context),
            Text(
              'Upload your documents to get instant summaries',
              style: TextStyle(
                fontSize: context.mh * 0.016,
                color: AppColor.secondaryText,
              ),
            ),
          ],
        ),

        // Upload section
        0.025.ph(context),
        DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(16),
          dashPattern: const [6, 4],
          color: AppColor.mediumPurple.withOpacity(0.5),
          strokeWidth: 1.5,
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                color: AppColor.mediumPurple.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.mediumPurple.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.upload_file,
                      size: 32,
                      color: AppColor.mediumPurple,
                    ),
                  ),
                  0.02.ph(context),
                  Text(
                    'Upload your document',
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryText,
                    ),
                  ),
                  0.01.ph(context),
                  Text(
                    'PDF, DOC, PPT files supported',
                    style: TextStyle(
                      fontSize: context.mh * 0.014,
                      color: AppColor.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
