import 'package:zapdocs/Model/SuccessModel/success_model.dart';
import 'package:zapdocs/Model/UserModel/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String name, String email, String password);

  Future<SuccessModel> forgetPassword(String email);
  Future<SuccessModel> verifyPin(String email, String pin);
  Future<SuccessModel> updatePassword(String email, String password, String pin);
}
