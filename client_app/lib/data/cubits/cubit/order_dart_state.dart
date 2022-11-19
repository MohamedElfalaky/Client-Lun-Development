part of 'order_dart_cubit.dart';

class OrderDartError extends OrderDartState {
  final String? message;

  const OrderDartError({this.message});
}

class OrderDartInitial extends OrderDartState {}

class OrderDartLoaded extends OrderDartState {
  final Orders? orders;

  const OrderDartLoaded({this.orders});
}

class OrderDartLoading extends OrderDartState {}

abstract class OrderDartState extends Equatable {
  const OrderDartState();

  @override
  List<Object> get props => [];
}
