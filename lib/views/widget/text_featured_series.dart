import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/views/screen/favorit_screen.dart';

class TextFeaturedSeries extends StatelessWidget {
  const TextFeaturedSeries({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Featured",
          style: AppStyle.meduim24.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 6),
        Text(
          "Series",
          style: AppStyle.light.copyWith(color: Colors.white),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoritScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.favorite_border_rounded,
              color: Colors.white,
            ))
      ],
    );
  }
}
