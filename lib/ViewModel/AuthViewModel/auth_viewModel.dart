import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/Config/Utils/utils.dart';
import 'package:zapdocs/Repository/AuthRepo/auth_http_repo.dart';

class AuthViewmodel with ChangeNotifier {
  final authRepo = AuthHttpRepo();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void loginApi(TextEditingController emailController,
      TextEditingController passwordController, BuildContext context) {
    setLoading(true);
    authRepo.login(emailController.text, passwordController.text).then((value) {
      setLoading(false);
      log(value.data?.email.toString() ?? "");
      Utils.showCustomSnackBar(context, value.message ?? "", "Success");
      Navigator.pushReplacementNamed(context, RouteNames.homeView);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }

  void registerApi(
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    BuildContext context,
  ) {
    setLoading(true);
    authRepo
        .register(
            nameController.text, emailController.text, passwordController.text)
        .then((value) {
      setLoading(false);
      Navigator.pop(context);
      log(value.token.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }

  bool _isforgetLoading = false;

  bool get isforgetLoading => _isforgetLoading;

  void setForgetLoading(bool loading) {
    _isforgetLoading = loading;
    notifyListeners();
  }

  void forgetPasswordApi(
      TextEditingController emailController, BuildContext context) {
    setForgetLoading(true);
    authRepo.forgetPassword(emailController.text).then((value) {
      setForgetLoading(false);
      Utils.showCustomSnackBar(context, value.message ?? "", "Success");
      Navigator.pushNamed(context, RouteNames.verifyPinView,
          arguments: emailController.text);
    }).onError((error, stackTrace) {
      setForgetLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }

  void verifyPinApi(String email, String pin, BuildContext context) {
    setForgetLoading(true);
    authRepo.verifyPin(email, pin).then((value) {
      setForgetLoading(false);

      Utils.showCustomSnackBar(context, value.message ?? "", "Success");
      Navigator.pushNamed(context, RouteNames.updatePasswordView, arguments: {
        'email': email,
        'pin': pin,
      });
    }).onError((error, stackTrace) {
      setForgetLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }

  void updatePasswordApi(String email, String password, BuildContext context, String pin) {
    setForgetLoading(true);
    authRepo.updatePassword(email, password, pin ).then((value) {
      setForgetLoading(false);
      Navigator.pop(context);
      Utils.showCustomSnackBar(context, value.message ?? "", "Success");
      Navigator.pushReplacementNamed(context, RouteNames.loginView);
    }).onError((error, stackTrace) {
      setForgetLoading(false);
      Utils.showCustomSnackBar(context, error.toString(), "Error");
    });
  }
}
