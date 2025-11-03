import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.tealAccent, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.4)),
                const SizedBox(height: 2),
                Text(value,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Personal Info",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: defaultPadding / 1.5),

          _infoRow(Icons.phone_rounded, "Contact", "+91 9978217711"),
          _infoRow(Icons.email_rounded, "Email", "kushalasho39@gmail.com"),
          // _infoRow(Icons.linked_camera_rounded, "LinkedIn", "@hamad-anwar"),
          // _infoRow(Icons.code_rounded, "GitHub", "@hamad-anwar"),

          const SizedBox(height: defaultPadding * 1.2),
          const Divider(color: Colors.white12, thickness: 0.6),
          const SizedBox(height: defaultPadding / 1.5),

          const Text(
            "Skills",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 0.6,
            ),
          ),
          // const SizedBox(height: defaultPadding / 1.5),
        ],
      ),
    );
  }
}
