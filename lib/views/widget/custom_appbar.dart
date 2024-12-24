import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  "Hello",
                  style: AppStyle.semiBold24.copyWith(color: Colors.white),
                ),
                const SizedBox(width: 8),
                Text(
                  "Daizy!",
                  style: AppStyle.light.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text("Check for the latest addition",
                style: AppStyle.meduim14.copyWith(color: AppColor.secondary)),
          ],
        ),
        const Spacer(),
        Image.asset(Images.profile_Image)
      ],
    );
  }
}
