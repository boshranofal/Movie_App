import 'package:flutter/material.dart';
import 'package:movie_app/core/di/dependency_injuction.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/app_routes.dart';

void main() async {
  await setUpGetIt();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: "Hello",
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.home,
    );
  }
}
