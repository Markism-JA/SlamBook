import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'arc_text_painter.dart';
import 'grid_painter.dart';

class PortraitSection extends StatelessWidget {
  final String fullName;
  final String nickname;
  final String imagePath;
  final DateTime birthday;
  final int age;

  const PortraitSection({
    super.key,
    required this.fullName,
    required this.nickname,
    required this.imagePath,
    required this.birthday,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderSide = theme.cardTheme.shape is RoundedRectangleBorder
        ? (theme.cardTheme.shape as RoundedRectangleBorder).side
        : const BorderSide(color: Colors.black, width: 2.5);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        border: Border.fromBorderSide(borderSide),
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset(4, 4))],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: theme.colorScheme.tertiary,
                child: const SlamGridWrapper(
                  spacing: 12,
                  child: SizedBox.expand(),
                ),
              ),
              Container(
                width: double.infinity,
                color: theme.colorScheme.surface,
                padding: const EdgeInsets.only(
                  top: 60,
                  bottom: 20,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: [
                    Text(
                      "My name is:",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                    Text(
                      fullName,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      DateFormat('MM/dd/yyyy').format(birthday),
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      color: Colors.black,
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "You can call me $nickname",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "I am $age years old",
                      style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            top: 40,
            child: Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 2.5),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: 90,
            child: CustomPaint(
              painter: ArcTextPainter(
                text: "A portrait of me",
                radius: 80,
                textStyle: theme.textTheme.titleMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
