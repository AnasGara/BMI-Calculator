import 'package:flutter/material.dart';
import 'dart:math';

class BMIGauge extends StatelessWidget {
  final double bmi;

  const BMIGauge({super.key, required this.bmi});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: CustomPaint(
        painter: _GaugePainter(bmi),
      ),
    );
  }
}

class _GaugePainter extends CustomPainter {
  final double bmi;
  _GaugePainter(this.bmi);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 30;

    // Underweight (Blue)
    paint.color = Colors.blue;
    canvas.drawArc(rect, pi, pi * 0.25, false, paint);

    // Normal (Green)
    paint.color = Colors.green;
    canvas.drawArc(rect, pi * 1.25, pi * 0.25, false, paint);

    // Overweight (Orange)
    paint.color = Colors.orange;
    canvas.drawArc(rect, pi * 1.5, pi * 0.25, false, paint);

    // Obese (Red)
    paint.color = Colors.red;
    canvas.drawArc(rect, pi * 1.75, pi * 0.25, false, paint);

    // Needle
    final needlePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    double normalizedBMI = (bmi - 10) / (40 - 10);
    normalizedBMI = normalizedBMI.clamp(0.0, 1.0);
    double angle = pi + (normalizedBMI * pi);

    final needleEnd = Offset(
      center.dx + (radius - 40) * cos(angle),
      center.dy + (radius - 40) * sin(angle),
    );

    canvas.drawLine(center, needleEnd, needlePaint);
    canvas.drawCircle(center, 10, needlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
