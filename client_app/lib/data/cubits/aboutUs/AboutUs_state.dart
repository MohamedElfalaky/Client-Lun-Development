import 'package:talabatcom/Data/Models/AboutUs/AboutUsModel.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  AboutUsModel? response;

  AboutUsLoaded(this.response);
}

class AboutUsErorr extends AboutUsState {}
