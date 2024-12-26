import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_images.dart';
import 'package:movie_app/core/utils/app_style.dart';

class SearchAppbar extends StatelessWidget {
  const SearchAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.tertiary.withOpacity(0.12),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Images.search,
            fit: BoxFit.scaleDown,
          ),
          const SizedBox(width: 12),
          Text(
            "Search",
            style: AppStyle.meduim14.copyWith(color: AppColor.secondary),
          ),
          const SizedBox(width: 165),
          Container(
            height: 25,
            width: 1,
            color: AppColor.secondary,
          ),
          const SizedBox(width: 16),
          SvgPicture.asset(
            Images.mic,
            fit: BoxFit.scaleDown,
          ),
        ],
      ),
    );
  }
}
