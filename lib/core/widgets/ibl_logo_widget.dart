import 'package:flutter/material.dart';
import 'curved_line_painter.dart';

class IblLogoWidget extends StatelessWidget {
  const IblLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // i with blue square dot
          Stack(
            children: [
              const Text(
                'i',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Positioned(
                top: 0,
                left: 8,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B9EFF),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
          // BL with connected B and L
          Stack(
            children: [
              const Text(
                'BL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -2,
                ),
              ),
              // Curved line connecting B to L
              Positioned(
                left: 8,
                top: 20,
                child: CustomPaint(
                  size: const Size(20, 20),
                  painter: CurvedLinePainter(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

