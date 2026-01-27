import 'package:flutter/material.dart';

class BookingToggle extends StatelessWidget {
  final bool isOnline;
  final Function(bool) onChanged;

  const BookingToggle({
    super.key,
    required this.isOnline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(
          text: "Online",
          selected: isOnline,
          onTap: () => onChanged(true),
        ),
        const SizedBox(width: 12),
        _buildButton(
          text: "Offline",
          selected: !isOnline,
          onTap: () => onChanged(false),
        ),
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required bool selected,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? const Color(0xff1B4965) : const Color(0xff7A9EAF),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
