part of 'check_verfification_cubit.dart';

class CheckVerfificationError extends CheckVerfificationState {
  final String? message;

  CheckVerfificationError({this.message});
}

class CheckVerfificationInitial extends CheckVerfificationState {}

class CheckVerfificationLoaded extends CheckVerfificationState {
  final Check? checkVerfification;

  CheckVerfificationLoaded({this.checkVerfification});
}

class CheckVerfificationLoading extends CheckVerfificationState {}

@immutable
abstract class CheckVerfificationState {}
