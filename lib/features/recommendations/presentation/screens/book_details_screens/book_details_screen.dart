import 'package:flutter/material.dart';
import 'book_cover.dart';
import 'bottom_action_bar.dart';
import 'book_info_section.dart';

class BookDetailsScreen extends StatelessWidget {
  final String title;
  final String image;
  final double rating;
  final String description;

  const BookDetailsScreen({
    super.key,
    required this.title,
    required this.image,
    required this.rating,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3e9e3),
      body: SafeArea(
        child: Column(
          children: [
            // BACK BUTTON
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),

            // CONTENT SCROLL
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BookCover(image: image),
                    const SizedBox(height: 20),
                    BookInfoSection(
                      title: title,
                      rating: rating,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomActionBar(),
    );
  }
}
