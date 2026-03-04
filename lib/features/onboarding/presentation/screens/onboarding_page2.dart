/*import 'package:flutter/material.dart';

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


 */





import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          /// Title
          const Text(
            "About Tammenny",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1F3B53),
            ),
          ),

          const SizedBox(height: 40),

          /// Features
          const _FeatureItem(
            icon: Icons.smart_toy_outlined,
            title: "AI Chat Support",
            subtitle: "Get assistance through AI",
          ),

          SizedBox(height: 28),

          const _FeatureItem(
            icon: Icons.calendar_month_outlined,
            title: "Specialist Booking",
            subtitle: "Schedule appointment with qualified specialists",
          ),

          SizedBox(height: 28),

          const _FeatureItem(
            icon: Icons.track_changes_outlined,
            title: "Mood Tracking",
            subtitle: "Monitor your mood and emotional well being",
          ),

          SizedBox(height: 28),

          const _FeatureItem(
            icon: Icons.auto_stories_outlined,
            title: "Personalized Recommendations",
            subtitle: "Podcasts & Books based on your need",
          ),

          const Spacer(),
        ],
      ),
    );
  }
}

/// ================= Feature Item =================
class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            size: 26,
            color: Color(0xFF1F3B53),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
