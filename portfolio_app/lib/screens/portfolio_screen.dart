import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/header_widget.dart';
import 'package:portfolio_app/widgets/profile_widget.dart';
import 'package:portfolio_app/widgets/education_widget.dart';
import 'package:portfolio_app/widgets/skills_widget.dart';
import 'package:portfolio_app/widgets/work_experience_widget.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.width < 600 ? 100 : kToolbarHeight + 30), // Adjusted for new header style
        child: const HeaderWidget(),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          // Define a max content width for very wide screens to maintain readability
          double maxContentWidth = 960;
          EdgeInsets listViewPadding = EdgeInsets.symmetric(
            horizontal: screenWidth > maxContentWidth ? (screenWidth - maxContentWidth) / 2 : (isNarrowScreen(screenWidth) ? 8.0 : 16.0),
            vertical: 8.0,
          );

          return ListView(
            padding: listViewPadding,
            children: const [
              Card(child: ProfileWidget()),
              SizedBox(height: 8), // Spacing between cards
              Card(child: EducationWidget()),
              SizedBox(height: 8),
              Card(child: SkillsWidget()),
              SizedBox(height: 8),
              Card(child: WorkExperienceWidget()),
              SizedBox(height: 16), // Extra padding at the bottom
            ],
          );
        },
      ),
    );
  }

  bool isNarrowScreen(double width) => width < 600;
}
