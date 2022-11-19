import 'package:bloc/bloc.dart';
import 'package:client_app/data/Models/order_details/order_details.dart';
import 'package:client_app/data/Models/orders/orders.dart';
import 'package:client_app/data/repositories/OrderDetails.dart';
import 'package:equatable/equatable.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsRepo orderDetailsRepo = OrderDetailsRepo();
  OrderDetailsCubit() : super(OrderDetailsInitial());
  Orders? getOrderDetails({required int id}) {
    try {
      emit(OrderDetailsLoading());
      orderDetailsRepo.getOrderDetails(id: id).then((value) {
        if (value != null) {
          emit(OrderDetailsSuccess(orderDetails: value));
        } else {
          emit(OrderDetailsError());
        }
      });
    } catch (e) {
      emit(OrderDetailsError());
    }
    return null;
  }
}
