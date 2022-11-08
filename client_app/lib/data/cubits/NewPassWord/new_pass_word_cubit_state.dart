part of 'new_pass_word_cubit_cubit.dart';

abstract class NewPassWordCubitState {}

class NewPassWordCubitInitial extends NewPassWordCubitState {}

class PasswordShown extends NewPassWordCubitState {}

class NewPassWordLoading extends NewPassWordCubitState {}

class NewPassWordSuccess extends NewPassWordCubitState {
  final NewPassModel myResetModel;
  NewPassWordSuccess(this.myResetModel);
}

class NewPassWordError extends NewPassWordCubitState {
  final String? error;
  NewPassWordError({this.error});
}
