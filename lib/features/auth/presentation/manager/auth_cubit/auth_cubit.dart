import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/data/repos/auth_repo.dart';
import 'package:news_app/features/auth/presentation/manager/auth_cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    String result = await authRepo.login(email: email, password: password);
    if (result == 'Login Success') {
      emit(LoginSuccess(message: 'Login successfully!'));
    } else {
      emit(LoginFailure(errorMsg: result));
    }
  }

  Future<void> signupUser(
      {required String email, required String password}) async {
    emit(SignupLoading());
    String result = await authRepo.signup(email: email, password: password);
    if (result == 'Signup Success') {
      emit(SignupSuccess(message: 'Account created successfully!'));
    } else {
      emit(SignupFailure(errorMsg: result));
    }
  }
}
