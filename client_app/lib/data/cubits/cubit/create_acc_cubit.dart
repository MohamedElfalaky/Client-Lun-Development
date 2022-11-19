import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/create_account/create_account.dart';
import 'package:client_app/data/repositories/CreateAccount.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'create_acc_state.dart';

class CreateAccCubit extends Cubit<CreateAccState> {
  bool isHiddenPass = true;
  bool isHiddenConfirmPass = true;
  IconData? securityIcon = Icons.visibility_off;
  IconData? securityIcon2 = Icons.visibility_off;

  CreateAccCubit() : super(CreateAccInitial());
  Future<CreateAccount?> createAccount({
    required String name,
    required String phone,
    required String password,
  }) async {
    emit(CreateAccLoading());
    try {
      CreateAccountRepo createAccountRepo = CreateAccountRepo();
      final data = await createAccountRepo.createAccountRepo(
        name,
        phone,
        password,
      );
      if (data!.success == true) {
        emit(CreateAccSuccess(data));
      } else {
        emit(CreateAccError());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(CreateAccError());
    }
    return null;
  }

  void showConfirmPassWord() {
    isHiddenConfirmPass = !isHiddenConfirmPass;

    isHiddenConfirmPass
        ? securityIcon2 = Icons.visibility_off
        : securityIcon2 = Icons.visibility;
    emit(ConfirmPasswordShown());
  }

  void showPassWord() {
    isHiddenPass = !isHiddenPass;

    isHiddenPass
        ? securityIcon = Icons.visibility_off
        : securityIcon = Icons.visibility;
    emit(PasswordShown());
  }
}
