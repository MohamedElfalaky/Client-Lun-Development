import 'package:bloc/bloc.dart';
import 'package:talabatcom/Data/Cubit/AboutUs_cubit/AboutUs_state.dart';
import 'package:talabatcom/Data/Models/AboutUs/AboutUsModel.dart';
import 'package:talabatcom/Data/reposetories/AboutUs/AboutUs.dart';

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
