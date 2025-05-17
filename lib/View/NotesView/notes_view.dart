import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/widgets.dart';

class NotesView extends StatefulWidget {
  final Map<String, dynamic> summary;
  final String docType;
  const NotesView({super.key, required this.summary, required this.docType});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FC),
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.025, vertical: context.mw * 0.025),
            child: Column(
              spacing: context.mh * 0.02,
              children: [
                NotesOverviewWidget(summary: widget.summary),
                NotesKeypointsView(summary: widget.summary),
                NotesQuestionAnswerWidget(summary: widget.summary),
                NotesConclusionWidget(summary: widget.summary),
                SizedBox(height: context.mh * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
