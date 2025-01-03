// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/core/models/movie_response_model.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/logic/cubit/home_cubit.dart';
import 'package:movie_app/views/screen/details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeaturedSeries extends StatefulWidget {
   FeaturedSeries({
    super.key,
    this.movie,
  });

  final Results? movie;
  final List <MoviesResponseModel> favoriteMovies = [];
  @override
  State<FeaturedSeries> createState() => _FeaturedSeriesState();
}

class _FeaturedSeriesState extends State<FeaturedSeries> {
  final PageController _pageController = PageController(viewportFraction: 0.7);
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetMoviesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is GetMoviesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetMoviesSuccess) {
          var listOfMovies = state.movies.results;
          if (listOfMovies == null || listOfMovies.isEmpty) {
            return const Center(child: Text('No movies available'));
          }
          return SizedBox(
            height: 300,
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: _pageController,
              itemCount: listOfMovies.length,
               physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double value = 0;
                    if (_pageController.hasClients &&_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                    }
                     else {
                value = _pageController.initialPage - index.toDouble();
              }
                     value = value.clamp(-1, 1);
              final double verticalOffset = value.abs() * 22;
              final double rotation = value * -0.1;
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, verticalOffset)
                  ..rotateZ(rotation),
                alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                model: listOfMovies[index],
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Stack(
                              children: [
                                Image.network(
                                  listOfMovies[index].posterPath != null
                                      ? '${ApiConstants.imageBaseUrl + ApiConstants.posterSize}${listOfMovies[index].posterPath}'
                                      : 'https://via.placeholder.com/300',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 10,
                                  right: 16,
                                  child: GestureDetector(
                                    onTap:favoriteMovies.add(listOfMovies[index]),
                                    child: Icon(
                                      isFavorite
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_border_rounded,
                                      color: isFavorite
                                          ? Colors.red
                                          : Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                ),
                              ],
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
        return const SizedBox();
      },
    );
  }
}
