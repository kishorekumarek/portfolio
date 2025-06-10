import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'A showcase of Flutter applications and mobile solutions I\'ve crafted',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 40),
          
          if (isDesktop) ...[
            _buildProjectGrid(context, 2),
          ] else if (isTablet) ...[
            _buildProjectGrid(context, 2),
          ] else ...[
            _buildProjectGrid(context, 1),
          ],
        ],
      ),
    );
  }

  Widget _buildProjectGrid(BuildContext context, int columns) {
    final projects = _getProjects();
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.2,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(project: projects[index]);
      },
    );
  }

  List<Project> _getProjects() {
    return [
      Project(
        title: 'Talabat PostPaid',
        description: 'Leading mobile initiatives for FinTech solutions with data-driven architecture and seamless user experience.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
        color: const Color(0xFF6366F1),
        icon: Icons.payment,
      ),
      Project(
        title: 'Freshcaller Mobile',
        description: 'Native mobile app for cloud telephony with server-driven UI and advanced call management features.',
        technologies: ['iOS', 'Swift', 'Objective-C', 'TDD'],
        color: const Color(0xFF8B5CF6),
        icon: Icons.phone,
      ),
      Project(
        title: 'Data Visualization Suite',
        description: 'Mobile apps for visualizing Kibana data with intuitive charts and real-time analytics.',
        technologies: ['Flutter', 'Charts', 'Kibana', 'WebSocket'],
        color: const Color(0xFF06B6D4),
        icon: Icons.analytics,
      ),
      Project(
        title: 'Crowdsourcing Platform',
        description: 'Annotation app allowing users to contribute to AI training data through audio and image labeling.',
        technologies: ['Flutter', 'ML Kit', 'Cloud Storage', 'Payments'],
        color: const Color(0xFF10B981),
        icon: Icons.groups,
      ),
    ];
  }
}

class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final Color color;
  final IconData icon;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.color,
    required this.icon,
  });
}

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.project.color.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isHovered 
                    ? widget.project.color.withOpacity(0.5)
                    : Colors.white.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: widget.project.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.project.icon,
                          color: widget.project.color,
                          size: 24,
                        ),
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_outward,
                        color: Colors.white60,
                        size: 20,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Text(
                      widget.project.description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: widget.project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
} 