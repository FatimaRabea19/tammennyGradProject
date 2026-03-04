/*import 'package:flutter/material.dart';

/// =====================
/// Mood Enum
/// =====================
enum Mood {
  neutral,
  happy,
  sad,
}

/// =====================
/// Set Mood Screen
/// =====================
class SetMoodScreen extends StatefulWidget {
  const SetMoodScreen({super.key});

  @override
  State<SetMoodScreen> createState() => _SetMoodScreenState();
}

class _SetMoodScreenState extends State<SetMoodScreen> {
  Mood selectedMood = Mood.neutral;

  /// Background color حسب المود
  Color get backgroundColor {
    switch (selectedMood) {
      case Mood.happy:
        return const Color(0xffE3D9CF);
      case Mood.sad:
        return const Color(0xff1F3E57);
      case Mood.neutral:
      default:
        return const Color(0xff7B7371);
    }
  }

  /// النص
  String get moodText {
    switch (selectedMood) {
      case Mood.happy:
        return "I’m Feeling Happy";
      case Mood.sad:
        return "I’m Feeling Sad";
      case Mood.neutral:
      default:
        return "I’m Feeling Neutral";
    }
  }

  /// الأيقونة (بدل الرسمة حالياً)
  IconData get moodIcon {
    switch (selectedMood) {
      case Mood.happy:
        return Icons.sentiment_satisfied_alt;
      case Mood.sad:
        return Icons.sentiment_dissatisfied;
      case Mood.neutral:
      default:
        return Icons.sentiment_neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),

      body: Column(
        children: [
          const SizedBox(height: 40),

          const Text(
            "How are you feeling today?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 40),

          /// Face
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: Icon(
              moodIcon,
              size: 80,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            moodText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 40),

          /// Mood Selector Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _moodDot(Mood.neutral),
              _moodDot(Mood.happy),
              _moodDot(Mood.sad),
            ],
          ),

          const Spacer(),

          /// Set Mood Button
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: 220,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // يرجّع المود المختار
                  Navigator.pop(context, selectedMood);
                },
                child: const Text(
                  "Set Mood",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// =====================
  /// Mood Dot Widget
  /// =====================
  Widget _moodDot(Mood mood) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = mood;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14),
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: selectedMood == mood
              ? Colors.white
              : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }
}
*/
























import 'package:flutter/material.dart';

enum Mood {
  neutral,
  happy,
  sad,
}

class SetMoodScreen extends StatefulWidget {
  const SetMoodScreen({super.key});

  @override
  State<SetMoodScreen> createState() => _SetMoodScreenState();
}

class _SetMoodScreenState extends State<SetMoodScreen> {
  Mood selectedMood = Mood.neutral;

  Color get backgroundColor {
    switch (selectedMood) {
      case Mood.happy:
        return const Color(0xffE3D9CF);
      case Mood.sad:
        return const Color(0xff1F3E57);
      case Mood.neutral:
      default:
        return const Color(0xff7B7371);
    }
  }

  String get moodText {
    switch (selectedMood) {
      case Mood.happy:
        return "I’m Feeling Happy";
      case Mood.sad:
        return "I’m Feeling Sad";
      default:
        return "I’m Feeling Neutral";
    }
  }

  IconData get moodIcon {
    switch (selectedMood) {
      case Mood.happy:
        return Icons.sentiment_satisfied_alt;
      case Mood.sad:
        return Icons.sentiment_dissatisfied;
      default:
        return Icons.sentiment_neutral;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),

      body: Column(
        children: [
          const SizedBox(height: 32),

          const Text(
            "How are you feeling today?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 90),


          Icon(
            moodIcon,
            size: 180, // حجم الايموجي
            color: Colors.white,
          ),

          const SizedBox(height: 24),

          Text(
            moodText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
//المسافه بين الايموجي والدوتس
          const SizedBox(height: 88),


          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _moodDot(Mood.neutral),
              _moodDot(Mood.happy),
              _moodDot(Mood.sad),
            ],
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: SizedBox(
              width: 220,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, selectedMood);
                },
                child: const Text(
                  "Set Mood",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///  Bigger Mood Dot
  Widget _moodDot(Mood mood) {
    final bool isSelected = selectedMood == mood;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMood = mood;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: isSelected ? 22 : 18,
        height: isSelected ? 22 : 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected
              ? Colors.white
              : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }
}







