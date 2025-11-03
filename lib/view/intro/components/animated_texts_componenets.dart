import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../../res/constants.dart';
import '../../../view model/responsive.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({
    Key? key,
    this.height = 300,
    this.width = 250,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<AnimatedImageContainer> createState() => _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _floatAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    _floatAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _responsiveImageSize(BuildContext context) {
    if (Responsive.isLargeMobile(context)) {
      return MediaQuery.sizeOf(context).width * 0.35;
    } else if (Responsive.isTablet(context)) {
      return MediaQuery.sizeOf(context).width * 0.25;
    } else {
      return 230;
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageSize = _responsiveImageSize(context);

    return AnimatedBuilder(
      animation: _floatAnim,
      builder: (context, child) {
        final floatOffset = 8 * math.sin(_controller.value * 2 * math.pi);
        final hueShift = (_controller.value * 360) % 360;

        return Transform.translate(
          offset: Offset(0, floatOffset),
          child: Container(
            height: widget.height!,
            width: widget.width!,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: SweepGradient(
                colors: [
                  HSLColor.fromAHSL(1, hueShift, 1, 0.6).toColor(),
                  HSLColor.fromAHSL(1, (hueShift + 60) % 360, 1, 0.6).toColor(),
                  HSLColor.fromAHSL(1, (hueShift + 120) % 360, 1, 0.6).toColor(),
                ],
                startAngle: 0,
                endAngle: 6.3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.4),
                  blurRadius: 25,
                  spreadRadius: 2,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(defaultPadding / 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  'assets/images/image.png',
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
