import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/utils/app_color.dart';
import 'package:movie_app/core/utils/app_style.dart';
import 'package:movie_app/core/models/filtter.model.dart';

class FiltterItem extends StatelessWidget {
  const FiltterItem({super.key, required this.item});
  final FiltterModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: AppColor.secondary,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.asset(
              item.img,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item.name,
          style: AppStyle.meduim14.copyWith(color: AppColor.secondary),
        )
      ],
    );
  }
}
