import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_indetail_page/requested_order/bloc/requested_order_in_details_bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class RequestedOrderDetailsPage extends StatelessWidget {
  final OrderDataModel orderDataModel;
  late RequestedOrderInDetailsBloc requestedOrderInDetailsBloc;
  RequestedOrderDetailsPage({super.key, required this.orderDataModel});

  @override
  Widget build(BuildContext context) {
    requestedOrderInDetailsBloc =
        BlocProvider.of<RequestedOrderInDetailsBloc>(context);

    return BlocListener<RequestedOrderInDetailsBloc,
        RequestedOrderInDetailsState>(
      bloc: requestedOrderInDetailsBloc,
      listener: (context, state) {
        if (state is RequestedOrderInDetailsAcceptedButtonClickedActionState) {
          _showConfirmationDialog(context);
        } else if (state
            is RequestedOrderInDetailsOrderMovedToAcceptedSucessActionState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('Order is now under accepted condition')));
        } else if (state
            is RequestedOrderInDetailsOrderMovedToAcceptedErrorActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                  'System having a problem with accepting this request!')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Requested Order',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16, left: 5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/OIP.RL7XzQfWqZEpUako3s38cwAAAA?pid=ImgDet&rs=1'),
                radius: 20,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // PostTileWidgetTest(
                    //   post: PostListData.postList
                    //       .map((e) => PostDataModel.fromJson(e))
                    //       .toList()
                    //       .first,
                    // ),
                    const SizedBox(height: 0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Order Info',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                        Text(
                            'Requested Date - ${DateFormat('dd MMMM yyyy').format(orderDataModel.orderDate!)}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 460,
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 0,
                            offset: Offset(0, 4),
                            blurRadius: 2,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.shopping_cart,
                                size: 40,
                                color: Colors.red,
                              ),
                              Text(
                                'ORDER ID - ${orderDataModel.orderId}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Customer Name',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(orderDataModel.buyerName.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black))
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Mobile',
                                      style: TextStyle(color: Colors.grey)),
                                  const SizedBox(height: 5),
                                  Text('+94 ${orderDataModel.buyerMobile}',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                ],
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email Address',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                      orderDataModel.buyerEmailAddress
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black))
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Delivery Location',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: 150,
                                    child: Text(
                                        orderDataModel.deliveryAddress
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black)),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.greenAccent,
                                  minimumSize: const Size(120, 40),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text('Map View'),
                              ),
                              const SizedBox(height: 5),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Message from Customer',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Container(
                            height: 144,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                border:
                                    Border.all(color: Colors.grey, width: 2)),
                            child: Text(orderDataModel.buyerMessage.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pricing',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 190,
                      padding: const EdgeInsets.all(20.0),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                              blurRadius: 2,
                              color: Colors.grey,
                            )
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Requesting',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  orderDataModel.buyerName.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  ' Quantity',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  '${orderDataModel.itemQuantity} kg',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Delivery Fee',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  'Rs. ${orderDataModel.deliveryFee.toString()}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                Text(
                                  'Rs. ${orderDataModel.totalAmount}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        // minimumSize: const Size(60, 67),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 32, 67),
                        backgroundColor: Colors.greenAccent,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      requestedOrderInDetailsBloc.add(
                          RequestedOrderInDetailPageAcceptOrderButtonClickedEvent());
                    },
                    child: const Center(
                      child: Text('Accept',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        // minimumSize: const Size(60, 67),
                        fixedSize:
                            Size(MediaQuery.of(context).size.width - 32, 67),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.greenAccent),
                    onPressed: () {},
                    child: const Center(
                      child: Text('Cancel',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 40,
        ),
      ),
    );
  }

  //Confirmation Dialog
  Future<void> _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // Prevent dialog from being dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Are you sure you want to Accept this Order?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // Perform the action here
                // ...
                requestedOrderInDetailsBloc.add(
                    RequestedOrderInDetailPageAcceptOrderButtonConfirmClickedEvent(
                        selectedOrder: orderDataModel));
              },
            ),
          ],
        );
      },
    );
  }
}
