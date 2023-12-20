import 'dart:math';

import 'package:flutter/material.dart';

class CircularGaugePainter extends CustomPainter {
  final double currentValue;

  CircularGaugePainter({required this.currentValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = size.width / 2;

    // Background circle
    final Paint backgroundPaint = Paint()
      ..color = const Color.fromARGB(255, 247, 91, 18).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    // Foreground circle
    final Paint foregroundPaint = Paint()
      ..color = const Color.fromARGB(255, 240, 185, 35).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 10.0;

    canvas.drawCircle(center, radius, backgroundPaint);
    double arcAngle = 2 * pi * (currentValue / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      arcAngle,
      false,
      foregroundPaint,
    );

    // Drawing the text in the center
    // ignore: prefer_const_constructors
    final textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    );
    final textSpan = TextSpan(
      text: '${currentValue.toStringAsFixed(0)}%',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
