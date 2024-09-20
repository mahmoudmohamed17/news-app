import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:news_app/core/errors/auth_failure.dart';
import 'package:news_app/core/utilities/auth_service.dart';
import 'package:news_app/core/utilities/service_locator.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app/features/profile/data/models/user_info_model.dart';

class AuthRepoImpl implements AuthRepo {
  final authService = AuthService();
  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      await authService.userLogin(email: email, password: password);
      return 'Login Success';
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthFailure.catchError(e);
      }
      return 'Oops! There was an error!';
    }
  }

  @override
  Future<String> signup(
      {required String email, required String password}) async {
    try {
      await authService.userSignUp(email: email, password: password);
      return 'Signup Success';
    } catch (e) {
      if (e is FirebaseAuthException) {
        return AuthFailure.catchError(e);
      }
      return 'Oops! There was an error!';
    }
  }

  @override
  Future<void> storeUserData(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    late String id;
    CollectionReference user =
        FirebaseFirestore.instance.collection('users_info');
    await user.add({
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
    }).then((doc) {
      id = doc.id;
    });
    var myBox = getIt.get<Box>();
    myBox.put(email, id);
  }

  @override
  Future<UserInfoModel?> getUserData({required String email}) async {
    try {
      var myBox = getIt.get<Box>();
      var doc = await FirebaseFirestore.instance
          .collection('users_info')
          .doc('${myBox.get(email)}')
          .get();
      if (doc.exists) {
        Map<String, dynamic>? data = doc.data();
        var userInfoModel = UserInfoModel.fromStore(data!);
        return userInfoModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
