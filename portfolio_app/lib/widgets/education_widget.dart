import 'package:flutter/material.dart';

class EducationWidget extends StatelessWidget {
  const EducationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        TextStyle headingStyle = textTheme.headlineSmall!.copyWith(
          fontSize: isNarrowScreen ? 18 : 22,
        );
        TextStyle bodyStyle = textTheme.bodyMedium!.copyWith(
          fontSize: isNarrowScreen ? 13 : 15,
        );
         TextStyle degreeStyle = textTheme.titleMedium!.copyWith( // Using titleMedium for the degree
          fontSize: isNarrowScreen ? 15 : 17,
          fontWeight: FontWeight.w600, // Already in theme, but can be adjusted
        );


        EdgeInsets padding = EdgeInsets.all(isNarrowScreen ? 12.0 : 16.0);

        return Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'EDUCATION',
                style: headingStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Bachelor of Engineering',
                style: degreeStyle,
              ),
              Text(
                'Computer Science',
                style: bodyStyle,
              ),
              Text(
                '2008 - 2012',
                style: bodyStyle.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        );
      },
    );
  }
}
