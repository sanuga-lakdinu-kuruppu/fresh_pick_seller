import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_page/bloc/order_page_bloc.dart';
import 'package:fresh_pick_seller/seller/data/models/orders/orders.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CancelledOrderTileWidget extends StatelessWidget {
  final OrderDataModel orderDataModel;
  late OrderPageBloc orderPageBloc;
  CancelledOrderTileWidget({super.key, required this.orderDataModel});

  @override
  Widget build(BuildContext context) {
    orderPageBloc = BlocProvider.of<OrderPageBloc>(context);
    return GestureDetector(
      onTap: () {
        orderPageBloc.add(OrderPageCancelledOrderTileClickedEvent(
            selectedOrder: orderDataModel));
      },
      child: Container(
        height: 160,
        width: double.maxFinite,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              offset: Offset(0, 4),
              blurRadius: 2,
              color: Colors.grey,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.shopping_cart,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          orderDataModel.itemName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat('dd MMMM yyyy')
                            .format(orderDataModel.orderDate!),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        DateFormat('HH:mm').format(orderDataModel.orderDate!),
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Customer Name',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          orderDataModel.buyerName.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Order From',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        orderDataModel.buyerDistrict.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Requesting',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${orderDataModel.itemQuantity} kg',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
