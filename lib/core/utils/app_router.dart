import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/di/dependency_injuction.dart';
import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/logic/cubit/home_cubit.dart';
import 'package:movie_app/views/screen/details_screen.dart';
import 'package:movie_app/views/screen/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..fetchMovies(),
            child: const HomeScreen(),
          ),
        );
      case AppRoutes.detail:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            model: settings.arguments as Results,
          ),
        );
    
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
