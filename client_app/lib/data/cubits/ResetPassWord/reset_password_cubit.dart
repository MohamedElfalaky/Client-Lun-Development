import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/reset_password_model/reset_password_model.dart';
import 'package:client_app/data/repositories/ResetPassRepo.dart';
import 'package:equatable/equatable.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  void ResetPass({required phone}) {
    try {
      emit(ResetPasswordLoading());
      ResetPassRepo().reset(phone: phone).then((value) {
        if (value != null) {
          emit(ResetPasswordSuccess(value));
        } else {
          ResetPasswordError(error: value.toString());
        }
      });
    } catch (e) {
      emit(ResetPasswordError());
    }
  }
}
