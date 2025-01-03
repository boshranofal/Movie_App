import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/networking/api_constant.dart';
import 'package:movie_app/core/utils/app_routes.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/logic/cubit/home_cubit.dart';


class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final filteredMovies = cubit.filteredMovies ?? [];
          if (filteredMovies.isEmpty) {
            return Center(
              child: Text(
                'No movies found',
                style: AppStyle.meduim14.copyWith(
                  color: Colors.white70,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: filteredMovies.length,
            itemBuilder: (context, index) {
              final movie = filteredMovies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.detail,
                    arguments: movie,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(
                       ApiConstants.imageBaseUrl +
                          ApiConstants.posterSize +
                          (movie.posterPath ?? ''),
                      width: 50,
                      height: 75,
                      fit: BoxFit.cover,
                      // errorWidget: (context, url, error) =>
                      //     const Icon(Icons.error, color: Colors.red),
                      // placeholder: (context, url) =>
                      //      const CircularProgressIndicator(
                      //   color: AppColor.primary,
                      // ),
                    ),
                    title: Text(
                      movie.title ?? 'Unknown Title',
                      style: AppStyle.meduim14.copyWith(
                        color: Colors.white,
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
