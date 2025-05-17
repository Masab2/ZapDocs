import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthViewmodel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                0.03.ph(context),

                // Profile Picture
                Center(
                  child: Container(
                    width: context.mw * 0.25,
                    height: context.mw * 0.25,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.primaryText.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.bolt,
                        size: context.mh * 0.07,
                        color: AppColor.mediumPurple,
                      ),
                    ),
                  ),
                ),
                0.02.ph(context),

                // Welcome Text
                Center(
                  child: Text(
                    "ZapDocs",
                    style: TextStyle(
                      fontSize: context.mh * 0.025,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),

                0.06.ph(context),

                _buildProfileOption(
                  context,
                  title: 'History',
                  icon: Icons.history,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.historyView);
                  },
                ),

                _buildDivider(),

                _buildProfileOption(
                  context,
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildProfileOption(
                  context,
                  title: 'Terms & Conditions',
                  icon: Icons.description_outlined,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildProfileOption(
                  context,
                  title: 'Help & Support',
                  icon: Icons.help_outline,
                  onTap: () {},
                ),

                _buildDivider(),

                _buildProfileOption(
                  context,
                  title: 'Delete Account',
                  icon: Icons.delete_outline,
                  iconColor: Colors.red,
                  textColor: Colors.red,
                  onTap: () {
                    _showDeleteAccountConfirmation(context, authProvider);
                  },
                ),

                0.04.ph(context),

                // Logout Button
                RoundBtn(
                  title: "Sign Out",
                  onPressed: () {
                    _showLogoutConfirmation(context, authProvider);
                  },
                ),

                0.03.ph(context),

                // App Version
                Text(
                  'ZapDocs v1.0.0',
                  style: TextStyle(
                    fontSize: context.mh * 0.014,
                    color: AppColor.secondaryText,
                  ),
                ),

                0.02.ph(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              size: context.mh * 0.026,
              color: iconColor ?? AppColor.primaryColor,
            ),
            SizedBox(width: context.mw * 0.04),
            Text(
              title,
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.w500,
                color: textColor ?? AppColor.primaryText,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: context.mh * 0.018,
              color: AppColor.secondaryText,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.2),
      height: 1,
    );
  }

  void _showLogoutConfirmation(
      BuildContext context, AuthViewmodel authProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColor.secondaryText),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Sign Out',
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteAccountConfirmation(
      BuildContext context, AuthViewmodel authProvider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
            'Are you sure you want to delete your account? This action cannot be undone and all your data will be permanently deleted.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: AppColor.secondaryText),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Implement account deletion functionality
              },
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
