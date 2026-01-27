import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// ===== AppBar Custom =====
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),

              const Spacer(),

              /// ===== Title =====
              const Text(
                'Choose Language',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'You want to continue with',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 48),

              /// ===== Arabic Button =====
              _languageButton(
                text: 'العربية',
                onTap: () {
                  // TODO: set language to Arabic
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 20),

              /// ===== English Button =====
              _languageButton(
                text: 'English',
                onTap: () {
                  // TODO: set language to English
                  Navigator.pop(context);
                },
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  /// ===== Language Button =====
  Widget _languageButton({
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff243F58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
