import 'package:mvvm/utills/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_view.dart';
import 'package:mvvm/view/signup_view.dart';
import 'package:mvvm/view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routesname.home:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const HomeScreen());

      case Routesname.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());

      case Routesname.splash:
      return MaterialPageRoute(builder: 
      (BuildContext context) => const SplashView());
            
      case Routesname.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}
