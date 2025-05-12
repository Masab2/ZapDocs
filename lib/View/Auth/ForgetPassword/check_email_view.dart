import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Components/AuthHeaderComp/auth_header_comp.dart';
import 'package:zapdocs/Config/Components/AuthfeildsComp/auth_feild_comp.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class CheckEmailView extends StatefulWidget {
  const CheckEmailView({super.key});

  @override
  State<CheckEmailView> createState() => _CheckEmailViewState();
}

class _CheckEmailViewState extends State<CheckEmailView> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthHeaderComp(title: "Check Your Email"),
                0.01.ph(context),
                AuthFieldComp(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    hintText: "Enter your email",
                    prefixIcon: Icons.email_outlined),
                0.03.ph(context),
                Consumer<AuthViewmodel>(builder: (context, model, child) {
                  return RoundBtn(
                    isLoading: model.isforgetLoading,
                    title: "Send Code",
                    onPressed: () {
                      if (_emailController.text.isNotEmpty) {
                        model.forgetPasswordApi(_emailController, context);
                      }
                    },
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
