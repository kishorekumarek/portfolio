import 'package:flutter/material.dart';
import 'package:portfolio_app/models/job_model.dart';
import 'package:portfolio_app/widgets/job_experience_widget.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({super.key});

  // Moved the jobs list inside the build method
  // final List<Job> jobs = [ ... ]; // This was the issue

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Initialize jobs list here
    final List<Job> jobs = [
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Talabat',
        duration: '2022 - Present',
        description: '''\
• Spearhead mobile initiatives for the PostPaid Team within the FinTech tribe by leveraging data-driven insights and a strong product focus.
• Collaborate closely with Product, Data, Design, and other technical teams to drive initiatives from conception to delivery.
• Ensure high coding standards by writing scalable, maintainable code that guarantees product and developer excellence.
• Proactively identify and address product and technical challenges to enhance the overall user and developer experience.
• Break down complex features into minimal, shippable increments that deliver maximum value.''',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'G42 Analytcs',
        duration: '2019 - 2022',
        description: '''\
• Develop native mobile apps to visualize data using Kibana
• Develop crowdsourcing annotation app that can allow user to annotate audio or image and get paid for those annotations
• Take Architectural decisions on mobile apps
• Help mobile teams from other units with good architecture traits''',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Freshworks',
        duration: '2018 - 2019',
        description: '''\
• Lead Mobile app development for freshcaller app and provide assistance to other squads on architecture issues
• Embrace TDD and be an advocate of it, Ensure 100% of our production code is written by following Red, Green and Refactor cycle
• Mentored junior Engineers with Mobile app development.
• Lead server driven UI for all the forms screen in Freshworks products.''',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Verizon',
        duration: '2016 - 2018',
        description: '''\
• Involving in all phases of software development life cycle Conducting technical requirement analysis and translating requirements to development tasks
• Working with the project manager to deliver products on time and assisting with project management activities
• Reviewing code and ensuring the team follows clean coding guidelines. Mentoring junior developers and training new hires in iOS development''',
      ),
      Job(
        title: 'Mobile Engineer',
        company: 'Athenahealth',
        duration: '2015 - 2016',
        description: '''\
• Ensuring timely deliverables and promoting software development best practices
• Conducting code reviews and refactoring legacy code with unit tests''',
      ),
      Job(
        title: 'Mobile Engineer',
        company: 'Tringapps',
        duration: '2012 - 2014',
        description: '''\
• Ensuring timely deliverables and promoting software development best practices
• Conducting code reviews and refactoring legacy code with unit tests''',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        bool isNarrowScreen = screenWidth < 600;

        TextStyle headingStyle = textTheme.headlineSmall!.copyWith(
          fontSize: isNarrowScreen ? 18 : 22,
        );
        EdgeInsets padding = EdgeInsets.all(isNarrowScreen ? 12.0 : 16.0);

        return Container(
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WORK EXPERIENCE',
                style: headingStyle,
              ),
              const SizedBox(height: 8),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  return JobExperienceWidget(job: jobs[index]);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 16,
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
