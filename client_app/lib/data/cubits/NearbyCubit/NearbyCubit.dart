import 'dart:ffi';

import 'package:client_app/app/global.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/data/repositories/NearbyRepo.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'NearbyState.dart';

class NearbyCubit extends Cubit<NearbyState> {
  NearbyCubit() : super(NearbyInitial());

  NearbyRepo nearbyRepo = NearbyRepo();
  static NearbyCubit get(context) => BlocProvider.of(context);

  void getNearby(String lat, String long, int receiveMethod) {
    try {
      emit(NearbyLoading());
      nearbyRepo.getNearby(lat, long, receiveMethod) // كمل من هنا
          .then((value) {
        if (value != null) {
          emit(NearbySuccess(value));
        } else {
          NearbyError(error: value.toString());
        }
      });
    } catch (e) {
      emit(NearbyError());
    }
  }
}
