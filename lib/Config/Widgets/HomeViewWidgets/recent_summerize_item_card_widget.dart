import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';
import 'package:zapdocs/Model/GetAllNotesModel/get_all_notes_model.dart';

class RecentSummaryItem extends StatelessWidget {
  final NotesDataList item;
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
    var title =
        ExtractNotesUtil.extractHeadingsAndContent(item.content)['Title'];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Document icon with colored background
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColor.mediumPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.description_outlined,
                  size: 22,
                  color: AppColor.mediumPurple,
                ),
              ),
              0.025.pw(context),
              // Content area
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title with correct styling
                    Text(
                      title ?? "Untitled Document",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryText,
                      ),
                    ),
                    0.004.ph(context),
                    // Document type and date
                    Row(
                      children: [
                        Text(
                          ExtractNotesUtil.getDocumentTypeLabel(item.docType),
                          style: TextStyle(
                            fontSize: context.mh * 0.014,
                            color: AppColor.secondaryText,
                          ),
                        ),
                        0.015.pw(context),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColor.secondaryText.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        0.015.pw(context),
                        Text(
                          ExtractNotesUtil.formatDate(item.date),
                          style: TextStyle(
                            fontSize: context.mh * 0.014,
                            color: AppColor.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // More options button
              // IconButton(
              //   icon: Icon(
              //     Icons.more_vert,
              //     color: AppColor.secondaryText,
              //     size: 20,
              //   ),
              //   padding: EdgeInsets.zero,
              //   constraints: const BoxConstraints(),
              //   onPressed: onMorePressed,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
