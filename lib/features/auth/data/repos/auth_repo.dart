import 'package:news_app/features/profile/data/models/user_info_model.dart';

abstract class AuthRepo {
  Future<String> login({required String email, required String password});
  Future<String> signup({required String email, required String password});
  Future<void> storeUserData(
      {required String email,
      required String password,
      required String name,
      required String phone});
  Future<UserInfoModel?> getUserData({required String email});
}
