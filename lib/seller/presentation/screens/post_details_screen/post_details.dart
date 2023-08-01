import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/data/models/post/post.dart';
import 'package:fresh_pick_seller/seller/presentation/widgets/review_tile/review_title.dart';
import 'package:intl/intl.dart';

class PostDetailsPage extends StatelessWidget {
  final PostDataModel post;
  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            'Post - Details',
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
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Hero(
                  tag: post.id!,
                  child: Container(
                    width: double.maxFinite,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      image: DecorationImage(
                          image: NetworkImage(post.imageUrl!),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Basic Info',
                        style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                    Text(
                        'Posted Date - ${DateFormat('yyyy-MM-dd').format(post.postedDate!)}',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12))
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.all(20.0),
                    width: 390,
                    height: 580,
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
                        ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Product Name',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(width: 5),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit))
                                  ],
                                ),
                                Text(post.postName!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                            Container(
                              width: 60,
                              padding: const EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(
                                      color: Colors.greenAccent, width: 2)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.yellow,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  const Text(
                                    'Active',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.greenAccent),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Minimum Order',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(width: 2),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit))
                                  ],
                                ),
                                Text('${post.minimumOrderQty} ${post.unit}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Completed',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.verified,
                                          color: Colors.greenAccent,
                                        ))
                                  ],
                                ),
                                Text('${post.countCompletedOrders}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Price',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(width: 2),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit))
                                  ],
                                ),
                                Text('Rs. ${post.minimumOrderPrice}0  ',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Per',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                        ))
                                  ],
                                ),
                                const Text('1kg',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text('Pick up Location',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(width: 10),
                                    Icon(
                                      Icons.my_location,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Text(post.pickupLocation!,
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
                                minimumSize: const Size(80, 30),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text('Map View'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Category',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(width: 2),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit))
                                  ],
                                ),
                                Text(post.postCategory!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Sub Category',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                        ))
                                  ],
                                ),
                                Text(post.postSubCategory!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black))
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('Description',
                                        style: TextStyle(color: Colors.grey)),
                                    const SizedBox(width: 2),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 144,
                          width: double.maxFinite,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border: Border.all(color: Colors.grey, width: 2)),
                          child: Text(post.postDescription!,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ),
                        const SizedBox(height: 5),
                      ],
                    )),
                const SizedBox(height: 25),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('More about your post',
                        style: TextStyle(
                            color: Color.fromRGBO(151, 151, 151, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  width: 390,
                  height: 400,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 0,
                            offset: Offset(0, 4),
                            blurRadius: 2,
                            color: Colors.grey)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(children: [
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Overall Ratings',
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Icon(Icons.star, color: Colors.yellow),
                                    Icon(Icons.star, color: Colors.yellow),
                                    Icon(Icons.star, color: Colors.red),
                                    Icon(Icons.star, color: Colors.red),
                                  ],
                                ),
                                SizedBox(width: 10),
                                Text('4.0',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Review (02)',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(width: 2),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
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
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: const Column(
                        children: [
                          ReviewTile(),
                          SizedBox(height: 5),
                          ReviewTile(),
                          SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      minimumSize: const Size(double.maxFinite, 67),
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: const Center(
                    child: Text('Delete this post',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 05),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomAppBar(
          height: 40,
        ));
  }
}
