import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';
import 'package:client_app/data/cubits/aboutUs/AboutUs_state.dart';
import 'package:client_app/data/repositories/AboutUs.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit() : super(AboutUsInitial());
  AboutUsRepo aboutData = AboutUsRepo();

  AboutUsModel? getAbout() {
    try {
      emit(AboutUsLoading());
      aboutData.getAboutUs().then((value) {
        if (value != null) {
          emit(AboutUsLoaded(value));
        } else {
          emit(AboutUsErorr());
        }
      });
    } catch (e) {
      emit(AboutUsErorr());
    }
  }
}
