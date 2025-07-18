import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapdocs/Config/Color/app_color.dart';
import 'package:zapdocs/Config/Components/AuthHeaderComp/auth_header_comp.dart';
import 'package:zapdocs/Config/Components/AuthfeildsComp/auth_feild_comp.dart';
import 'package:zapdocs/Config/Components/RoundBtn/round_btn.dart';
import 'package:zapdocs/Config/Extenshion/extenshion.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/ViewModel/AuthViewModel/auth_viewModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
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
    final authProvider = Provider.of<AuthViewmodel>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                0.08.ph(context),

                AuthHeaderComp(title: "Welcome to ZapDocs"),

                0.01.ph(context),

                // Subtitle
                Center(
                  child: Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: context.mh * 0.017,
                      color: AppColor.secondaryText,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                0.06.ph(context),

                // Email Field Label
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                      0.015.ph(context),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RouteNames.checkEmailView);
                          },
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              fontSize: context.mh * 0.013,
                              color: AppColor.mediumPurple,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                0.04.ph(context),
                // Login Button
                Consumer<AuthViewmodel>(builder: (context, auth, child) {
                  return RoundBtn(
                    isLoading: auth.isLoading,
                    title: "Sign In",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        authProvider.loginApi(
                          _emailController,
                          _passwordController,
                          context,
                        );
                      }
                    },
                  );
                }),
                0.04.ph(context),
                // Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: context.mh * 0.013,
                        color: AppColor.secondaryText,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.registerView);
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
