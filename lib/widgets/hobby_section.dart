import 'package:flutter/material.dart';

class HobbySection extends StatelessWidget {
  final String hobby;

  const HobbySection({super.key, required this.hobby});

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
          Padding(
            padding: const .symmetric(vertical: 4),
            child: Text(
              "hobby????",
              style: theme.textTheme.displayLarge?.copyWith(fontSize: 16),
            ),
          ),
          const Divider(color: Colors.black, thickness: 2, height: 0),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              hobby,
              style: theme.textTheme.titleMedium?.copyWith(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
