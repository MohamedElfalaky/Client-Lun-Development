import 'package:client_app/data/cubits/cubit/order_dart_cubit.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Cancel extends StatefulWidget {
  const Cancel({super.key});

  @override
  State<Cancel> createState() => _CancelState();
}

class _CancelState extends State<Cancel> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDartCubit, OrderDartState>(
      listener: (context, state) {
        // TODO: implement listener
      },
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
                  isCanceled: true,
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
    // TODO: implement initState

    context.read<OrderDartCubit>().getOrders(isCanceled: true);
    super.initState();
  }
}
