part of 'LastOrders_cubit.dart';

@immutable
abstract class LastOrderState {}

class LastOrderInitial extends LastOrderState {}

class LastOrderLoading extends LastOrderState {}

class LastOrderSuccess extends LastOrderState {
  final LastOrderModel myLastOrderModel;
  LastOrderSuccess(this.myLastOrderModel);
}

class LastOrderError extends LastOrderState {
  final String? error;
  LastOrderError({this.error});
}

class PasswordShowen extends LastOrderState {}
