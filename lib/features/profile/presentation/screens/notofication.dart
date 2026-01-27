import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F4EF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1D3B58),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // علشان التايتل يفضل في النص
                ],
              ),

              const SizedBox(height: 24),

              /// ===== Reminders Title =====
              const Text(
                'Reminders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1D3B58),
                ),
              ),

              const SizedBox(height: 16),

              /// ===== Upcoming Appointment =====
              _notificationCard(
                icon: Icons.calendar_today,
                title: 'Upcoming Appointment',
                subtitle:
                'Your therapy session with Dr.X is\ntomorrow at 9:00 PM',
                date: 'Mar 30, 2026',
              ),

              const SizedBox(height: 16),

              /// ===== New Message =====
              _notificationCard(
                icon: Icons.chat_bubble_outline,
                title: 'New Message',
                subtitle:
                'You have a new message from\nyour therapist',
                date: 'Mar 30, 2026',
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ===== Notification Card =====
  Widget _notificationCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff506C86),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Icon Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xffE6DED5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xff1D3B58),
              size: 26,
            ),
          ),

          const SizedBox(width: 12),

          /// Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
