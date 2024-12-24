import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/views/screen/details_screen.dart';
import 'package:movie_app/views/screen/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.detail:
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
    }
  }
}
