import 'package:flutter/material.dart';

import 'grid_painter.dart';

class FavColorSection extends StatelessWidget {
  final Color favColor;
  final String colorName;

  const FavColorSection({
    super.key,
    required this.favColor,
    required this.colorName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: Colors.black, width: 2.5),
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 4))],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black, width: 2)),
            ),
            child: Text(
              "MY FAV COLOR",
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: favColor, // The actual favorite color
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: const SlamGridWrapper(
                    spacing: 8,
                    child: SizedBox.expand(),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  colorName.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 22,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
