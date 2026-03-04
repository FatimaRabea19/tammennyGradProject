
import 'package:flutter/material.dart';
import 'package:tamenny/features/mood_tracker/presentation/screens/setـmoodـscreen.dart';
import 'package:tamenny/features/recommendations/presentation/screens/exercise_screens/exercise.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F3EE),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF7F3EE),


        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1B3C53)),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
                  (route) => false,
            );
          },
        ),

        centerTitle: true,
        title: const Text(
          "Tammeny",
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
          children: const [
            SizedBox(height: 50),

            TrackerItem(
              title: "Set Mood",
              imagePath: "assets/images/mood-tracker-home.png",
            ),

            SizedBox(height: 64),

            TrackerItem(
              title: "View Report",
              imagePath: "assets/images/report.png",
            ),

            SizedBox(height: 64),

            TrackerItem(
              title: "Exercises",
              imagePath: "assets/images/exercise.png",
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
}

/// =====================
/// Tracker Card Widget
/// =====================
class TrackerItem extends StatelessWidget {
  final String title;
  final String imagePath;

  const TrackerItem({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () async {
        /// SET MOOD
        if (title == "Set Mood") {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SetMoodScreen(),
            ),
          );

          if (result != null) {
            debugPrint("Selected Mood: $result");
          }
        }

        /// EXERCISES
        else if (title == "Exercises") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const ExercisesScreen(),
            ),
          );
        }

        /// VIEW REPORT
        else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PlaceholderScreen(title: title),
            ),
          );
        }
      },

      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffDED6CD),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),

            SizedBox(
              width: 160,
              height: 130,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 20),

            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff1B3C53),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// =====================
/// Placeholder Page
/// =====================
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          "Page under construction",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}




















