import 'package:client_app/data/Models/search_model/search_model.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final SearchModel mySearchModel;
  SearchSuccess(this.mySearchModel);
}

class SearchError extends SearchState {
  final String? error;
  SearchError({this.error});
}
