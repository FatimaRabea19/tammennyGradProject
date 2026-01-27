import 'package:flutter/material.dart';

// --- Theme Colors (Based on previous screens for consistency) ---
const Color kPrimaryDarkColor = Color(0xFF456882); // The dark button/title color
const Color kBackgroundColor = Color(0xFFF9F3EF); // The light cream background
const Color kLightAccentColor = Color(0xFFE0D8D0); // The outer circle color
const Color kMediumAccentColor = Color(0xFF758CA0); // The inner circle color

// --- Main Screen ---
class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryDarkColor),
          onPressed: () {
            // TODO: Add navigation logic to go back
          },
        ),
        title: const Text(
          'Create New Password',
          style: TextStyle(
            color: kPrimaryDarkColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 50),

            // Circular Icon Placeholder Area
            const _CircleIconBackground(),

            const SizedBox(height: 50),

            // Instruction Message
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Your New Password Must Be Different From Previously Used Password',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Password Field
            const TextField(
              obscureText: true, // لإخفاء النص
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: kPrimaryDarkColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kLightAccentColor, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryDarkColor, width: 2.0),
                ),
              ),
              cursorColor: kPrimaryDarkColor,
            ),

            const SizedBox(height: 20),

            // Confirm Password Field
            const TextField(
              obscureText: true, // لإخفاء النص
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                labelStyle: TextStyle(color: kPrimaryDarkColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kLightAccentColor, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryDarkColor, width: 2.0),
                ),
              ),
              cursorColor: kPrimaryDarkColor,
            ),

            const SizedBox(height: 60),

            // Save Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add password saving logic
                  print('Saving new password...');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// --- Custom Widget for the Circular Icon Background ---
class _CircleIconBackground extends StatelessWidget {
  const _CircleIconBackground();

  @override
  Widget build(BuildContext context) {
    // Outer Circle Size
    const double outerSize = 160.0;
    // Inner Circle Size
    const double innerSize = 120.0;

    return Center(
      child: Container(
        width: outerSize,
        height: outerSize,
        decoration: const BoxDecoration(
          color: kLightAccentColor, // Light Accent Color
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: innerSize,
            height: innerSize,
            decoration: const BoxDecoration(
              color: kMediumAccentColor, // Inner Darker Accent Color
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}