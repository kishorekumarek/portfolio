import 'package:flutter/material.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  final List<String> skills = const [
    'Flutter',
    'iOS',
    'Dart',
    'Swift',
    'Objective-C',
    'Mobile App Architecture',
    'Data-driven Development',
    'Agile Methodologies',
    'TDD',
    'CI/CD',
    'Problem Solving',
    'Team Leadership',
  ]; // Added more skills for wrap demonstration

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final chipTheme = Theme.of(context).chipTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        TextStyle headingStyle = textTheme.headlineSmall!.copyWith(
          fontSize: isNarrowScreen ? 18 : 22,
        );
        // Chip label style will come from ChipThemeData in main.dart
        // TextStyle skillChipStyle = chipTheme.labelStyle!;
        // However, if you need to adjust size based on screen:
        TextStyle skillChipStyle = chipTheme.labelStyle!.copyWith(
            fontSize: isNarrowScreen ? 12 : chipTheme.labelStyle!.fontSize);


        EdgeInsets padding = EdgeInsets.all(isNarrowScreen ? 12.0 : 16.0);

        return Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SKILLS',
                style: headingStyle,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: skills.map((skill) {
                  return Chip(
                    label: Text(
                      skill,
                      style: skillChipStyle, // Apply adjusted style
                    ),
                    backgroundColor: chipTheme.backgroundColor, // From theme
                    side: chipTheme.side, // From theme
                    padding: chipTheme.padding, // From theme
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
