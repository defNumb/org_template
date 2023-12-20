import 'package:flutter/material.dart';

import 'custom_painter.dart';

class AnimatedCircularGauge extends StatefulWidget {
  final double value;

  const AnimatedCircularGauge({super.key, required this.value});

  @override
  State<AnimatedCircularGauge> createState() => _AnimatedCircularGaugeState();
}

class _AnimatedCircularGaugeState extends State<AnimatedCircularGauge> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: widget.value),
      duration: const Duration(seconds: 2),
      builder: (BuildContext context, double value, Widget? child) {
        return CustomPaint(
          painter: CircularGaugePainter(currentValue: value),
          size: const Size(150, 150), // Adjust size as needed
        );
      },
    );
  }
}
