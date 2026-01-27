import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ===== Custom AppBar =====
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'My Favourites',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff1D3B58),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 24),

                /// ===== Favourite Books =====
                const Text(
                  'Favourite Books',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16),

                _favouriteItem(),
                const SizedBox(height: 16),
                _favouriteItem(),

                const SizedBox(height: 32),

                /// ===== Favourite Podcasts =====
                const Text(
                  'Favourite podcasts',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                const SizedBox(height: 16),

                _favouriteItem(),
                const SizedBox(height: 16),
                _favouriteItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ===== Favourite Item =====
  Widget _favouriteItem() {
    return Row(
      children: [
        /// Image Placeholder
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: const Color(0xff506C86),
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        const SizedBox(width: 16),

        /// Text Placeholder
        Container(
          width: 120,
          height: 12,
          decoration: BoxDecoration(
            color: const Color(0xffD6CEC5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
