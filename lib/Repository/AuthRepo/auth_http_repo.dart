import 'dart:developer';

import 'package:zapdocs/Config/App/app_url.dart';
import 'package:zapdocs/Model/SuccessModel/success_model.dart';
import 'package:zapdocs/Model/UserModel/user_model.dart';
import 'package:zapdocs/Repository/AuthRepo/auth_repo.dart';
import 'package:zapdocs/data/Network/network_api_service.dart';

class AuthHttpRepo implements AuthRepo {
  final _api = NetworkApiService();
  @override
  Future<UserModel> login(String email, String password) async {
    Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    final response = await _api.getPostApiResponse(AppUrl.login, data, false);
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> register(String name, String email, String password) async {
    Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'password': password,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.register, data, false);
    UserModel userModel = UserModel.fromJson(response);
    log(userModel.data?.email ?? "");
    return UserModel.fromJson(response);
  }

  @override
  Future<SuccessModel> forgetPassword(String email) async {
    Map<String, dynamic> data = {
      'email': email,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.forgetPassword, data, false);
    return SuccessModel.fromJson(response);
  }

  @override
  Future<SuccessModel> updatePassword(String email, String password, String resetCode) async {
    Map<String, dynamic> data = {
      'email': email,
      "resetCode" : resetCode,
      'newPassword': password,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.updatePassword, data, false);
    return SuccessModel.fromJson(response);
  }

  @override
  Future<SuccessModel> verifyPin(String email, String pin) async {
    Map<String, dynamic> data = {
      'email': email,
      'resetCode': pin,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.verifyPin, data, false);
    return SuccessModel.fromJson(response);
  }
}
