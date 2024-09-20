import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _credentail = FirebaseAuth.instance;
  Future<void> userLogin(
      {required String email, required String password}) async {
    await _credentail.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> userSignUp(
      {required String email, required String password}) async {
    await _credentail.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
