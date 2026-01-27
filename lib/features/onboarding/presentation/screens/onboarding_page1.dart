import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F1EC), 
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(height: 40),

          // Title
          Text(
            "Welcome to Tammeny",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F3B53),
            ),
          ),

          SizedBox(height: 12),

          // Subtitle
          Text(
            "Your journey to inner peace begins here",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF1F3B53),
            ),
          ),

          SizedBox(height: 40),

          // Image
          Expanded(
            child: Image(
              image: AssetImage("assets/images/Onboarding_page1.png"),
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
