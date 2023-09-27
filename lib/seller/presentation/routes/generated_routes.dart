import 'package:flutter/material.dart';
import 'package:fresh_pick_seller/seller/business_logic/landing_page/bloc/landing_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/landing_screen/landing_screen_with_bnb.dart';

import '../screens/login_screen/login_main.dart';

class RouteGenerator {
  final LandingPageBloc landingPageBloc = LandingPageBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) {
            // Here, check if the user is authenticated or not
            // If authenticated, navigate to LandingPage
            // If not authenticated, navigate to LoginScreen
            bool isAuthenticated = true; // Your authentication logic here
            // ignore: dead_code
            return isAuthenticated ? const LandingPage() : const LoginPage();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error!'),
        ),
        body: const Center(child: Text('Error Occured!')),
      );
    });
  }
}
