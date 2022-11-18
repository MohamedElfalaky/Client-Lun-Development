import 'dart:ffi';

import 'package:client_app/app/global.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/data/Models/populer_model/populer_model.dart';
import 'package:client_app/data/repositories/NearbyRepo.dart';
import 'package:client_app/data/repositories/PopulerRepo.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'PopularState.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  // PopularRepo PopularRepo = PopularRepo();
  PopularRepo popularRepo = PopularRepo();
  static PopularCubit get(context) => BlocProvider.of(context);

  void getPopular(String lat, String long) {
    try {
      emit(PopularLoading());
      popularRepo.getPopular(lat, long) // كمل من هنا
          .then((value) {
        if (value != null) {
          emit(PopularSuccess(value));
        } else {
          PopularError(error: value.toString());
        }
      });
    } catch (e) {
      emit(PopularError());
    }
  }
}
