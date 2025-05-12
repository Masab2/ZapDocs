import 'package:flutter/material.dart';
import 'package:zapdocs/Config/Routes/route_name.dart';
import 'package:zapdocs/View/view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteNames.splashView:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
        );
      case RouteNames.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case RouteNames.registerView:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
        );
      case RouteNames.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
        );
      case RouteNames.checkEmailView:
        return MaterialPageRoute(
          builder: (context) => const CheckEmailView(),
        );
      case RouteNames.verifyPinView:
        return MaterialPageRoute(
          builder: (context) => VerifyPinView(email: args as String),
        );
      case RouteNames.updatePasswordView:
        final Map<String, dynamic> arguments = args as Map<String, dynamic>;
        final email = arguments['email'] as String;
        final pin = arguments['pin'] as String;
        return MaterialPageRoute(
          builder: (context) => UpdatePasswordView(
            pin: pin,
            email: email,
          ),
        );
      case RouteNames.notesView:
        return MaterialPageRoute(
          builder: (context) => NotesView(),
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
