import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class OrderReceiptTile extends StatelessWidget {
  const OrderReceiptTile({super.key});

  @override
  Widget build(BuildContext context) {
    var alertStyle = const AlertStyle(
      animationType: AnimationType.fromBottom,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
    return Align(
      child: GestureDetector(
        onTap: () {
          Alert(
              style: alertStyle,
              context: context,
              title: "Receipt",
              content: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order ID',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '45894679182948',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '17 June 2023',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Korean (Long) Radish',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Qty',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '115 kg',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Customer',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '@amal_7954',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Loc',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          SizedBox(
                            width: 120,
                            child: Text(
                              '165/52,Street 01,Colombo 07.',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Weight',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '115 kg',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Distance',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            '42 km',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Item Amount',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Rs .8625.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Fee',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Rs. 624.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Rs. 9249.00',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'You Received',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                          Text(
                            'Rs. 8625.00',
                            style: TextStyle(
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
              buttons: [
                DialogButton(
                    color: Colors.greenAccent,
                    onPressed: () {},
                    child: const Text(
                      'Download',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                DialogButton(
                    color: Colors.white,
                    child: const Text('Cancel',
                        style: TextStyle(
                            color: Colors.greenAccent,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ]).show();
        },
        child: Container(
          padding: const EdgeInsets.only(left: 18, right: 18),
          width: MediaQuery.of(context).size.width * 0.9065,
          height: 69,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  blurRadius: 2,
                  color: Colors.grey,
                )
              ]),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.receipt,
                        color: Colors.greenAccent,
                        size: 40,
                      ),
                      Icon(
                        Icons.local_shipping,
                        color: Colors.greenAccent,
                      )
                    ],
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        '78659813469567',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '18.23 AM',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    '18 June 2023',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
