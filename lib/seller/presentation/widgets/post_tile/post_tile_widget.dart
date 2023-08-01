import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/market_page/bloc/marketplace_page_bloc.dart';
import '../../../data/models/post/post.dart';

// ignore: must_be_immutable
class PostTileWidget extends StatelessWidget {
  final PostDataModel post;
  late MarketplacePageBloc marketPlaceBloc;

  PostTileWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    marketPlaceBloc = BlocProvider.of<MarketplacePageBloc>(context);
    return Align(
      child: GestureDetector(
        onTap: () {
          marketPlaceBloc.add(PostTileClickedEvent(
            selectedPost: post,
          ));
        },
        child: Container(
          height: 160,
          width: double.maxFinite,
          margin: const EdgeInsets.only(
            bottom: 10.0,
          ),
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
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //396 328  0.052986
              Hero(
                tag: post.id!,
                child: Container(
                  height: 160,
                  width: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).size.width *
                      0.00052986,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    image: DecorationImage(
                      image: NetworkImage(post.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Product Name'),
                              SizedBox(
                                width: 100,
                                child: Text(post.postName!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
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
                                      width: 5,
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
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Minimum Order',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              child: Text(
                                '${post.minimumOrderQty} ${post.unit}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Completed',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '${post.countCompletedOrders}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Price',
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: [
                              Text(
                                'Rs. ${post.minimumOrderPrice}0 / ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                '1kg',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
