part of 'PopularCubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final PopularModel myPopularModel;
  PopularSuccess(this.myPopularModel);
}

class PopularError extends PopularState {
  final String? error;
  PopularError({this.error});
}
