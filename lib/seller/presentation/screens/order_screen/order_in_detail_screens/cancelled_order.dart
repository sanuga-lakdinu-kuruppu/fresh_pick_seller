import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:intl/intl.dart';

import '../../../../business_logic/order_indetail_page/cancelled_order/bloc/cancelled_order_bloc.dart';

// ignore: must_be_immutable
class CancelledOrderInDetailPage extends StatelessWidget {
  final OrderDataModel orderDataModel;
  late CancelledOrderBloc cancelledOrderBloc;
  CancelledOrderInDetailPage({super.key, required this.orderDataModel});

  @override
  Widget build(BuildContext context) {
    cancelledOrderBloc = BlocProvider.of<CancelledOrderBloc>(context);
    return BlocListener<CancelledOrderBloc, CancelledOrderState>(
      bloc: cancelledOrderBloc,
      listener: (context, state) {},
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Cancelled Order',
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
                    const SizedBox(height: 0),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Order Info',
                            style: TextStyle(
                                color: Color.fromRGBO(151, 151, 151, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 600,
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
                              const SizedBox(height: 5),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Item Requested',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(orderDataModel.itemName.toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text('${orderDataModel.itemQuantity} kg',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Requested Date',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                  DateFormat('dd MMMM yyyy')
                                      .format(orderDataModel.orderDate!),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Cancelled Date',
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                  DateFormat('dd MMMM yyyy')
                                      .format(orderDataModel.cancelledDate!),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black))
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Reason',
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
                            child: Text(
                                orderDataModel.cancelledReason.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
          content: const Text('Are you sure you want to Cancel this Order?'),
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
                // acceptedOrderIndetailPageBloc.add(
                //     AcceptedOrderInDetailPageCancelOrderButtonConfirmedClickedEvent(
                //         selectedOrder: orderDataModel));
              },
            ),
          ],
        );
      },
    );
  }
}
