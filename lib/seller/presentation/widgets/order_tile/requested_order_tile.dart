import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/order_screen/order_in_detail_screens/requested_order.dart';

class RequestedOrderTileWidget extends StatelessWidget {
  const RequestedOrderTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RequestedOrderDetailsPage()));
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
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Korean (Long) Radish',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '17 June 2023',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '09.42 AM',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Customer Name',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            '@ishara_46_04_',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Order From',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          'Gampaha District',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
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
                          '115 kg',
                          style: TextStyle(
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
      ),
    );
  }
}
