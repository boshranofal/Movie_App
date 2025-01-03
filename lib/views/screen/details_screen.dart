import 'package:flutter/material.dart';
import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/views/widget/movie_details.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.model});
  final Results? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  MovieDetails(
        model: model!,
      ),
    );
  }
}
