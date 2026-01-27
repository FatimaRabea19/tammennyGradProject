import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              /// ===== Avatar =====
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// ===== App Name =====
              const Center(
                child: Text(
                  'Tammeny',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D3B58),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              /// ===== Greeting =====
              const Text(
                'Good morning, user name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'We wish you have a good day.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 24),

              /// ===== MAIN CARDS =====
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Chat with AI (LEFT – Tall, special image)
                  Expanded(
                    child: _CategoryCard(
                      title: 'Chat with AI',
                      image: 'assets/images/Chat-with-AI-home.png',
                      height: 420,
                      isChat: true, // 👈 مهم
                      onTap: () {
                        Navigator.pushNamed(context, '/chat');
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// Right side (Book + Mood)
                  Expanded(
                    child: Column(
                      children: [
                        _CategoryCard(
                          title: 'Book with a specialist',
                          image:
                          'assets/images/book-with-specialist-home.png',
                          height: 200,
                          onTap: () {
                            Navigator.pushNamed(context, '/booking');
                          },
                        ),
                        const SizedBox(height: 12),
                        _CategoryCard(
                          title: 'Mood Tracker',
                          image: 'assets/images/mood-tracker-home.png',
                          height: 200,
                          onTap: () {
                            Navigator.pushNamed(context, '/mood');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              /// ===== Recommended =====
              const Text(
                'Recommended for you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 12),

              /// ===== Horizontal Scroll =====
              SizedBox(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _RecommendedItem(
                      title: 'Books',
                      image: 'assets/images/books-home.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/books');
                      },
                    ),
                    _RecommendedItem(
                      title: 'Podcasts',
                      image: 'assets/images/podcast-home.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/podcasts');
                      },
                    ),
                    _RecommendedItem(
                      title: 'Exercises',
                      image: 'assets/images/ exercises-home.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/exercises');
                      },
                    ),
                    _RecommendedItem(
                      title: 'MBTI TEST',
                      image: 'assets/images/mpti-test-home.png',
                      onTap: () {
                        Navigator.pushNamed(context, '/mbti');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= CATEGORY CARD =================
class _CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final double height;
  final VoidCallback onTap;
  final bool isChat;

  const _CategoryCard({
    required this.title,
    required this.image,
    required this.height,
    required this.onTap,
    this.isChat = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff506C86),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            //const Spacer(),

            ///  صورة الشات متحكم فيها لوحدها
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: isChat ? 90 : 10, //  نزول الصورة الكبيرة اللي في الشات : اللي في باقي الكاردز
                ),
                child: Image.asset(
                  image,
                  height: isChat
                      ? height * 0.65 //  حجم اكبر للصورة اللي في الشات
                      : height * 0.55, //   حجم باقي االكاردز
                  fit: BoxFit.contain,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}

/// ================= RECOMMENDED ITEM =================
class _RecommendedItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _RecommendedItem({
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 110,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
