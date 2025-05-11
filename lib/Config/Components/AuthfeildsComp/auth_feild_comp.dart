import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';

class AuthFieldComp extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget ? suffixIcon;
  final String? Function(String?)? validator;

  const AuthFieldComp({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text, this.suffixIcon, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: TextStyle(
        fontSize: context.mh * 0.015,
        color: AppColor.primaryText,
      ),
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.tertiaryText,
          fontSize: context.mh * 0.015,
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColor.mediumPurple.withOpacity(0.7),
          size: 22,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.mediumPurple, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
