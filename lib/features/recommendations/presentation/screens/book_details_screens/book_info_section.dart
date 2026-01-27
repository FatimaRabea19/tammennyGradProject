import 'package:flutter/material.dart';
import 'rating_stars.dart';

class BookInfoSection extends StatelessWidget {
  final String title;
  final double rating;

  const BookInfoSection({
    super.key,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        RatingStars(rating: rating),
      ],
    );
  }
}
