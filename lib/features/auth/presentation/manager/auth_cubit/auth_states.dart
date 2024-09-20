abstract class AuthStates {}

class AuthInitial extends AuthStates {}

class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  final String message;

  LoginSuccess({required this.message});
}

class LoginFailure extends AuthStates {
  final String errorMsg;

  LoginFailure({required this.errorMsg});
}

class SignupLoading extends AuthStates {}

class SignupSuccess extends AuthStates {
  final String message;

  SignupSuccess({required this.message});
}

class SignupFailure extends AuthStates {
  final String errorMsg;

  SignupFailure({required this.errorMsg});
}
