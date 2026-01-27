import 'package:flutter/material.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Ready to Begin?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F3B53),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Image.asset(
              'assets/images/onboarding_page3.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
