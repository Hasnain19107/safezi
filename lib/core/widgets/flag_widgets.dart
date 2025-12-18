import 'package:flutter/material.dart';
import 'uk_flag_painter.dart';

/// UK Flag Widget
class UKFlagWidget extends StatelessWidget {
  const UKFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue.shade900,
            Colors.blue.shade700,
          ],
        ),
      ),
      child: Stack(
        children: [
          // White diagonal cross (St. Andrew's cross)
          CustomPaint(
            size: const Size(50, 50),
            painter: UKFlagPainter(),
          ),
        ],
      ),
    );
  }
}

/// French Flag Widget
class FrenchFlagWidget extends StatelessWidget {
  const FrenchFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(color: Colors.blue.shade700)),
        Expanded(child: Container(color: Colors.white)),
        Expanded(child: Container(color: Colors.red.shade700)),
      ],
    );
  }
}

/// Mauritius Flag Widget
class MauritiusFlagWidget extends StatelessWidget {
  const MauritiusFlagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(color: Colors.red.shade700)),
        Expanded(child: Container(color: Colors.blue.shade700)),
        Expanded(child: Container(color: Colors.yellow.shade600)),
        Expanded(child: Container(color: Colors.green.shade700)),
      ],
    );
  }
}

