import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/repositories/LastOrderRepo.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'LastOrderState.dart';

class LastOrdersCubit extends Cubit<LastOrderState> {
  LastOrdersCubit() : super(LastOrderInitial());

  LastOrderRepo lastOrderRepo = LastOrderRepo();
  static LastOrdersCubit get(context) => BlocProvider.of(context);

  void getLastOrder() {
    try {
      emit(LastOrderLoading());
      lastOrderRepo
          .getLastOrders(CacheHelper.getFromShared("token"))
          .then((value) {
        if (value != null) {
          emit(LastOrderSuccess(value));
        } else {
          LastOrderError(error: value.toString());
        }
      });
    } catch (e) {
      emit(LastOrderError());
    }
  }
}
