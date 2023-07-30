import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_page/bloc/order_page_bloc.dart';
import '../../../widgets/loading_tile/screen_loading_tile.dart';
import '../../../widgets/order_tile/requested_order_tile.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with TickerProviderStateMixin {
  TabController? tabController;

  late OrderPageBloc orderPageBloc;

  @override
  void initState() {
    orderPageBloc = BlocProvider.of<OrderPageBloc>(context);
    orderPageBloc.add(OrderPageInitialFetchEvent());
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderPageBloc, OrderPageState>(
      bloc: orderPageBloc,
      buildWhen: (previous, current) => current is! OrderPageActionState,
      listenWhen: (previous, current) => current is OrderPageActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case OrderPageLoadingState:
            return const ScreenLoadingWidget();
          case OrderPageLoadingSucessState:
            return Scaffold(
              body: Align(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: 124,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 1,
                              offset: Offset(2, 2),
                              blurRadius: 10,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your Activities',
                                    style: TextStyle(
                                        color: Color.fromRGBO(151, 151, 151, 1),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              TabBar(
                                controller: tabController,
                                indicatorSize: TabBarIndicatorSize.tab,
                                indicatorColor: Colors.yellow,
                                indicatorWeight: 4,
                                unselectedLabelColor:
                                    const Color.fromRGBO(151, 151, 151, 1),
                                isScrollable: true,
                                labelColor:
                                    const Color.fromRGBO(105, 240, 174, 1),
                                labelStyle: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                                tabs: const <Widget>[
                                  Tab(
                                    child: Text(
                                      'Requested',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Accepted',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Ongoing',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Completed',
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      'Cancelled',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const RequestedOrderTileWidget();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const RequestedOrderTileWidget();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const RequestedOrderTileWidget();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const RequestedOrderTileWidget();
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return const RequestedOrderTileWidget();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
