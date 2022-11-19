import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client_app/helpers/AppLocalizations.dart';
import 'package:client_app/helpers/myApplication.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderButtons.dart';
import 'package:client_app/presentation/screens/MyOrders/components/OrderData.dart';
import 'package:client_app/presentation/screens/OrderDetails/componentts/OrderDetailWebView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class OrderDetailsCard extends StatefulWidget {
  bool isDeliver;
  bool isInProgress;
  bool isCanceled;
  dynamic order;
  bool isRefunded;
  bool isOrderDetail;

  OrderDetailsCard(
      {super.key,
      this.isDeliver = false,
      this.isInProgress = false,
      this.isCanceled = false,
      this.isRefunded = false,
      this.isOrderDetail = false,
      this.order});
  @override
  State<OrderDetailsCard> createState() => _OrderDetailsCardState();
}

class _OrderDetailsCardState extends State<OrderDetailsCard> {
  final Set<Marker> _markers = {};
  BitmapDescriptor customIcon = BitmapDescriptor.defaultMarker;
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 25),
        // height: MediaQuery.of(context).size.height,
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
                    // height: double.infinity - 93,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.25),
                      child: SingleChildScrollView(
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
                              isOrderDetail: widget.isOrderDetail,
                            ),
                            widget.order.deliveryAddressId != null
                                ? Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Location'.tr(context),
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .headline5!
                                            .color,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        height: 1.9,
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 16,
                            ),
                            widget.order.deliveryAddressId != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: SizedBox(
                                      height: 185,
                                      width: 364,
                                      child: GoogleMap(
                                        compassEnabled: false,
                                        mapToolbarEnabled: false,
                                        myLocationEnabled: false,
                                        myLocationButtonEnabled: false,
                                        zoomControlsEnabled: false,
                                        zoomGesturesEnabled: false,
                                        liteModeEnabled: true,
                                        markers: {
                                          Marker(
                                            icon: customIcon,
                                            markerId: const MarkerId('1'),
                                            position: LatLng(
                                                widget.order.deliveryAddress
                                                    .latitude,
                                                widget.order.deliveryAddress
                                                    .longitude),
                                          ),
                                        },
                                        onMapCreated:
                                            (GoogleMapController controller) {
                                          controller.setMapStyle(
                                              MyApplication.mapStyle);
                                          if (!_controller.isCompleted) {
                                            _controller.complete(controller);
                                          }
                                        },
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(
                                              widget.order.deliveryAddress
                                                  .latitude,
                                              widget.order.deliveryAddress
                                                  .longitude),
                                          zoom: 14.4746,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: 364,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/Images/svg/location.svg',
                                          width: 24,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          widget.order.market.address,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .headline5!
                                                  .color,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 32,
                                        ),
                                        Text(
                                          widget.order.deliveryAddress.street +
                                              " " +
                                              widget.order.deliveryAddress
                                                  .buildingNum,
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!
                                                .withOpacity(.5),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Mobile No'.tr(context),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.9,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: 364,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Images/svg/cell-phone.svg',
                                    width: 24,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.order.market.mobile,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Paid with'.tr(context),
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.9,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              width: 364,
                              height: 48,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.background,
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset(
                                    'assets/Images/svg/cell-phone.svg',
                                    width: 24,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    widget.order.payment.method,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .color!,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10.5,
                                ),
                                SvgPicture.asset(
                                  'assets/Images/svg/paper.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Order Details'.tr(context),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.9,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MySeparator(
                              color: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .color!
                                  .withOpacity(.2),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Column(
                              children: [
                                ..._getOrderDetails(widget.order.productOrders),
                              ],
                            ),
                            const SizedBox(
                              height: 28,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10.5,
                                ),
                                SvgPicture.asset(
                                  'assets/Images/svg/paper.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Notes'.tr(context),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.9,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 11, right: 7),
                              child: Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                style: TextStyle(
                                    color: HexColor("#43494B"),
                                    fontSize: 16,
                                    letterSpacing: .48,
                                    height: 1.5),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 10.5,
                                ),
                                SvgPicture.asset(
                                  'assets/Images/svg/paper.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Payment Summary'.tr(context),
                                  style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .color,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    height: 1.9,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 17.5,
                                        ),
                                        Text(
                                          "Subtotal".tr(context),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.order.payment.price - widget.order.deliveryFee} ",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 7.5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 17.5,
                                        ),
                                        Text(
                                          "tax Added".tr(context),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.order.tax}",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 7.5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 17.5,
                                        ),
                                        Text(
                                          "Delivery Fee".tr(context),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.order.deliveryFee}",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 7.5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 16.5,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            MyApplication.navigateTo(
                                              OrderDetailWebView(
                                                orderId:
                                                    widget.order.id.toString(),
                                              ),
                                              context,
                                            );
                                          },
                                          child: Text(
                                            "Tax delivery invoice".tr(context),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${"including tax".tr(context)} ${widget.order.tax * 100}%",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                SizedBox(
                                  width: 313,
                                  child: Divider(
                                    color: Theme.of(context).dividerColor,
                                    thickness: 1,
                                  ),
                                ),
                                const SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 17.5,
                                        ),
                                        Text(
                                          "Total Amount".tr(context),
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "${widget.order.payment.price}",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline5!
                                                .color!,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 7.5,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                OrderButtons(
                                  isDelivered: widget.isDeliver,
                                  isCanceled: widget.isCanceled,
                                  isInProgress: widget.isInProgress,
                                  isRefunded: widget.isRefunded,
                                ),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 14),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        "assets/Images/svg/paper.svg",
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        width: 9,
                                      ),
                                      Text(
                                        "Download Invoice PDF".tr(context),
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.22,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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
      ),
    );
  }

  @override
  void initState() {
// make sure to initialize before map loading
    // setCustomMarker();
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

  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 1.5),
        'assets/images/marker.png');
  }

  List<Widget> _getOrderDetails(productOrders) {
    List<Widget> list = [];
    for (var i = 0; i < productOrders.length; i++) {
      list.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                const SizedBox(
                  width: 17.5,
                ),
                Text(
                  "${productOrders[i].quantity} x ${productOrders[i].name}",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline5!.color!,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  productOrders[i].price.toString(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline5!.color!,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  width: 7.5,
                ),
              ],
            ),
          ],
        ),
      );
    }
    return list;
  }
}
