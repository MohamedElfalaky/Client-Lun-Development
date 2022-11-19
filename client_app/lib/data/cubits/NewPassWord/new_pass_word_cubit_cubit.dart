import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/new_pass_model.dart';
import 'package:client_app/data/repositories/NewPassRepo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_pass_word_cubit_state.dart';

class NewPassWordCubit extends Cubit<NewPassWordCubitState> {
  NewPassWordCubit() : super(NewPassWordCubitInitial());
  static NewPassWordCubit get(context) => BlocProvider.of(context);

  bool isHiddenPass1 = true;
  bool isHiddenPass2 = true;
  Icon? securityIcon1 = Icon(
    Icons.visibility_off,
  );
  Icon? securityIcon2 = Icon(
    Icons.visibility_off,
  );

  void newPass({required phone, required pass}) {
    try {
      emit(NewPassWordLoading());
      NewPassRepo().reset(phone: phone, pass: pass).then((value) {
        if (value != null) {
          emit(NewPassWordSuccess(value));
        } else {
          NewPassWordError(error: value.toString());
        }
      });
    } catch (e) {
      emit(NewPassWordError());
    }
  }

  showPassWord1() {
    isHiddenPass1 = !isHiddenPass1;

    isHiddenPass1
        ? securityIcon1 = Icon(Icons.visibility_off)
        : securityIcon1 = Icon(Icons.visibility);
    emit(PasswordShown());
  }

  showPassWord2() {
    isHiddenPass2 = !isHiddenPass2;

    isHiddenPass2
        ? securityIcon2 = Icon(Icons.visibility_off)
        : securityIcon2 = Icon(Icons.visibility);
    emit(PasswordShown());
  }
}
