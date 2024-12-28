import 'package:flutter/material.dart';
import 'package:movie_app/core/models/feature_series_model.dart';
import 'package:movie_app/views/screen/details_screen.dart';
import 'package:movie_app/views/widget/movie_details.dart';

class FeaturedSeries extends StatefulWidget {
  const FeaturedSeries({super.key});

  @override
  State<FeaturedSeries> createState() => _FeaturedSeriesState();
}

class _FeaturedSeriesState extends State<FeaturedSeries> {
  final PageController _pageController = PageController(viewportFraction: 0.7);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 0;
              if (_pageController.position.haveDimensions) {
                value = index - _pageController.page!;
                value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
              }
              return Transform.scale(
                scale: value, // تكبير البطاقة في المنتصف
                child: GestureDetector(
                  onTap: () {
                    // التنقل إلى صفحة التفاصيل عند النقر
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailsScreen()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        FeatureSeriesModel.featureSeriesItem[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
