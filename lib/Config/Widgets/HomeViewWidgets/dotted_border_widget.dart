import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/FilePickerViewModel/file_picker_viewModel.dart';

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
            Row(
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: context.mh * 0.025,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryText,
                  ),
                ),
              ],
            ),
            0.01.ph(context),
            Row(
              children: [
                Text(
                  'Upload your documents to get instant summaries',
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: AppColor.secondaryText,
                  ),
                ),
              ],
            ),
          ],
        ),

        // Upload section
        0.025.ph(context),
        Consumer<FilePickerViewmodel>(builder: (context, filePickerVM, child) {
          if (filePickerVM.selectedFile != null) {
            return _buildFilePreview(context, filePickerVM);
          } else {
            return _buildUploadArea(context, filePickerVM);
          }
        }),
      ],
    );
  }

  Widget _buildUploadArea(
      BuildContext context, FilePickerViewmodel filePickerVM) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      dashPattern: const [6, 4],
      color: AppColor.mediumPurple.withOpacity(0.5),
      strokeWidth: 1.5,
      child: InkWell(
        onTap: () async {
          await filePickerVM.pickFile();
        },
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
    );
  }

  Widget _buildFilePreview(
      BuildContext context, FilePickerViewmodel filePickerVM) {

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.mediumPurple.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColor.mediumPurple.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.mediumPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getFileIcon(filePickerVM.selectedFile!.path.split('/').last),
              size: 28,
              color: AppColor.mediumPurple,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filePickerVM.selectedFile!.path.split('/').last,
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  'Ready for processing',
                  style: TextStyle(
                    fontSize: context.mh * 0.014,
                    color: AppColor.secondaryText,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: AppColor.secondaryText,
              size: 20,
            ),
            onPressed: () {
              filePickerVM.clearFile();
            },
          ),
        ],
      ),
    );
  }

  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      default:
        return Icons.insert_drive_file;
    }
  }
}
