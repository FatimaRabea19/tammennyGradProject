import 'package:flutter/material.dart';

class MbtiLandingPage extends StatelessWidget {
  const MbtiLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3e9e3),

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
        Navigator.pop(context);
        },
        ),

        title: const Text('MBTI Test',
            style: TextStyle(
            fontSize: 16,
            color: Colors.white,
        )),

        backgroundColor: Color(0xff203647),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/mbti_image.png',
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),

            const Text(
              'Discover your personality type with this MBTI test! '
                  'It will help you understand yourself better and explore your mental well-being.',
              style: TextStyle(fontSize: 18, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const Spacer(),

            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button pressed!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Color(0xff203647),
                ),
                child: const Text(
                  'Perform the test',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
