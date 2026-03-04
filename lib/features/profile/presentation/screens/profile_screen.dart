/*
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),

      /// ===== App Bar with Back to Home =====
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F4EF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff1D3B58),
          ),
          onPressed: () {
            // 👈 يرجّعك للهوم
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff1D3B58),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// ===== Avatar =====
              const CircleAvatar(
                radius: 70,
                backgroundColor: Color(0xffD9D9D9),
              ),

              const SizedBox(height: 16),

              /// ===== Username =====
              const Text(
                'user name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 6),

              /// ===== Email =====
              const Text(
                'email',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 30),

              /// ===== Options =====
              _ProfileItem(
                icon: Icons.person_outline,
                title: 'My Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/myProfile');
                },
              ),

              _ProfileItem(
                icon: Icons.notifications_none,
                title: 'Notifications',
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),

              _ProfileItem(
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  Navigator.pushNamed(context, '/language');
                },
              ),

              _ProfileItem(
                icon: Icons.favorite_border,
                title: 'Favourite',
                onTap: () {
                  Navigator.pushNamed(context, '/favourite');
                },
              ),

              _ProfileItem(
                icon: Icons.phone,
                title: 'Emergency Contact',
                onTap: () {
                  Navigator.pushNamed(context, '/emergency');
                },
              ),

              const SizedBox(height: 10),

              /// ===== Logout =====
              _ProfileItem(
                icon: Icons.logout,
                title: 'Log out',
                isLogout: true,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= Profile Item =================
class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _ProfileItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff243F58),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                isLogout ? null : Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}




 */







import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? avatarImage;

  @override
  void initState() {
    super.initState();
    _loadAvatar();
  }

  Future<void> _loadAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    final path = prefs.getString('avatarPath');

    if (path != null && mounted) {
      setState(() {
        avatarImage = File(path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),

      /// ===== App Bar with Back to Home =====
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F4EF),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff1D3B58),
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff1D3B58),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// ===== Avatar =====
              CircleAvatar(
                radius: 70,
                backgroundColor: const Color(0xffD9D9D9),
                backgroundImage:
                avatarImage != null ? FileImage(avatarImage!) : null,
                child: avatarImage == null
                    ? const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                )
                    : null,
              ),

              const SizedBox(height: 16),

              /// ===== Username =====
              const Text(
                'tamenny',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 6),

              /// ===== Email =====
              const Text(
                'tamenny.2026@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 30),

              /// ===== Options =====
              _ProfileItem(
                icon: Icons.person_outline,
                title: 'My Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/myProfile');
                },
              ),

              _ProfileItem(
                icon: Icons.notifications_none,
                title: 'Notifications',
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),

              /*_ProfileItem(
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  Navigator.pushNamed(context, '/language');
                },
              ),*/

              _ProfileItem(
                icon: Icons.favorite_border,
                title: 'Favourite',
                onTap: () {
                  Navigator.pushNamed(context, '/favourite');
                },
              ),

              _ProfileItem(
                icon: Icons.phone,
                title: 'Emergency Contact',
                onTap: () {
                  Navigator.pushNamed(context, '/emergency');
                },
              ),

              const SizedBox(height: 10),

              /// ===== Logout =====
              _ProfileItem(
                icon: Icons.logout,
                title: 'Log out',
                isLogout: true,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= Profile Item =================
class _ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const _ProfileItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xff243F58),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                isLogout ? null : Icons.arrow_forward_ios,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}























