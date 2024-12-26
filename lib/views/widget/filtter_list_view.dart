import 'package:flutter/material.dart';
import 'package:movie_app/views/widget/filtter_item.dart';

class FiltterListView extends StatelessWidget {
  const FiltterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => const FiltterItem(
            //item: filtterItem[index],
            ),
      ),
    );
  }
}
