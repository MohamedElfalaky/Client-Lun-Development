part of 'create_acc_cubit.dart';

class ConfirmPasswordShown extends CreateAccState {}

class CreateAccError extends CreateAccState {}

class CreateAccInitial extends CreateAccState {}

class CreateAccLoading extends CreateAccState {}

@immutable
abstract class CreateAccState {}

class CreateAccSuccess extends CreateAccState {
  final CreateAccount createAccount;

  CreateAccSuccess(this.createAccount);
}

class PasswordShown extends CreateAccState {}
