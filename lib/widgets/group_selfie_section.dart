import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupSelfieSection extends StatelessWidget {
  final String imagePath;
  final double rotation;
  final String label;

  const GroupSelfieSection({
    super.key,
    required this.imagePath,
    this.rotation = -0.03,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          label,
          style: GoogleFonts.permanentMarker(
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Transform.rotate(
          angle: rotation,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              border: Border.all(color: Colors.black, width: 2.5),
              boxShadow: const [
                BoxShadow(color: Colors.black, offset: Offset(4, 4)),
              ],
            ),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
