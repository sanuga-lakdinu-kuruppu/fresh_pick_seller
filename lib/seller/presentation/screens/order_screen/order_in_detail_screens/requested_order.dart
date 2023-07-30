import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/post_tile/post_tile_widget_test.dart';

import '../../../../../test_data/post_list.dart';
import '../../../../data/models/post/post.dart';

class RequestedOrderDetailsPage extends StatelessWidget {
  const RequestedOrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  PostTileWidgetTest(
                    post: PostListData.postList
                        .map((e) => PostDataModel(
                              imageUrl: e['imageUrl'],
                              id: e['id'],
                              productName: e['productName'],
                              productCategory: e['productCategory'],
                              productSubCategory: e['productSubCategory'],
                              minimumOrderQty: e['minimumOrderQty'],
                              unit: e['unit'],
                              minimumOrderPrice: e['minimumOrderPrice'],
                              minimumOrderPricePer: e['minimumOrderPricePer'],
                              productRating: e['productRating'],
                              productStatus: e['productStatus'],
                              countCompletedOrders: e['countCompletedOrders'],
                              pickupLocation: e['pickupLocation'],
                              postedDate: e['postedDate'],
                              postDescription: e['postDescription'],
                            ))
                        .toList()
                        .first,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order Info',
                          style: TextStyle(
                              color: Color.fromRGBO(151, 151, 151, 1),
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      Text('Requested Date - 26 June 2023',
                          style: TextStyle(
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
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 40,
                              color: Colors.red,
                            ),
                            Text(
                              'ORDER ID - 7853149874613',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer Name',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text('@ishara_46',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Mobile',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(height: 5),
                                Text('+941234567a',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ],
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email Address',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text('ishara@gmail.com',
                                    style: TextStyle(
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
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivery Location',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text('4/b,Temple Road, Galle.',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
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
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: const Text(
                              'Can you respond and accept this as soon as possible this is very urgent one',
                              style: TextStyle(
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
                    height: 250,
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
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Requesting',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Ishara Perera',
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
                                ' Quantity',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
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
                                'Item Amount',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Rs. 6245.00',
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Rs. 614.00',
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
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Rs. 7223.00',
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
                                'You will receive',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                'Rs.6245.00 ',
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
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      // minimumSize: const Size(60, 67),
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 32, 67),
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {},
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
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        height: 40,
      ),
    );
  }
}
