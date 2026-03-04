
import 'package:flutter/material.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/mindful_breathing.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/meditation.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/journaling.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F3EE),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF7F3EE),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1B3C53)),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Recommendations",
          style: TextStyle(
            color: Color(0xff1B3C53),
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// =====================
            /// Scrollable Tabs
            /// =====================
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: [
                  _tabItem("Books", false),
                  const SizedBox(width: 10),
                  _tabItem("Podcasts", false),
                  const SizedBox(width: 10),
                  _tabItem("MPTI Test", false),
                  const SizedBox(width: 10),
                  _tabItem("Exercises", true),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// =====================
            /// Exercises List
            /// =====================
            Expanded(
              child: ListView(
                children: [
                  ExerciseCard(
                    title: "Mindful Breathing",
                    imagePath: "assets/images/mindful_brathing.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                          const MindfulBreathingScreen(),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 64),

                  ExerciseCard(
                    title: "Meditation",
                    imagePath: "assets/images/meditation.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const  MeditationScreen(),
                          ),
                      );
                    },
                  ),

                  const SizedBox(height: 64),

                  ExerciseCard(
                    title: "Journaling",
                    imagePath:
                    "assets/images/journaling-exercise.png",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const JournalingScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff1B3C53),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions),
            label: "Tracker",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  /// =====================
  /// Tab Item
  /// =====================
  Widget _tabItem(String text, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xff1B3C53)
            : const Color(0xff5B748A),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

/// =====================
/// Exercise Card Widget
/// =====================
class ExerciseCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: const Color(0xffDED6CD),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),

            SizedBox(
              width: 140,
              height: 140,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 20),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1B3C53),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =====================
/// Placeholder Screen
/// =====================
class PlaceholderExerciseScreen extends StatelessWidget {
  final String title;

  const PlaceholderExerciseScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          "Coming Soon",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}





















