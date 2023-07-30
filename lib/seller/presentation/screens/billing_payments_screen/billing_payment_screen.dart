import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/billing_payments_tiles/transaction_receipt_tile.dart';

class BillingPaymentScreen extends StatelessWidget {
  const BillingPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Billing & Payments',
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
      body: Align(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  width: double.maxFinite,
                  height: 62,
                  color: const Color.fromRGBO(253, 238, 191, 1),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Earned: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Rs. 23750.00',
                              style: TextStyle(
                                  color: Color.fromRGBO(223, 173, 16, 1)),
                            )
                          ],
                        ),
                        Row(children: [
                          Text(
                            'Pending: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Rs. 23750.00',
                              style: TextStyle(
                                  color: Color.fromRGBO(223, 173, 16, 1)))
                        ])
                      ])),
              Container(
                padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(160, 42),
                            backgroundColor:
                                const Color.fromRGBO(105, 240, 174, 1),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Order Receipts',
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(160, 42),
                            backgroundColor:
                                const Color.fromRGBO(105, 240, 174, 1),
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Transactions',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Your Order Receipts',
                          style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.list,
                          color: Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TransactionReceiptTile();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 40,
      ),
    );
  }
}
