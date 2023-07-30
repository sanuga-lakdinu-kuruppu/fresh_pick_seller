import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/auth_page/bloc/auth_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/market_page/bloc/marketplace_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/notification_page/bloc/notification_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/order_page/bloc/order_page_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/settings_page/bloc/settings_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/routes/generated_routes.dart';

void main() {
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
