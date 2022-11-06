import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/CheckPhone/check.phone.dart';
import 'package:client_app/data/repositories/CheckPhone.dart';
import 'package:meta/meta.dart';

part 'check_phone_state.dart';

class CheckPhoneCubit extends Cubit<CheckPhoneState> {
  CheckPhoneRepo checkPhoneRepo = CheckPhoneRepo();

  CheckPhoneCubit() : super(CheckPhoneInitial());

  Check? checkPhone(String phone) {
    try {
      emit(CheckPhoneLoading());
      checkPhoneRepo.checkPhone(phone).then((value) {
        if (value != null) {
          emit(CheckPhoneLoaded(checkPhone: value));
        } else {
          emit(CheckPhoneError());
        }
      });
    } catch (e) {
      emit(CheckPhoneError());
    }
    return null;
  }
}
