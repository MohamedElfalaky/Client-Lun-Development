<<<<<<< HEAD
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel myLoginModel;
  LoginSuccess(this.myLoginModel);
}

class LoginError extends LoginState {
  final String? error;
  LoginError({this.error});
}

class PasswordShown extends LoginState {}
=======
part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginModel myLoginModel;
  LoginSuccess(this.myLoginModel);
}

class LoginError extends LoginState {
  final String? error;
  LoginError({this.error});
}

class PasswordShowen extends LoginState {}
>>>>>>> 6775c8401b8b37b6b4906678bcecdc2e1f06a5f3
