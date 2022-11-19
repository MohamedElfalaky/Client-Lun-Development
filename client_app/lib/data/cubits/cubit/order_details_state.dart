part of 'order_details_cubit.dart';

class OrderDetailsError extends OrderDetailsState {}

class OrderDetailsInitial extends OrderDetailsState {}

class OrderDetailsLoading extends OrderDetailsState {}

abstract class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}

class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetails? orderDetails;

  const OrderDetailsSuccess({this.orderDetails});

  @override
  List<Object> get props => [];
}
