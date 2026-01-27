import 'package:flutter/material.dart';
import 'package:tamenny/features/booking/presentation/widgets/booking_appbar.dart';
import 'package:tamenny/features/booking/presentation/widgets/doctor_card.dart';
import 'package:tamenny/features/booking/presentation/widgets/booking_toggle.dart';



class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6EFEA),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: BookingAppBar(),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            BookingToggle(
              isOnline: isOnline,
              onChanged: (value) {
                setState(() => isOnline = value);
              },
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => const DoctorCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
