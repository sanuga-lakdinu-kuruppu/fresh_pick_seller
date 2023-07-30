import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/business_logic/landing_page/bloc/landing_page_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/landing_screen/landing_screen_with_bnb.dart';

class RouteGenerator {
  final LandingPageBloc landingPageBloc = LandingPageBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child: const LandingPage(),
          ),
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
