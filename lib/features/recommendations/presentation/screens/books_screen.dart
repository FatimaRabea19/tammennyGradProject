/*import 'package:flutter/material.dart';
import '../widgets/book_card.dart';
import 'package:tamenny/widgets/custom_bottom_nav.dart';
import 'package:tamenny/features/recommendations/data/repositories/dummy_books.dart';

// SCREENS
import 'package:tamenny/features/recommendations/presentation/screens/mbti_test_screen.dart';
import 'podcasts_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/book_details_screens/book_details_screen.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  int selectedIndex = 0;
  int bottomIndex = 0;

  final categories = ["Books", "Podcasts", "MBTI Test", "Exercises"];

  void _onNavTap(int index) {
    setState(() {
      bottomIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/tracker');
        break;
      case 2:
        Navigator.pushNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushNamed(context, '/booking');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3e9e3),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        title: const Text(
          "Recommendations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff203647),
          ),
        ),
      ),

      bottomNavigationBar: CustomBottomNav(
        currentIndex: bottomIndex,
        onTap: _onNavTap,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // CATEGORIES
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });

                      if (categories[index] == "Podcasts") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PodcastsScreen(),
                          ),
                        );
                        return;
                      }

                      if (categories[index] == "MBTI Test") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MbtiLandingPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff1B4965)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // BOOK LIST
            Expanded(
              child: ListView.builder(
                itemCount: booksList.length,
                itemBuilder: (context, index) {
                  final book = booksList[index];

                  return BookCard(
                    book: book,
                    onFavorite: () {},
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailsScreen(
                            title: book.title,
                            image: book.image,
                            rating: book.rating,
                            description: book.description,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 */

import 'package:flutter/material.dart';

/// ================= MODEL =================
class BookModel {
  final String title;
  final String description;
  final String author;

  BookModel({
    required this.title,
    required this.description,
    this.author = '',
  });
}

/// ================= DUMMY DATA =================
final List<BookModel> booksList = [
  BookModel(
    title: "The Power of Now",
    description: "A guide to spiritual enlightenment.",
    author: "Eckhart Tolle",
  ),
  BookModel(
    title: "Atomic Habits",
    description: "Build good habits and break bad ones.",
    author: "James Clear",
  ),
  BookModel(
    title: "Thinking, Fast and Slow",
    description: "Understanding how the mind works.",
    author: "Daniel Kahneman",
  ),
  BookModel(
    title: "Mindset",
    description: "The psychology of success.",
    author: "Carol Dweck",
  ),
  BookModel(
    title: "The Subtle Art.",
    description: "A counterintuitive approach to living.",
    author: "Mark Manson",
  ),
  BookModel(
    title: "Deep Work",
    description: "Rules for focused success in a distracted world.",
    author: "Cal Newport",
  ),
  BookModel(
    title: "Emotional Intelligence",
    description: "Why it can matter more than IQ.",
    author: "Daniel Goleman",
  ),
];

/// ================= SCREEN =================
class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  int selectedCategory = 0; // Books
  int bottomIndex = 0; // Home / Recommendations حسب مشروعك

  final List<String> categories = [
    "Books",
    "Podcasts",
    "MBTI Test",
    "Exercises",
  ];

  /// ===== Bottom Navigation =====
  void _onBottomNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/tracker');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/booking');
        break;
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  /// ===== Category Navigation =====
  void _onCategoryTap(int index) {
    setState(() => selectedCategory = index);

    if (categories[index] == "Podcasts") {
      Navigator.pushNamed(context, '/podcasts');
    } else if (categories[index] == "MBTI Test") {
      Navigator.pushNamed(context, '/mbti');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),

      /// ================= APP BAR =================
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1D3B58)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Recommendations",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D3B58),
          ),
        ),
      ),

      /// ================= BODY =================
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// ===== Categories =====
            SizedBox(
              height: 44,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final bool isSelected = selectedCategory == index;

                  return GestureDetector(
                    onTap: () => _onCategoryTap(index),
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff1D3B58)
                            : const Color(0xff506C86),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Text(
                        categories[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            /// ===== Books List (Vertical Scroll) =====
            Expanded(
              child: ListView.builder(
                itemCount: booksList.length,
                itemBuilder: (context, index) {
                  final book = booksList[index];
                  return _BookCard(book: book);
                },
              ),
            ),
          ],
        ),
      ),

      /// ================= BOTTOM NAV =================
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff1D3B58),
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.track_changes), label: 'Tracker'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

/// ================= BOOK CARD =================
class _BookCard extends StatelessWidget {
  final BookModel book;

  const _BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffE1D9D1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          /// Icon بدل الصورة
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xff506C86),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.menu_book,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 14),

          /// Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D3B58),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  book.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                if (book.author.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    "By ${book.author}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ],
            ),
          ),

          /// Favorite
          const Icon(
            Icons.favorite_border,
            color: Color(0xff1D3B58),
          ),
        ],
      ),
    );
  }
}

































