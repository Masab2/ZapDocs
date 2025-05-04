import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:dotted_border/dotted_border.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedNavItem = 0;
  
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome section
              const SizedBox(height: 24),
              Text(
                'Welcome back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryText,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Upload your documents to get instant summaries',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.secondaryText,
                ),
              ),
              
              // Upload section
              const SizedBox(height: 30),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(16),
                dashPattern: const [6, 4],
                color: AppColor.mediumPurple.withOpacity(0.5),
                strokeWidth: 1.5,
                child: InkWell(
                  onTap: () {},
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
                        const SizedBox(height: 16),
                        Text(
                          'Upload your document',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryText,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'PDF, DOC, PPT files supported',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Quick actions
              const SizedBox(height: 32),
              Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.primaryText,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _buildQuickActionCard(
                    context,
                    icon: Icons.camera_alt_outlined,
                    label: 'Scan Document',
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 12),
                  _buildQuickActionCard(
                    context,
                    icon: Icons.link,
                    label: 'Import URL',
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 12),
                  _buildQuickActionCard(
                    context,
                    icon: Icons.history,
                    label: 'History',
                    color: Colors.green,
                  ),
                ],
              ),
              
              // Recent summaries
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Summaries',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryText,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.mediumPurple,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _recentSummaries.length,
                itemBuilder: (context, index) {
                  final item = _recentSummaries[index];
                  return _buildRecentSummaryItem(item);
                },
              ),
              const SizedBox(height: 100), // Bottom padding for navigation bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, 'Home'),
                _buildNavItem(1, Icons.summarize_outlined, 'Summaries'),
                _buildFAB(),
                _buildNavItem(2, Icons.folder_outlined, 'Folders'),
                _buildNavItem(3, Icons.settings_outlined, 'Settings'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionCard(BuildContext context, {
    required IconData icon, 
    required String label, 
    required Color color
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryText,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentSummaryItem(Map<String, dynamic> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: item['color'],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            item['icon'],
            color: item['iconColor'],
            size: 24,
          ),
        ),
        title: Text(
          item['title'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.primaryText,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              '${item['type']} • ${item['wordCount']}',
              style: TextStyle(
                fontSize: 12,
                color: AppColor.secondaryText,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              item['date'],
              style: TextStyle(
                fontSize: 12,
                color: AppColor.tertiaryText,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.more_vert,
            color: AppColor.secondaryText,
          ),
          onPressed: () {},
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = _selectedNavItem == index;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedNavItem = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected ? AppColor.mediumPurple : AppColor.secondaryText,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? AppColor.mediumPurple : AppColor.secondaryText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAB() {
    return InkWell(
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
    );
  }
}