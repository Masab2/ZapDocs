import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/Dialog/confirmation_dialog.dart';
import 'package:zapdocs/Config/Widgets/widgets.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
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

                ProfileOptionTile(
                  title: 'History',
                  icon: Icons.history,
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.historyView);
                  },
                ),

                _buildDivider(),

                ProfileOptionTile(
                  title: 'Privacy Policy',
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                ),

                _buildDivider(),

                ProfileOptionTile(
                  title: 'Terms & Conditions',
                  icon: Icons.description_outlined,
                  onTap: () {},
                ),

                _buildDivider(),

                Consumer<AuthViewmodel>(
                    builder: (context, authViewModel, child) {
                  return ProfileOptionTile(
                    title: 'Delete Account',
                    icon: Icons.delete_outline,
                    iconColor: AppColor.alertRed,
                    textColor: AppColor.alertRed,
                    onTap: () async {
                      await ConfirmationDialog.showConfirmationDialog(
                        context,
                        'Delete Account',
                        'Are you sure you want to permanently delete your account? This action cannot be undone.',
                        () {
                          authViewModel.deleteAccountApi(context);
                        },
                        authViewModel.isdeteLoading,
                      );
                    },
                  );
                }),

                0.04.ph(context),

                // Logout Button
                Consumer<AuthViewmodel>(
                    builder: (context, authViewModel, child) {
                  return RoundBtn(
                    title: "Sign Out",
                    onPressed: () async {
                      await ConfirmationDialog.showConfirmationDialog(
                        context,
                        'Sign Out',
                        'Are you sure you want to sign out?',
                        () {
                          authViewModel.logout(context);
                        },
                        false,
                      );
                    },
                  );
                }),

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

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.withOpacity(0.2),
      height: 1,
    );
  }
}
