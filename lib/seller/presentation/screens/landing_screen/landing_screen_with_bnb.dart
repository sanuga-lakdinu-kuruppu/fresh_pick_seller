import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/landing_page/bloc/landing_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/home_screen/home_screen.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/market_screen/market_screen.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/order_screen/order_main/order_screen.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/setting_screen/setting_screen.dart';
import '../notification_screen/notification_screen.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grid_view_outlined),
    label: 'Market',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.grading_outlined),
    label: 'Orders',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.notifications_none_outlined),
    label: 'Notification',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.settings_outlined),
    label: 'Setting',
  ),
];

const List<Widget> bottomNavScreenList = <Widget>[
  HomeScreen(),
  MarketScreen(),
  OrderScreen(),
  NotificationScreen(),
  SettingScreen(),
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              bottomNavScreenList.elementAt(state.tabIndex).toString(),
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
          body: bottomNavScreenList.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavItems,
            currentIndex: state.tabIndex,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChanged(tabIndex: index));
            },
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
