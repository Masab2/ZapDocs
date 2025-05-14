import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Model/GetAllNotesModel/get_all_notes_model.dart';
import 'package:zapdocs/ViewModel/NotesViewModel/notes_viewModel.dart';
import 'package:zapdocs/data/Response/status.dart';

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
        Consumer<NotesViewmodel>(builder: (context, model, child) {
          switch (model.apiResponse.status) {
            case Status.loading:
              return CircularProgressIndicator.adaptive();

            case Status.completed:
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: model.apiResponse.data?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  final item =
                      model.apiResponse.data?.data?[index] ?? NotesDataList();
                  return RecentSummaryItem(item: item);
                },
              );
            case Status.error:
              return Text(model.apiResponse.message ?? "");
            default:
              return SizedBox();
          }
        }),
        0.08.ph(context),
      ],
    );
  }
}
