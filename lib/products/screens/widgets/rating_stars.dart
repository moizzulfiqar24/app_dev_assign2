import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool halfStar = rating - fullStars >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: Colors.amber, size: 16);
        } else if (halfStar && index == fullStars) {
          return const Icon(Icons.star_half, color: Colors.amber, size: 16);
        } else {
          return const Icon(Icons.star_border, color: Colors.grey, size: 16);
        }
      }),
    );
  }
}
