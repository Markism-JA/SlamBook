import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  final Color gridColor;
  final double spacing;

  GridPainter({required this.gridColor, this.spacing = 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0;

    for (double i = 0; i <= size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant GridPainter oldDelegate) =>
      oldDelegate.gridColor != gridColor || oldDelegate.spacing != spacing;
}

class SlamGridWrapper extends StatelessWidget {
  final Widget child;
  final Color? meshColor;
  final double spacing;

  const SlamGridWrapper({
    super.key,
    required this.child,
    this.meshColor,
    this.spacing = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: GridPainter(
              gridColor: meshColor ?? Colors.black.withOpacity(0.05),
              spacing: spacing,
            ),
          ),
        ),
        child,
      ],
    );
  }
}
