import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class ConfirmationDialog {
  static Future<void> showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    VoidCallback onConfirm,

    bool isDeleteAccount,
  ) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.lightGray,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: context.mh * 0.022,
            fontWeight: FontWeight.bold,
            color: AppColor.primaryText,
          ),
        ),
        content: Text(message),
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide(color: AppColor.secondaryText),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel',
                      style: TextStyle(color: Colors.grey.shade700)),
                ),
              ),
              0.02.pw(context),
              Expanded(
                child: RoundBtn(
                  isLoading: isDeleteAccount,
                  title: title,
                  onPressed: () {
                    Navigator.pop(context);
                    onConfirm();
                  },
                  backgroundColor: title == 'Delete Account'
                      ? AppColor.alertRed
                      : AppColor.mediumPurple,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
