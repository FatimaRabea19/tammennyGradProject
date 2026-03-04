import 'package:flutter/material.dart';

class JournalingScreen extends StatelessWidget {
  const JournalingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xffF9F3EF);
    const Color primaryColor = Color(0xff1B3C53);

    return Scaffold(
      backgroundColor: backgroundColor,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Journaling",
          style: TextStyle(
            color: primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 24),

            /// IMAGE PLACE
            Expanded(
              flex: 5,
              child: Center(
                child: Image.asset(
                  "assets/images/journaling.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 24),

            /// DESCRIPTION
            Text(
              "Journaling improves self-awareness and emotional balance, "
                  "helps track personal growth and habits.\n\n"
                  "Encourages gratitude and positivity, just need a notebook "
                  "or app and a few minutes each day to write freely.",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
                color: primaryColor,
                fontWeight: FontWeight.w400,
              ),
            ),

            const SizedBox(height: 40),

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
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Back to Exercises",
                      style: TextStyle(
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













