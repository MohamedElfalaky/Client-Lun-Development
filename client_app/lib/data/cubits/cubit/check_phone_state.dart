part of 'check_phone_cubit.dart';

class CheckPhoneError extends CheckPhoneState {
  final String? message;

  CheckPhoneError({this.message});
}

class CheckPhoneInitial extends CheckPhoneState {}

class CheckPhoneLoaded extends CheckPhoneState {
  final Check? checkPhone;

  CheckPhoneLoaded({this.checkPhone});
}

class CheckPhoneLoading extends CheckPhoneState {}

@immutable
abstract class CheckPhoneState {}
