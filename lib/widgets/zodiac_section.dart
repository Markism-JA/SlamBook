import 'package:flutter/material.dart';
import '../models/zodiac.dart';
import 'grid_painter.dart';

class ZodiacSection extends StatelessWidget {
  final Zodiac zodiac;

  const ZodiacSection({super.key, required this.zodiac});

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFFFB7B7),
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.5),
              ),
            ),
            child: SlamGridWrapper(
              spacing: 10,
              meshColor: Colors.black.withOpacity(0.05),
              child: Center(
                child: Text(
                  "ZODIAC SIGN",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayLarge?.copyWith(fontSize: 18),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  zodiac.displayName,
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 12),
                // The Image Frame
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.5),
                  ),
                  child: Image.asset(zodiac.assetPath, fit: BoxFit.contain),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
