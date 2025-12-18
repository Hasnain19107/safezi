import 'package:flutter/material.dart';

class PlayButtonIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PlayButtonIcon({
    super.key,
    this.size = 48,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PlayButtonPainter(color: color),
    );
  }
}

class _PlayButtonPainter extends CustomPainter {
  final Color color;

  _PlayButtonPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Draw circle outline
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius - 1, circlePaint);

    // Draw triangle (play button) - white triangle inside circle
    final triangleSize = size.width * 0.4;
    final triangleLeft = center.dx - triangleSize * 0.25;
    final triangleTop = center.dy - triangleSize * 0.5;
    
    final path = Path();
    path.moveTo(triangleLeft, triangleTop);
    path.lineTo(triangleLeft, triangleTop + triangleSize);
    path.lineTo(triangleLeft + triangleSize * 0.85, triangleTop + triangleSize * 0.5);
    path.close();

    final trianglePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, trianglePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

