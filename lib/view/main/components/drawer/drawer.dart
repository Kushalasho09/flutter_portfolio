import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/main/components/drawer/contact_icons.dart';
import 'package:flutter_portfolio/view/main/components/drawer/personal_info.dart';
import '../../../../res/constants.dart';
import 'knowledges.dart';
import 'about.dart';
import 'my_skill.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          // ✨ Soft gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0F0F10),
                  Color(0xFF1A1B1E),
                  Color(0xFF0E0E0F),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🪞 Glass blur overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Container(color: Colors.black.withOpacity(0.35)),
          ),

          // 🌟 Drawer Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 0.8,
              vertical: defaultPadding * 1.2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const About(),
                const SizedBox(height: defaultPadding),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.08),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(defaultPadding),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PersonalInfo(),
                      SizedBox(height: defaultPadding * 0.8),
                      Divider(thickness: 0.6, color: Colors.white24),
                      SizedBox(height: defaultPadding * 0.8),
                      MySKills(),
                      SizedBox(height: defaultPadding * 0.8),
                      Knowledges(),
                      Divider(thickness: 0.6, color: Colors.white24),
                      SizedBox(height: defaultPadding),
                      ContactIcon(),
                    ],
                  ),
                ),

                const SizedBox(height: defaultPadding * 2),

                // 🧭 Footer Signature
                Center(
                  child: Text(
                    "© 2025 | Made with ❤️ by Kushal Asodia",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                      letterSpacing: 0.5,
                    ),
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
