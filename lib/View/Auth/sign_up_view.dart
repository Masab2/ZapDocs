import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/AuthHeaderComp/auth_header_comp.dart';
import 'package:zapdocs/Config/Components/AuthfeildsComp/auth_feild_comp.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final ValueNotifier<bool> _obscures = ValueNotifier(true);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _obscures.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewmodel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.08.ph(context),

                // App Logo
                AuthHeaderComp(title: "Create an Account"),

                0.01.ph(context),

                // Subtitle
                Center(
                  child: Text(
                    'Sign up to continue',
                    style: TextStyle(
                      fontSize: context.mh * 0.017,
                      color: AppColor.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                0.06.ph(context),

                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Email Field Label
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryText,
                        ),
                      ),
                      0.01.ph(context),

                      // Email TextField
                      AuthFieldComp(
                        controller: _nameController,
                        focusNode: _nameFocusNode,
                        hintText: 'Enter your Name',
                        prefixIcon: Icons.person_outline,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      0.025.ph(context),
                      // Email Field Label
                      Text(
                        'Email',
                        style: TextStyle(
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryText,
                        ),
                      ),
                      0.01.ph(context),

                      // Email TextField
                      AuthFieldComp(
                        controller: _emailController,
                        focusNode: _emailFocusNode,
                        hintText: 'Enter your email',
                        prefixIcon: Icons.email_outlined,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      0.025.ph(context),

                      // Password Field Label
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryText,
                        ),
                      ),
                      0.01.ph(context),

                      // Password TextField
                      ValueListenableBuilder(
                        valueListenable: _obscures,
                        builder: (context, value, child) {
                          return AuthFieldComp(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            hintText: 'Enter your password',
                            prefixIcon: Icons.lock_outline,
                            obscureText: value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                            suffixIcon: InkWell(
                              onTap: () {
                                _obscures.value = !_obscures.value;
                              },
                              child: _obscures.value
                                  ? const Icon(
                                      Icons.visibility_off,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                    ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                0.04.ph(context),
                // Login Button
                RoundBtn(
                  
                  title: "Sign up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authViewModel.registerApi(
                        _nameController,
                        _emailController,
                        _passwordController,
                        context,
                      );
                    }

                    _nameController.clear();
                    _emailController.clear();
                    _passwordController.clear();
                  },
                ),
                0.04.ph(context),
                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: context.mh * 0.013,
                        color: AppColor.secondaryText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: context.mh * 0.013,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
