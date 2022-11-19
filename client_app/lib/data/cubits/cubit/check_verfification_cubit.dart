import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/CheckVerfication/check.verification.dart';
import 'package:client_app/data/repositories/CheckVerification.dart';
import 'package:meta/meta.dart';

part 'check_verfification_state.dart';

class CheckVerfificationCubit extends Cubit<CheckVerfificationState> {
  CheckVerfificationCubit() : super(CheckVerfificationInitial());

  Future<Check?> checkVerfification(String Phone, String Code) async {
    CheckVerificationRepo checkVerificationRepo = CheckVerificationRepo();
    emit(CheckVerfificationLoading());

    try {
      final data = await checkVerificationRepo.checkVerification(Phone, Code);
      if (data!.success == true) {
        emit(CheckVerfificationLoaded(checkVerfification: data));
      } else {
        emit(CheckVerfificationError(message: data.message));
      }
    } catch (e) {
      emit(CheckVerfificationError(message: e.toString()));
    }
    return null;
  }
}
