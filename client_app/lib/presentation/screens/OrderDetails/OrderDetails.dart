import 'package:client_app/data/cubits/cubit/order_details_cubit.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/presentation/screens/OrderDetails/componentts/OrderDetailsCard.dart';
import 'package:client_app/presentation/widgets/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // toolbarHeight: 100,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
        leadingWidth: 65,
        toolbarHeight: 48,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'My Orders'.tr(context),
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.background),
        ),
        leading: Container(
          margin: const EdgeInsets.only(left: 16),
          child: const BackMenuWidget(),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#F5504C1A").withOpacity(0.1),

                    blurRadius: 0,
                    offset: const Offset(0, 8), // changes position of shadow
                  ),
                ],
              ),
            ),
            BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
              builder: (context, state) {
                if (state is OrderDetailsLoading) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is OrderDetailsSuccess) {
                  return Expanded(
                    child: OrderDetailsCard(
                      order: state.orderDetails!.data,
                      isOrderDetail: true,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No order details"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    context.read<OrderDetailsCubit>().getOrderDetails(id: id);
    super.didChangeDependencies();
  }
}
