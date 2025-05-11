import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
class Utils {
  static void showCustomSnackBar(
     BuildContext context,
     String message,
    String? title,
  ) {
    Flushbar(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: Colors.grey.shade900.withOpacity(0.8),
      boxShadows: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 4),
        ),
      ],
      padding: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
      duration: const Duration(seconds: 3),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeInOut,
      reverseAnimationCurve: Curves.easeOut,
      
      titleText: title == ""
          ? null
          : Text(
              title  ?? "",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white70,
        ),
      ),
    ).show(context);
  }
}