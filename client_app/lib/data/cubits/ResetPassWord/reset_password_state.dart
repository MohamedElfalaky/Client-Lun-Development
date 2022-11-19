part of 'reset_password_cubit.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {
  final ResetPasswordModel myResetModel;
  ResetPasswordSuccess(this.myResetModel);
}

class ResetPasswordError extends ResetPasswordState {
  final String? error;
  ResetPasswordError({this.error});
}
