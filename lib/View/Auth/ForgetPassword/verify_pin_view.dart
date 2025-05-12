import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Components/AuthHeaderComp/auth_header_comp.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class VerifyPinView extends StatefulWidget {
  final String email;
  const VerifyPinView({super.key, required this.email});

  @override
  State<VerifyPinView> createState() => _VerifyPinViewState();
}

class _VerifyPinViewState extends State<VerifyPinView> {
  final TextEditingController verifyPinController = TextEditingController();
  @override
  void dispose() {
    verifyPinController.dispose();
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
                AuthHeaderComp(title: "Verify Pin"),
                0.01.ph(context),
                Pinput(
                  controller: verifyPinController,
                  autofocus: true,
                  length: 4,
                ),
                0.04.ph(context),
                Consumer<AuthViewmodel>(
                    builder: (context, authViewModel, child) {
                  return RoundBtn(
                    isLoading: authViewModel.isforgetLoading,
                    title: "Verify Pin",
                    onPressed: () {
                      if (verifyPinController.text.length == 4) {
                        authViewModel.verifyPinApi(
                            widget.email, verifyPinController.text, context);
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
