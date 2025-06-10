import 'package:flutter/material.dart';
import 'package:portfolio_app/models/job_model.dart';

class JobExperienceWidget extends StatelessWidget {
  final Job job;

  const JobExperienceWidget({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        TextStyle titleStyle = textTheme.titleMedium!.copyWith(
          fontSize: isNarrowScreen ? 16 : 18,
        );
        TextStyle companyDurStyle = textTheme.titleSmall!.copyWith(
          fontSize: isNarrowScreen ? 13 : 15,
        );
        TextStyle descriptionStyle = textTheme.bodyMedium!.copyWith(
          fontSize: isNarrowScreen ? 13 : 15,
        );
        EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: isNarrowScreen ? 8.0 : 10.0); // Slightly more padding

        List<Widget> descriptionItems = job.description
            .split('• ')
            .where((item) => item.trim().isNotEmpty)
            .map((bulletPoint) => Padding(
                  padding: const EdgeInsets.only(top: 4.0), // Consistent top padding for bullets
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• ',
                        style: descriptionStyle.copyWith(fontWeight: FontWeight.bold), // Make bullet bold
                      ),
                      Expanded(
                        child: Text(
                          bulletPoint.trim().replaceAll('\n', ''), // Remove potential newlines within a bullet
                          textAlign: TextAlign.justify,
                          style: descriptionStyle,
                        ),
                      ),
                    ],
                  ),
                ))
            .toList();

        // Handle cases where description might not be bullet points (if first item doesn't start with bullet)
        if (job.description.isNotEmpty && !job.description.trim().startsWith('• ')) {
            descriptionItems = [
                Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                        job.description.trim(),
                        textAlign: TextAlign.justify,
                        style: descriptionStyle,
                    ),
                )
            ];
        }


        return Padding(
          padding: verticalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(job.title, style: titleStyle),
              Text('${job.company} | ${job.duration}', style: companyDurStyle),
              const SizedBox(height: 8), // Increased spacing before description
              ...descriptionItems,
            ],
          ),
        );
      },
    );
  }
}
