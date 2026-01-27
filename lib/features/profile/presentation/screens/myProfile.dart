import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F4EF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1D3B58)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            color: Color(0xff1D3B58),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// ===== Avatar =====
            const CircleAvatar(
              radius: 70,
              backgroundColor: Color(0xffD9D9D9),
            ),

            const SizedBox(height: 40),

            /// ===== User Name =====
            _ProfileOption(
              title: 'User Name',
              onTap: () {
                Navigator.pushNamed(context, '/editName');
              },
            ),

            const SizedBox(height: 16),

            /// ===== Email =====
            _ProfileOption(
              title: 'E-mail Address',
              onTap: () {
                Navigator.pushNamed(context, '/editEmail');
              },
            ),

            const SizedBox(height: 16),

            /// ===== Password =====
            _ProfileOption(
              title: 'Password',
              onTap: () {
                Navigator.pushNamed(context, '/editPassword');
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// ================= Profile Option =================
class _ProfileOption extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ProfileOption({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffDED6CC),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff1D3B58),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Color(0xff1D3B58),
            ),
          ],
        ),
      ),
    );
  }
}




