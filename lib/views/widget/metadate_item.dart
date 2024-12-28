// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MetadateItem extends StatelessWidget {
  const MetadateItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(
        icon,
        color: Colors.white70,
        size: 22,
      ),
      const SizedBox(width: 8),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          Text(
            releaseDate,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      )
    ]);
  }
}
