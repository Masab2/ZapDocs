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
}
