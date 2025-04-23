import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_affirmation_counter/pages/intro_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => IntroScreen(
                  title: "Test login",
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => IntroScreen(
                  title: "Test login",
                ));
    }
  }

  void dispose() {}
}
