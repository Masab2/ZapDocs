import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Utils/utils.dart';
import 'package:zapdocs/ViewModel/NotesViewModel/notes_viewModel.dart';

class ImportUrlDialog {
  static void showImportUrlDialog(BuildContext context) {
    final TextEditingController urlController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final FocusNode urlFocusNode = FocusNode();

    showGeneralDialog(
      context: context,
      barrierLabel: "Import URL",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Material(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(context.mw * 0.05),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(context.mw * 0.025),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.link,
                                  color: Colors.orange,
                                  size: context.mh * 0.028,
                                ),
                              ),
                              SizedBox(width: context.mw * 0.03),
                              Text(
                                'Import URL',
                                style: TextStyle(
                                  fontSize: context.mh * 0.022,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryText,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Container(
                              padding: EdgeInsets.all(context.mw * 0.01),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: AppColor.secondaryText,
                                size: context.mh * 0.018,
                              ),
                            ),
                            constraints: BoxConstraints(),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      SizedBox(height: context.mh * 0.02),
                      // Description
                      Text(
                        'Enter the URL of any word document, Pdf, or PowerPoint presentation to import',
                        style: TextStyle(
                          fontSize: context.mh * 0.016,
                          color: AppColor.secondaryText,
                        ),
                      ),
                      SizedBox(height: context.mh * 0.025),
                      // URL Type Selection

                      // URL Input Field
                      Form(
                        key: formKey,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            controller: urlController,
                            focusNode: urlFocusNode,
                            decoration: InputDecoration(
                              hintText: 'Paste URL here',
                              hintStyle: TextStyle(
                                color: AppColor.secondaryText.withOpacity(0.6),
                                fontSize: context.mh * 0.016,
                              ),
                              prefixIcon: Icon(
                                Icons.link,
                                color: Colors.orange,
                                size: context.mh * 0.022,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.paste,
                                  color: AppColor.mediumPurple,
                                  size: context.mh * 0.022,
                                ),
                                onPressed: () async {},
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: context.mh * 0.018,
                              ),
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.go,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a URL';
                              }

                              bool validURL =
                                  Uri.tryParse(value)?.hasAbsolutePath ?? false;
                              if (!validURL) {
                                return 'Please enter a valid URL';
                              }

                              return null;
                            },
                            onFieldSubmitted: (_) {},
                          ),
                        ),
                      ),
                      SizedBox(height: context.mh * 0.01),
                      // URL validation message
                      Text(
                        'Make sure the URL is accessible and contains valid content',
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: AppColor.secondaryText.withOpacity(0.7),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(height: context.mh * 0.025),
                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: context.mh * 0.018),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  color: AppColor.secondaryText,
                                  fontSize: context.mh * 0.016,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: context.mw * 0.03),
                          Consumer<NotesViewmodel>(
                              builder: (context, model, child) {
                            return Expanded(
                              child: RoundBtn(
                                isLoading: model.isImportLoading,
                                title: 'Import',
                                onPressed: () {
                                  if (urlController.text.isEmpty) {
                                    Utils.showCustomSnackBar(context, "Please enter a URL", "Error");
                                  }else{
                                    model.generateNotesWithUrl(
                                      urlController.text, context);
                                  }
                                },
                                backgroundColor: AppColor.amber,
                              ),
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
