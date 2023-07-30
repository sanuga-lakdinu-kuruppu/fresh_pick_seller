import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class NewDeposit extends StatelessWidget {
  const NewDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    var alertStyle = const AlertStyle(
      animationType: AnimationType.fromBottom,
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
    return GestureDetector(
      onTap: () {
        Alert(
            style: alertStyle,
            context: context,
            title: 'Membership Payment Details',
            content: const Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Upload Date',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '10 June 2023',
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
                          'Upload Time',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '15.23 PM',
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
                          'Bank Name',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        SizedBox(
                          width: 130,
                          child: Text(
                            'Commercial Bank of Ceylon PLC',
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
                          'Bank Branch',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Panadura',
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
                          'Account Number',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          '7889561346',
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
                          'Account Holder',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Vihara Perera',
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
                          'Amount',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'Rs. 500.00',
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
                          'Uploaded Receipt',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                        Text(
                          'fdjk799.jpg',
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
      child: Align(
        child: Container(
          padding: const EdgeInsets.only(left: 18, right: 18),
          width: MediaQuery.of(context).size.width * 0.9065,
          height: 80,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bill.png'))),
                      )
                    ],
                  ),
                  const SizedBox(width: 25),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New Bank Deposit',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
