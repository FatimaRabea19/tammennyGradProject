import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset("assets/onboarding2.png", fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          const Text(
            "About Tammenny",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F3B53),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "LLM for Support, Specialist Booking, Mood Tracking, Personalized Recommendations",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Color(0xFF1F3B53)),
          ),
        ],
      ),
    );
  }
}
