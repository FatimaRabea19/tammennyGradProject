
import 'package:flutter/material.dart';

enum MeditationStep {
  yoga,
  quietPlace,
}

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  MeditationStep step = MeditationStep.yoga;

  // ================= COLORS =================

  Color get backgroundColor {
    switch (step) {
      case MeditationStep.quietPlace:
        return const Color(0xff1F3E57);
      case MeditationStep.yoga:
      default:
        return const Color(0xffF7F3EE);
    }
  }

  Color get textColor {
    switch (step) {
      case MeditationStep.quietPlace:
        return Colors.white;
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonColor {
    switch (step) {
      case MeditationStep.quietPlace:
        return const Color(0xffF7F3EE);
      default:
        return const Color(0xff1B3C53);
    }
  }

  Color get buttonTextColor {
    switch (step) {
      case MeditationStep.quietPlace:
        return const Color(0xff1B3C53);
      default:
        return Colors.white;
    }
  }

  // ================= CONTENT =================

  String get title {
    switch (step) {
      case MeditationStep.quietPlace:
        return "Quit Place";
      default:
        return "Yoga";
    }
  }

  String get description {
    switch (step) {
      case MeditationStep.quietPlace:
        return "choosing a quiet place, free from distractions and noise. "
            "Sit in a slightly higher spot where you can see your surroundings clearly.\n\n"
            "This helps you feel calm, safe and connected bringing a deep sense of peace "
            "and relaxation.";
      default:
        return "On the mental side, yoga reduces stress, improves focus "
            "and brings a sense of balance and inner peace.";
    }
  }

  String get imagePath {
    switch (step) {
      case MeditationStep.quietPlace:
        return "assets/images/quiet-place.png";
      default:
        return "assets/images/yoga.png";
    }
  }

  // ================= NAV =================

  void onContinue() {
    setState(() {
      if (step == MeditationStep.yoga) {
        step = MeditationStep.quietPlace;
      } else {
        Navigator.pop(context);
      }
    });
  }

  void onBack() {
    setState(() {
      if (step == MeditationStep.quietPlace) {
        step = MeditationStep.yoga;
      } else {
        Navigator.pop(context);
      }
    });
  }

  // ================= UI =================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: onBack,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 16),

            /// IMAGE
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            /// DESCRIPTION
            Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  height: 1.5,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            /// BUTTON
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Center(
                child: SizedBox(
                  width: 280,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: buttonColor,
                      foregroundColor: buttonTextColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: onContinue,
                    child: Text(
                      step == MeditationStep.quietPlace
                          ? "Back to Exercises"
                          : "Continue",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




























