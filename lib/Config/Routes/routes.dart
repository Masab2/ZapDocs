import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/View/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case RouteNames.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Defined'),
              ),
            );
          },
        );
    }
  }
}
