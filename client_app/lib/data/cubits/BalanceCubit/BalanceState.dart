part of 'BalanceCubit.dart';

@immutable
abstract class BalanceState {}

class BalanceInitial extends BalanceState {}

class BalanceLoading extends BalanceState {}

class BalanceSuccess extends BalanceState {
  final BalanceModel myBalanceModel;
  BalanceSuccess(this.myBalanceModel);
}

class BalanceError extends BalanceState {
  final String? error;
  BalanceError({this.error});
}
