import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/hero_section.dart';
import 'package:portfolio_app/widgets/about_section.dart';
import 'package:portfolio_app/widgets/projects_section.dart';
import 'package:portfolio_app/widgets/skills_section.dart';
import 'package:portfolio_app/widgets/experience_section.dart';
import 'package:portfolio_app/widgets/contact_section.dart';
import 'package:portfolio_app/widgets/navigation_bar.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0B),
              Color(0xFF1A1A1B),
              Color(0xFF0A0A0B),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated background elements
            Positioned.fill(
              child: _buildAnimatedBackground(),
            ),
            // Main content
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HeroSection(
                        key: _heroKey,
                        onViewWorkPressed: () => _scrollToSection(_projectsKey),
                        onContactPressed: () => _scrollToSection(_contactKey),
                      ),
                      AboutSection(key: _aboutKey),
                      ProjectsSection(key: _projectsKey),
                      SkillsSection(key: _skillsKey),
                      ExperienceSection(key: _experienceKey),
                      ContactSection(key: _contactKey),
                    ],
                  ),
                ),
              ],
            ),
            // Floating navigation
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomNavigationBar(
                scrollController: _scrollController,
                sections: {
                  'Home': _heroKey,
                  'About': _aboutKey,
                  'Projects': _projectsKey,
                  'Skills': _skillsKey,
                  'Experience': _experienceKey,
                  'Contact': _contactKey,
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedBackground() {
    return Stack(
      children: [
        // Gradient orbs
        Positioned(
          top: 100,
          right: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.purple.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 200,
          left: -150,
          child: Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.blue.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 400,
          left: MediaQuery.of(context).size.width / 2 - 150,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.cyan.withOpacity(0.2),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
