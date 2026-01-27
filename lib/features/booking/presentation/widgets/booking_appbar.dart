import 'package:flutter/material.dart';

class BookingAppBar extends StatelessWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF6EFEA),
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
      ),
      centerTitle: true,
      title: const Text(
        "Booking",
        style: TextStyle(
          color: Color(0xff1B4965),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
