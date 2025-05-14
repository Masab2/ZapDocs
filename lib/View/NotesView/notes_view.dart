import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        
        title: Text(
          'Your Notes',
          style: TextStyle(
            fontSize: context.mh * 0.022,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryText,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(context.mw * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Document Type Indicator
              Container(
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
                      'PDF Document',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: context.mh * 0.014,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.mh * 0.025),

              // Title Section
              Text(
                'Title',
                style: TextStyle(
                  fontSize: context.mh * 0.022,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: context.mh * 0.01),
              Container(
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  widget.summary['Title'] ?? "",
                  style: TextStyle(
                    fontSize: context.mh * 0.022,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryText,
                  ),
                ),
              ),

              SizedBox(height: context.mh * 0.03),

              // Key Points Section
              Text(
                'Key Points',
                style: TextStyle(
                  fontSize: context.mh * 0.022,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: context.mh * 0.01),
              Container(
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                      widget.summary['Key Points'].length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: context.mh * 0.012),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 6),
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ),
                            SizedBox(width: context.mw * 0.03),
                            Expanded(
                              child: Text(
                                widget.summary['Key Points'][index],
                                style: TextStyle(
                                  fontSize: context.mh * 0.016,
                                  color: AppColor.primaryText,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: context.mh * 0.03),

              // Conclusion Section
              Text(
                'Conclusion',
                style: TextStyle(
                  fontSize: context.mh * 0.022,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: context.mh * 0.01),
              Container(
                padding: EdgeInsets.all(context.mw * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  widget.summary['Conclusion'],
                  style: TextStyle(
                    fontSize: context.mh * 0.016,
                    color: AppColor.primaryText,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.06,
          vertical: context.mh * 0.02,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildActionButton(
              context,
              Icons.copy_outlined,
              'Copy',
              () {
                // Copy functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Notes copied to clipboard'),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            _buildActionButton(
              context,
              Icons.edit_outlined,
              'Edit',
              () {
                // Edit functionality
              },
            ),
            _buildActionButton(
              context,
              Icons.refresh_outlined,
              'Regenerate',
              () {
                // Regenerate functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Regenerating notes...'),
                    duration: const Duration(seconds: 2),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
            _buildActionButton(
              context,
              Icons.download_outlined,
              'Save',
              () {
                // Save functionality
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Saving notes...'),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon, color: AppColor.primaryColor),
          onPressed: onPressed,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: context.mh * 0.012,
            color: AppColor.secondaryText,
          ),
        ),
      ],
    );
  }
}
