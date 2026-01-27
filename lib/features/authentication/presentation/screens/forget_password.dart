import 'package:flutter/material.dart';
import 'verify.dart';
import 'login_screen.dart';

const Color kPrimaryDarkColor = Color(0xFF456882);
const Color kBackgroundColor = Color(0xFFF9F3EF);
const Color kLightAccentColor = Color(0xFFE0D8D0);
const Color kMediumAccentColor = Color(0xFFC0B3A6);

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryDarkColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Forget Password',
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
            const _LockIconBackground(),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Please Enter Your Email Address To Receive a Verification Code.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryDarkColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: kPrimaryDarkColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kMediumAccentColor, width: 1.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryDarkColor, width: 2.0),
                ),
              ),
              cursorColor: kPrimaryDarkColor,
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const VerifyEmailScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryDarkColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Send',
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

class _LockIconBackground extends StatelessWidget {
  const _LockIconBackground();

  @override
  Widget build(BuildContext context) {
    const double outerSize = 160.0;
    const double mediumSize = 130.0;
    const double innerSize = 100.0;

    return Center(
      child: Container(
        width: outerSize,
        height: outerSize,
        decoration: BoxDecoration(
          color: kLightAccentColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            width: mediumSize,
            height: mediumSize,
            decoration: BoxDecoration(
              color: kMediumAccentColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Container(
                width: innerSize,
                height: innerSize,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.lock_open_rounded,
                  size: 60,
                  color: kPrimaryDarkColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
