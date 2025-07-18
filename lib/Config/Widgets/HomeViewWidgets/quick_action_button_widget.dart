import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/Dialog/import_url_dialog.dart';
import 'package:zapdocs/Config/Widgets/HomeViewWidgets/quick_action_card.dart';

class QuickActionButtonWidget extends StatelessWidget {
  const QuickActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryText,
          ),
        ),
        0.013.ph(context),
        Row(
          children: [
            QuickActionCard(
              icon: Icons.link,
              label: 'Import URL',
              color: Colors.orange,
              onTap: () {
                ImportUrlDialog.showImportUrlDialog(context);
              },
            ),
            0.02.pw(context),
            QuickActionCard(
              icon: Icons.history,
              label: 'History',
              color: Colors.green,
              onTap: () {
                Navigator.pushNamed(context, RouteNames.historyView);
              },
            ),
          ],
        ),
      ],
    );
  }
}
