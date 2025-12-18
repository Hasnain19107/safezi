import 'package:flutter/material.dart';

class FlagButtonWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isSelected;

  const FlagButtonWidget({
    super.key,
    required this.onTap,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: 3,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.white.withValues(alpha: 0.3),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: ClipOval(
          child: child,
        ),
      ),
    );
  }
}

