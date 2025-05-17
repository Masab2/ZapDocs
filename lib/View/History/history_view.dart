import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/extract_notes_util.dart';
import 'package:zapdocs/Config/Widgets/widgets.dart';
import 'package:zapdocs/ViewModel/NotesViewModel/notes_viewModel.dart';
import 'package:zapdocs/data/Response/status.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HistoryHeader(),
            SearchAndFilterBar(),
            Expanded(
              child: Consumer<NotesViewmodel>(builder: (context, model, child) {
                switch (model.apiResponse.status) {
                  case Status.loading:
                    return CircularProgressIndicator.adaptive();
                  case Status.completed:
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      itemCount: model.filteredNotes.length,
                      itemBuilder: (context, index) {
                        final item = model.filteredNotes[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RouteNames.notesView,
                                arguments: {
                                  "Notes": ExtractNotesUtil
                                      .extractHeadingsAndContent(item.content),
                                  "docType": item.docType,
                                });
                          },
                          child: RecentSummaryItem(item: item),
                        );
                      },
                    );
                  case Status.error:
                    return Text(model.apiResponse.message ?? "");
                  default:
                    return SizedBox();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
