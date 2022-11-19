import 'package:client_app/data/cubits/cubit/order_dart_cubit.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDartCubit, OrderDartState>(
      builder: (context, state) {
        if (state is OrderDartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OrderDartLoaded) {
          return ListView.builder(
            itemCount: state.orders!.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/orderDetails',
                      arguments: state.orders!.data![index].id);
                },
                child: OrderCard(
                  order: state.orders!.data![index],
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("No Orders"));
        }
      },
    );
  }

  @override
  void initState() {
    context.read<OrderDartCubit>().getOrders();
    super.initState();
  }
}
