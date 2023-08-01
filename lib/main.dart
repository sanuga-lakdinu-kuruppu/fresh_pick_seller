import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/auth_page/bloc/auth_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/market_page/bloc/marketplace_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/new_post_page/bloc/new_post_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/notification_page/bloc/notification_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_indetail_page/accepted_order/bloc/accepted_order_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_indetail_page/cancelled_order/bloc/cancelled_order_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_indetail_page/ongoing_order/bloc/ongoing_order_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_indetail_page/requested_order/bloc/requested_order_in_details_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_page/bloc/order_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/settings_page/bloc/settings_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/routes/generated_routes.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MarketplacePageBloc(),
        ),
        BlocProvider(
          create: (context) => SettingsPageBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationPageBloc(),
        ),
        BlocProvider(
          create: (context) => OrderPageBloc(),
        ),
        BlocProvider(
          create: (context) => AuthPageBloc(),
        ),
        BlocProvider(
          create: (context) => NewPostPageBloc(),
        ),
        BlocProvider(
          create: (context) => RequestedOrderInDetailsBloc(),
        ),
        BlocProvider(
          create: (context) => AcceptedOrderIndetailPageBloc(),
        ),
        BlocProvider(
          create: (context) => CancelledOrderBloc(),
        ),
        BlocProvider(
          create: (context) => OngoingOrderInDetailBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fresh Pick App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(105, 240, 174, 1),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(105, 240, 174, 1),
          foregroundColor: Colors.white,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color.fromRGBO(105, 240, 174, 1),
          unselectedItemColor: Colors.grey,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(105, 240, 174, 1),
          ),
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator().generateRoute,
    );
  }
}
