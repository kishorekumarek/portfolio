import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 40),
          
          if (isDesktop) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildContent(context),
                ),
                const SizedBox(width: 60),
                Expanded(
                  child: _buildStats(context),
                ),
              ],
            ),
          ] else ...[
            _buildContent(context),
            const SizedBox(height: 40),
            _buildStats(context),
          ],
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passionate Flutter Engineer with a Data-Driven Mindset',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'With over 12 years in mobile engineering, I excel in creating scalable mobile architectures and finding the perfect balance between clean code and pragmatic solutions. I\'m currently advancing mobile initiatives at Talabat\'s PostPaid team, where I collaborate with Product, Data, and Design teams to deliver exceptional user experiences.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 20),
        Text(
          'My approach combines technical excellence with strong leadership, breaking down complex features into minimal, shippable increments. I believe in continuous improvement and work closely with Data teams post-launch to evaluate performance and drive optimizations.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        
        // Key highlights
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _buildHighlight(
              icon: Icons.architecture,
              title: 'Architecture Expert',
              description: 'Scalable mobile solutions',
            ),
            _buildHighlight(
              icon: Icons.trending_up,
              title: 'Data-Driven',
              description: 'Performance optimization',
            ),
            _buildHighlight(
              icon: Icons.groups,
              title: 'Team Leadership',
              description: 'Mentoring & guidance',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHighlight({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF6366F1),
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          _buildStatItem('12+', 'Years Experience'),
          const SizedBox(height: 24),
          _buildStatItem('50+', 'Projects Delivered'),
          const SizedBox(height: 24),
          _buildStatItem('6', 'Companies'),
          const SizedBox(height: 24),
          _buildStatItem('∞', 'Passion for Code'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          ).createShader(bounds),
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
} 