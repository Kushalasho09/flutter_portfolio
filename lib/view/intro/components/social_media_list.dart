import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_coloumn.dart';
import '../../../res/constants.dart';

class SocialMediaIconList extends StatefulWidget {
  const SocialMediaIconList({super.key});

  @override
  State<SocialMediaIconList> createState() => _SocialMediaIconListState();
}

class _SocialMediaIconListState extends State<SocialMediaIconList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeIn;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..forward();

    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return FadeTransition(
      opacity: _fadeIn,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-0.2, 0),
          end: Offset.zero,
        ).animate(_fadeIn),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // ✨ Rotated "Follow Me" text
              RotatedBox(
                quarterTurns: -1,
                child: Text(
                  'FOLLOW  ME',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                  ),
                ),
              ),

              const SizedBox(height: defaultPadding / 2),

              // 🌈 Glowing divider line
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    height: size.height * 0.06,
                    width: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultPadding),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.blueAccent.withOpacity(0.9),
                          Colors.purpleAccent.withOpacity(0.8),
                          Colors.pinkAccent.withOpacity(0.9),
                        ],
                        stops: [
                          (0.2 + _controller.value * 0.2) % 1,
                          (0.5 + _controller.value * 0.2) % 1,
                          (0.8 + _controller.value * 0.2) % 1,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: defaultPadding * 0.7),

              // 🌐 Social Media Column
              const SocialMediaIconColumn(),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
