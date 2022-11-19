import 'dart:ffi';

import 'package:client_app/app/global.dart';
import 'package:client_app/data/Models/balance_model/balance_model.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/data/Models/populer_model/populer_model.dart';
import 'package:client_app/data/repositories/BalanceRepo.dart';
import 'package:client_app/data/repositories/NearbyRepo.dart';
import 'package:client_app/data/repositories/PopulerRepo.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'BalanceState.dart';

class BalanceCubit extends Cubit<BalanceState> {
  BalanceCubit() : super(BalanceInitial());

  // BalanceRepo BalanceRepo = BalanceRepo();
  BalanceRepo balanceRepo = BalanceRepo();
  static BalanceCubit get(context) => BlocProvider.of(context);

  void getBalance(String token) {
    try {
      emit(BalanceLoading());
      balanceRepo.getBalance(token) // كمل من هنا
          .then((value) {
        if (value != null) {
          emit(BalanceSuccess(value));
        } else {
          BalanceError(error: value.toString());
        }
      });
    } catch (e) {
      emit(BalanceError());
    }
  }
}
