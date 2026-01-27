/*import 'package:flutter/material.dart';
import '../widgets/podcast_card.dart';
import 'package:tamenny/features/recommendations/data/models/podcast_model.dart';
import 'package:tamenny/widgets/custom_bottom_nav.dart';

// SCREENS
import 'books_screen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/mbti_test_screen.dart';

class PodcastsScreen extends StatefulWidget {
  const PodcastsScreen({super.key});

  @override
  State<PodcastsScreen> createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  int selectedIndex = 1; // Podcasts selected by default
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

                      if (categories[index] == "Books") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BooksScreen(),
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

            // PODCAST LIST
            Expanded(
              child: ListView.builder(
                itemCount: podcastsList.length,
                itemBuilder: (context, index) {
                  final podcast = podcastsList[index];

                  return PodcastCard(
                    podcast: podcast,
                    onFavorite: () {},
                    onTap: () {},
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
class PodcastModel {
  final String title;
  final String description;
  final String host;

  PodcastModel({
    required this.title,
    required this.description,
    this.host = '',
  });
}

/// ================= DUMMY DATA =================
final List<PodcastModel> podcastsList = [
  PodcastModel(
    title: "Mental Health Tips",
    description: "Learn how to manage stress and anxiety.",
    host: "Dr. Sarah",
  ),
  PodcastModel(
    title: "Mindfulness Daily",
    description: "Daily mindfulness exercises for beginners.",
    host: "John Doe",
  ),
  PodcastModel(
    title: "Sleep Better",
    description: "Techniques to improve sleep quality.",
    host: "Jane Smith",
  ),
  PodcastModel(
    title: "Mental Health Tips",
    description: "Learn how to manage stress and anxiety.",
    host: "Dr. Sarah",
  ),
  PodcastModel(
    title: "Mindfulness Daily",
    description: "Daily mindfulness exercises for beginners.",
    host: "John Doe",
  ),
  PodcastModel(
    title: "Sleep Better",
    description: "Techniques to improve sleep quality.",
    host: "Jane Smith",
  ),
  PodcastModel(
    title: "Mental Health Tips",
    description: "Learn how to manage stress and anxiety.",
    host: "Dr. Sarah",
  ),
  PodcastModel(
    title: "Mindfulness Daily",
    description: "Daily mindfulness exercises for beginners.",
    host: "John Doe",
  ),
  PodcastModel(
    title: "Sleep Better",
    description: "Techniques to improve sleep quality.",
    host: "Jane Smith",
  ),
];

/// ================= SCREEN =================
class PodcastsScreen extends StatefulWidget {
  const PodcastsScreen({super.key});

  @override
  State<PodcastsScreen> createState() => _PodcastsScreenState();
}

class _PodcastsScreenState extends State<PodcastsScreen> {
  int selectedCategory = 1; // Podcasts
  int bottomIndex = 2; // Chat/Recommendations حسب مشروعك

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

    if (categories[index] == "Books") {
      Navigator.pushNamed(context, '/books');
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
          "Recommendation",
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

            /// ===== Podcast List =====
            Expanded(
              child: ListView.builder(
                itemCount: podcastsList.length,
                itemBuilder: (context, index) {
                  final podcast = podcastsList[index];
                  return _PodcastCard(podcast: podcast);
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

/// ================= PODCAST CARD =================
class _PodcastCard extends StatelessWidget {
  final PodcastModel podcast;

  const _PodcastCard({required this.podcast});

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
              Icons.podcasts,
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
                  podcast.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D3B58),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  podcast.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                if (podcast.host.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    "By ${podcast.host}",
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
















