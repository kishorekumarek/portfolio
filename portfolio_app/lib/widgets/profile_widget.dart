import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        // Adjust font sizes based on screen width, using theme styles as a base
        TextStyle headingStyle = textTheme.headlineSmall!.copyWith(
          fontSize: isNarrowScreen ? 18 : 22, // Adjusted from base 24
        );
        TextStyle bodyStyle = textTheme.bodyMedium!.copyWith(
          fontSize: isNarrowScreen ? 13 : 15, // Adjusted from base 16
        );
        EdgeInsets padding = EdgeInsets.all(isNarrowScreen ? 12.0 : 16.0);

        return Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PROFILE',
                style: headingStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Data-driven mobile engineer with 12 years of experience; I excel in mobile app architecture and know where to draw the fine line between clean code and pragmatism. Advancing mobile initiatives for the PostPaid team through a mix of leadership and technical excellence. Collaborates with Product, Data, and Design teams to architect scalable, maintainable solutions while upholding high coding standards. Breaks down complex features into minimal, shippable increments and proactively resolves technical challenges. Partners with the Data team post-launch to evaluate performance and drive continuous improvements.',
                textAlign: TextAlign.justify,
                style: bodyStyle,
              ),
            ],
          ),
        );
      },
    );
  }
}
