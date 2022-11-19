import 'package:cached_network_image/cached_network_image.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderData.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatefulWidget {
  bool isDeliver;
  bool isInProgress;
  bool isCanceled;
  dynamic order;
  bool isRefunded;

  OrderCard(
      {super.key,
      this.isDeliver = false,
      this.isInProgress = false,
      this.isCanceled = false,
      this.isRefunded = false,
      this.order});
  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      // height: 306,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        // fit: StackFit.expand,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 93 / 2,
              ),
              Center(
                child: Container(
                  width: 380,
                  // height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.25),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: OrderState(
                              isCanceled: widget.isCanceled,
                              isDelivered: widget.isDeliver,
                              isInProgress: widget.isInProgress,
                              isRefunded: widget.isRefunded,
                            ),
                          ),
                          OrderTitle(order: widget.order),
                          const SizedBox(
                            height: 10,
                          ),
                          OrderDetails(
                            isCanceled: widget.isCanceled,
                            isDelivered: widget.isDeliver,
                            isInProgress: widget.isInProgress,
                            order: widget.order,
                            isRefunded: widget.isRefunded,
                          )
                        ]),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            // alignment: const Alignment(0, -1.5),
            // top: 0,
            right: 180,
            // left: 0,

            child: Container(
              // margin: const EdgeInsets.only(top: 10),
              width: 93,
              height: 93,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),

              child: CachedNetworkImage(
                imageUrl: widget.order!.market!.hasMedia!
                    ? widget.order!.market!.media!.first.url!
                    : "",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    widget.order!.orderStatusId == 1 ||
            widget.order!.orderStatusId == 2 ||
            widget.order!.orderStatusId == 3 ||
            widget.order!.orderStatusId == 4
        ? widget.isInProgress = true
        : widget.isInProgress = false;
    widget.order!.orderStatusId == 5
        ? widget.isDeliver = true
        : widget.isDeliver = false;
    widget.order!.orderStatusId == 6
        ? widget.isCanceled = true
        : widget.isCanceled = false;
    widget.order!.orderStatusId == 7
        ? widget.isRefunded = true
        : widget.isRefunded = false;
    super.initState();
  }
}
