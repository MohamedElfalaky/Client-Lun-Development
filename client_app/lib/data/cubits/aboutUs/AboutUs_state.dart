import 'package:client_app/data/Models/AboutUsModel/AboutUsModel.dart';

abstract class AboutUsState {}

class AboutUsInitial extends AboutUsState {}

class AboutUsLoading extends AboutUsState {}

class AboutUsLoaded extends AboutUsState {
  AboutUsModel? response;

  AboutUsLoaded(this.response);
}

class AboutUsErorr extends AboutUsState {}
