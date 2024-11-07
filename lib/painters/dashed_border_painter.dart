import 'package:flutter/material.dart';

class DashedBorderPainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;

  DashedBorderPainter({this.dashWidth = 5.0, this.dashSpace = 3.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    double startX = 0.0;
    double startY = 0.0;

    // Draw top border
    for (double i = 0.0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(startX + i, startY),
        Offset(startX + i + dashWidth, startY),
        paint,
      );
    }

    startY = size.height;

    // Draw bottom border
    for (double i = 0.0; i < size.width; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(startX + i, startY),
        Offset(startX + i + dashWidth, startY),
        paint,
      );
    }

    startX = 0.0;
    startY = 0.0;

    // Draw left border
    for (double i = 0.0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(startX, startY + i),
        Offset(startX, startY + i + dashWidth),
        paint,
      );
    }

    startX = size.width;

    // Draw right border
    for (double i = 0.0; i < size.height; i += dashWidth + dashSpace) {
      canvas.drawLine(
        Offset(startX, startY + i),
        Offset(startX, startY + i + dashWidth),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
