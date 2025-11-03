import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../res/constants.dart';

class DownloadButton extends StatefulWidget {
  const DownloadButton({super.key});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  Future<void> _launchCV() async {
    final url = Uri.parse(
      'https://drive.google.com/file/d/1HSIe7rdk8VtrAL4DQuybfMHQgDrQ6xNs/view?usp=sharing',
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = _isHovered;
    final isPressed = _isPressed;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          _launchCV();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOutCubic,
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: isPressed
                  ? [
                Colors.blueGrey.shade800,
                Colors.blueGrey.shade600,
              ]
                  : isHovered
                  ? [
                Colors.blueAccent.shade400.withOpacity(0.9),
                Colors.purpleAccent.shade200.withOpacity(0.9),
              ]
                  : [
                Colors.blueGrey.shade700,
                Colors.blueGrey.shade900,
              ],
            ),
            boxShadow: [
              if (isHovered)
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              if (isPressed)
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // ✨ Glass-like subtle highlight overlay
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: isHovered ? 0.2 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white24,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),

              // 💾 Button content
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    transform: Matrix4.translationValues(
                        isHovered ? 4 : 0, isHovered ? -2 : 0, 0),
                    child: const Icon(
                      FontAwesomeIcons.download,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: defaultPadding / 2),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.white,
                      fontWeight:
                      isHovered ? FontWeight.w700 : FontWeight.w600,
                      letterSpacing: isHovered ? 1.6 : 1.2,
                      fontSize: 15.5,
                    ),
                    child: const Text("Download CV"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
