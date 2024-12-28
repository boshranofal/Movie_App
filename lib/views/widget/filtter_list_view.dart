import 'package:flutter/material.dart';
import 'package:movie_app/core/models/filtter.model.dart';
import 'package:movie_app/views/widget/filtter_item.dart';

class FiltterListView extends StatelessWidget {
  const FiltterListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        4,
        (index) => FiltterItem(
          item: FiltterModel.filtterItem[index],
        ),
      ),
    );
  }
}
