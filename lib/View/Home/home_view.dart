import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Widgets/widgets.dart';
import 'package:zapdocs/ViewModel/FilePickerViewModel/file_picker_viewModel.dart';
import 'package:zapdocs/ViewModel/NotesViewModel/notes_viewModel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NotesViewmodel>(context, listen: false).getAllNotesApi();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'ZapDocs',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryColor,
          ),
        ),
        actions: [
          IconButton(
            icon: CircleAvatar(
              radius: 18,
              backgroundColor: AppColor.mediumPurple.withOpacity(0.1),
              child: Icon(
                Icons.person,
                size: 20,
                color: AppColor.mediumPurple,
              ),
            ),
            onPressed: () {},
          ),
          0.02.pw(context),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Provider.of<NotesViewmodel>(context, listen: false).getAllNotesApi();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.02.ph(context),
                DottedBorderWidget(),
                0.03.ph(context),
                QuickActionButtonWidget(),
                0.03.ph(context),
                RecentSummerizeWidget(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          Consumer<FilePickerViewmodel>(builder: (context, watch, child) {
        return Visibility(
          visible: watch.selectedFile == null ? false : true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.05,
              vertical: context.mh * 0.03,
            ),
            child: Consumer<NotesViewmodel>(
                builder: (context, notesViewModel, child) {
              return RoundBtn(
                isLoading: notesViewModel.isLoading,
                title: "Generate Notes",
                onPressed: () {
                  notesViewModel.generateNotes(watch.selectedFile, context);
                },
              );
            }),
          ),
        );
      }),
    );
  }
}
