<<<<<<< HEAD
import 'package:client_app/data/Models/login_model/login_model.dart';
import 'package:client_app/data/repositories/LoginRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginRepo logInRepo = LoginRepo();

  bool isHiddenPass = true;
  Icon? securityIcon = const Icon(
    Icons.visibility_off,
  );
  LoginCubit() : super(LoginInitial());
  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = const Icon(Icons.visibility_off)
        : securityIcon = const Icon(Icons.visibility);
    emit(PasswordShown());
  }

  void userLogin({required phone, required password}) {
    try {
      emit(LoginLoading());
      logInRepo.userLogin(phone: phone, password: password).then((value) {
        if (value != null) {
          emit(LoginSuccess(value));
        } else {
          LoginError(error: value.toString());
        }
      });
    } catch (e) {
      emit(LoginError());
    }
  }

  static LoginCubit get(context) => BlocProvider.of(context);
}
=======
import 'package:client_app/data/Models/login_model/login_model.dart';
import 'package:client_app/data/repositories/LoginRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  LoginRepo logInRepo = LoginRepo();
  static LoginCubit get(context) => BlocProvider.of(context);
  bool isHiddenPass = true;
  Icon? securityIcon = Icon(
    Icons.visibility_off,
  );

  void userLogin({required phone, required password}) {
    try {
      emit(LoginLoading());
      logInRepo.userLogin(phone: phone, password: password).then((value) {
        if (value != null) {
          emit(LoginSuccess(value));
        } else {
          LoginError(error: value.toString());
        }
      });
    } catch (e) {
      emit(LoginError());
    }
  }

  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = Icon(Icons.visibility_off)
        : securityIcon = Icon(Icons.visibility);
    emit(PasswordShowen());
  }
}
>>>>>>> 6775c8401b8b37b6b4906678bcecdc2e1f06a5f3
