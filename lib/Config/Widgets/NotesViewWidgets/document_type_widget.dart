import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';

class DocumentTypeWidget extends StatelessWidget {
  final String docType;
  const DocumentTypeWidget({super.key, required this.docType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.03,
        vertical: context.mh * 0.005,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.description_outlined,
            color: AppColor.primaryColor,
            size: context.mh * 0.018,
          ),
          SizedBox(width: context.mw * 0.01),
          Text(
            ExtractNotesUtil.getDocumentTypeLabel(docType),
            style: TextStyle(
              color: AppColor.primaryColor,
              fontSize: context.mh * 0.014,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
