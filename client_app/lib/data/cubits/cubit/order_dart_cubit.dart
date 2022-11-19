import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/orders/orders.dart';
import 'package:client_app/data/repositories/Orders.dart';
import 'package:equatable/equatable.dart';

part 'order_dart_state.dart';

class OrderDartCubit extends Cubit<OrderDartState> {
  OrdersRepo ordersRepo = OrdersRepo();
  OrderDartCubit() : super(OrderDartInitial());
  Orders? getOrders(
      {bool isCanceled = false, isDelivered = false, isInProgress = false}) {
    try {
      emit(OrderDartLoading());
      ordersRepo
          .getOrders(
              isCanceled: isCanceled,
              isDelivered: isDelivered,
              isInProgress: isInProgress)
          .then((value) {
        if (value != null) {
          emit(OrderDartLoaded(orders: value));
        } else {
          emit(OrderDartError());
        }
      });
    } catch (e) {
      emit(OrderDartError());
    }
    return null;
  }
}
