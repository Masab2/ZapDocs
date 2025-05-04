import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import '../../Config/Widgets/widgets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Mock data for recent summaries
  final List<Map<String, dynamic>> _recentSummaries = [
    {
      'title': 'Project Proposal',
      'type': 'PDF',
      'date': '2 hours ago',
      'wordCount': '368 words',
      'color': const Color(0xFFE8F5E9),
      'icon': Icons.picture_as_pdf,
      'iconColor': Colors.red
    },
    {
      'title': 'Quarterly Presentation',
      'type': 'PPT',
      'date': 'Yesterday',
      'wordCount': '215 words',
      'color': const Color(0xFFF3E5F5),
      'icon': Icons.slideshow,
      'iconColor': AppColor.mediumPurple
    },
    {
      'title': 'Research Paper',
      'type': 'PDF',
      'date': '3 days ago',
      'wordCount': '532 words',
      'color': const Color(0xFFE3F2FD),
      'icon': Icons.picture_as_pdf,
      'iconColor': Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: context.mw * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              0.02.ph(context),
              DottedBorderWidget(),
              0.03.ph(context),
              QuickActionButtonWidget(),
              0.03.ph(context),
              RecentSummerizeWidget(recentSummaries: _recentSummaries),
            ],
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: AppColor.mediumPurple,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColor.mediumPurple.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
