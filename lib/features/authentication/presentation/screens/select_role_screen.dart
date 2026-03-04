import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'authentication_screen.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F3EF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Title
              const Text(
                'Select Role',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2F4F64),
                ),
              ),

              const SizedBox(height: 40),

              // Specialist
              roleCard(
                context: context,
                title: 'Specialist',
                imagePath: 'assets/images/Doctors_Icon.png',
                navigateTo: const AuthLandingPage(),
              ),

              const SizedBox(height: 25),

              // Parent
              roleCard(
                context: context,
                title: 'Parent',
                imagePath: 'assets/images/Parents_Icon.png',
                navigateTo: const AuthLandingPage(),
              ),

              const SizedBox(height: 25),

              // User
              roleCard(
                context: context,
                title: 'User',
                imagePath: 'assets/images/User_Icon.png',
                navigateTo: const CreateAccountScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -------- Card ----------
  Widget roleCard({
    required BuildContext context,
    required String title,
    required String imagePath,
    required Widget navigateTo,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => navigateTo),
        );
      },
      child: Container(
        width: 260,
        height: 170,
        decoration: BoxDecoration(
          color: const Color(0xFF4E6E85),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Container(
              width: 95,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 15),

            // Text
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}