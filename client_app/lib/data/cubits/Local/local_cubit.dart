import 'package:bloc/bloc.dart';
import 'package:client_app/helpers/CacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit() : super(LocalInitial());

  static LocalCubit get(context) => BlocProvider.of(context);

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await CacheHelper.getLangCode();
    emit(ChangeLocaleState(local: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await CacheHelper.saveToShared("LOCALE", languageCode);
    emit(ChangeLocaleState(local: Locale(languageCode)));
  }
}
