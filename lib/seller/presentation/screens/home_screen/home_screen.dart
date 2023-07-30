import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/accepted_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/cancelled_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/completed_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/earn_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/ongoing_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/pending_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/analytic_tile/requested_tile.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/post_tile/post_tile_widget_horizontal.dart';
import '../../../../test_data/post_list.dart';
import '../../../data/models/post/post.dart';
import '../login_screen/login_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Align(
        child: SizedBox(
          child: Column(
            children: [
              Container(
                height: 246,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(105, 240, 174, 1),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        offset: Offset(2, 2),
                        blurRadius: 10,
                        color: Colors.grey),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Hi Vihara',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.line_style, color: Colors.white)
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Text('Member Since 12 September 2020',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.maxFinite, 50),
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Enter your desired item to search',
                                style: TextStyle(color: Colors.grey)),
                            Icon(Icons.search, color: Colors.grey)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        children: [
                          Text(
                            'Top Rated Seller',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.yellow),
                              Icon(Icons.star, color: Colors.red),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 35),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Container(
                              width: 60,
                              height: 3,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Container(
                              width: 60,
                              height: 3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Recent Posts',
                                style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.post_add,
                                color: Color.fromRGBO(105, 240, 174, 1),
                              ),
                            ],
                          ),
                          Text(
                            'See All',
                            style: TextStyle(
                                color: Color.fromRGBO(105, 240, 174, 1),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const Text(
                        'What have you previously posted in',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return PostTileWidgetHorizontal(
                              post: PostListData.postList
                                  .map((e) => PostDataModel(
                                        imageUrl: e['imageUrl'],
                                        id: e['id'],
                                        productName: e['productName'],
                                        productCategory: e['productCategory'],
                                        productSubCategory:
                                            e['productSubCategory'],
                                        minimumOrderQty: e['minimumOrderQty'],
                                        unit: e['unit'],
                                        minimumOrderPrice:
                                            e['minimumOrderPrice'],
                                        minimumOrderPricePer:
                                            e['minimumOrderPricePer'],
                                        productRating: e['productRating'],
                                        productStatus: e['productStatus'],
                                        countCompletedOrders:
                                            e['countCompletedOrders'],
                                        pickupLocation: e['pickupLocation'],
                                        postedDate: e['postedDate'],
                                        postDescription: e['postDescription'],
                                      ))
                                  .toList()
                                  .first,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 0, right: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Analytics',
                                style: TextStyle(
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.analytics,
                                color: Color.fromRGBO(105, 240, 174, 1),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Text(
                        'How is your business working',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: const [
                            EarnTile(),
                            PendingTile(),
                            RequestedTile(),
                            AcceptedTile(),
                            OngoingTile(),
                            CompletedTile(),
                            CancelledTile()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 16.0),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 30.0, right: 30.0),
                  width: 390,
                  height: 278,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(105, 209, 240, 1),
                        Color.fromRGBO(105, 240, 174, 1),
                      ],
                      stops: [0.1, 1.0],
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fresh Pick',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Where farming meets retails',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 200,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/composting.png'))),
                          )
                        ],
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 73,
                                height: 73,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/newpost.png'))),
                              ),
                              const SizedBox(height: 10),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Start',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue)),
                                  Text('Posting',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue)),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 26),
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.yellow,
                                    minimumSize: const Size(80, 30),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text('More'),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
