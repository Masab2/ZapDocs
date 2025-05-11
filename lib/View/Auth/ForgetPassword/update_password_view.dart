import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Components/AuthHeaderComp/auth_header_comp.dart';
import 'package:zapdocs/Config/Components/AuthfeildsComp/auth_feild_comp.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class UpdatePasswordView extends StatefulWidget {
  final String pin;
  final String email;
  const UpdatePasswordView({super.key, required this.pin, required this.email});

  @override
  State<UpdatePasswordView> createState() => _UpdatePasswordViewState();
}

class _UpdatePasswordViewState extends State<UpdatePasswordView> {
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurepass = ValueNotifier(true);
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _obscurepass.dispose();
    _passwordFocusNode.dispose();
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
                AuthHeaderComp(title: "Update Password"),
                0.01.ph(context),
                ValueListenableBuilder(
                  valueListenable: _obscurepass,
                  builder: (context, value, child) {
                    return AuthFieldComp(
                      controller: _passwordController,
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscurepass.value = !_obscurepass.value;
                        },
                        child: _obscurepass.value
                            ? const Icon(
                                Icons.visibility_off,
                              )
                            : const Icon(
                                Icons.visibility,
                              ),
                      ),
                      focusNode: _passwordFocusNode,
                      hintText: 'Create new Password',
                      prefixIcon: Icons.lock_outline,
                    );
                  },
                ),
                0.03.ph(context),
                Consumer<AuthViewmodel>(
                  builder: (context, model, child) {
                    return RoundBtn(
                      isLoading: model.isforgetLoading,
                      title: "Update Password",
                      onPressed: () {
                        if (_passwordController.text.length >= 6) {
                          model.updatePasswordApi(
                              widget.email, _passwordController.text, context, widget.pin);
                        }
                      },
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
