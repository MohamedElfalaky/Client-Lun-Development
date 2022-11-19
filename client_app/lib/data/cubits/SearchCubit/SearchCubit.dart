import 'dart:ffi';

import 'package:client_app/app/global.dart';
import 'package:client_app/data/Models/last_order/last_order.dart';
import 'package:client_app/data/Models/nearby_model/nearby_model.dart';
import 'package:client_app/data/cubits/SearchCubit/SearchState.dart';
import 'package:client_app/data/repositories/NearbyRepo.dart';
import 'package:client_app/data/repositories/SearchRepo.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchRepo searchRepo = SearchRepo();
  static SearchCubit get(context) => BlocProvider.of(context);

  void getSearch(String marketName) {
    try {
      emit(SearchLoading());
      searchRepo.getSearch(marketName) // كمل من هنا
          .then((value) {
        if (value != null) {
          emit(SearchSuccess(value));
        } else {
          SearchError(error: value.toString());
        }
      });
    } catch (e) {
      emit(SearchError());
    }
  }
}
