import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/views/widget/custom_appbar.dart';
import 'package:movie_app/views/widget/featured_series.dart';
import 'package:movie_app/views/widget/filtter_list_view.dart';
import 'package:movie_app/views/widget/search_appbar.dart';
import 'package:movie_app/views/widget/text_featured_series.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColor.primary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppbar(),
                    const SizedBox(height: 35),
                    const SearchAppbar(),
                    const SizedBox(height: 35),
                    Text(
                      "Filters",
                      style: AppStyle.meduim18.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    const FiltterListView(),
                    const SizedBox(height: 30),
                  const TextFeaturedSeries(),
                    const SizedBox(height: 24),
                     FeaturedSeries(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
