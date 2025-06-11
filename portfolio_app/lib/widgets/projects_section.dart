import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        vertical: 48,
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
            'Mobile applications I\'ve architected and built, available on App Store and Google Play',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 40),
          
          _buildProjectGrid(context),
        ],
      ),
    );
  }

  Widget _buildProjectGrid(BuildContext context) {
    final projects = _getProjects();
    
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: projects.map((project) {
        return SizedBox(
          width: 320,
          height: 280,
          child: ProjectCard(project: project),
        );
      }).toList(),
    );
  }

  List<Project> _getProjects() {
    return [
      Project(
        title: 'Talabat',
        description: 'Leading food delivery app in MENA region with 10M+ downloads. Built scalable FinTech features for PostPaid team with data-driven architecture.',
        technologies: ['Flutter', 'Dart', 'Firebase', 'REST APIs', 'FinTech'],
        color: const Color(0xFF6366F1),
        icon: Icons.delivery_dining,
        appStoreUrl: 'https://apps.apple.com/us/app/talabat-food-grocery-more/id451001072',
        playStoreUrl: 'https://play.google.com/store/apps/details?id=com.talabat',
        rating: '4.6',
        downloads: '10M+',
      ),
      Project(
        title: 'N21Mobile',
        description: 'Educational companion app for Network TwentyOne IBOs. Subscription-based platform delivering training and motivation content.',
        technologies: ['iOS', 'Swift', 'Media Streaming', 'Education', 'Networking'],
        color: const Color(0xFF10B981),
        icon: Icons.school,
        appStoreUrl: 'https://apps.apple.com/nz/app/n21mobile/id6474433715',
        playStoreUrl: null,
        rating: '4+',
        downloads: '35.1 MB',
      ),
      Project(
        title: 'Mawjiz',
        description: 'News aggregator app delivering curated news from multiple sources in one place with personalized summaries.',
        technologies: ['Flutter', 'News APIs', 'Content Aggregation', 'Push Notifications'],
        color: const Color(0xFF06B6D4),
        icon: Icons.newspaper,
        appStoreUrl: null,
        playStoreUrl: null,
        rating: null,
        downloads: 'News Aggregator',
      ),
      Project(
        title: 'Freshcaller',
        description: 'Modern cloud telephony VoIP app for business calling. Led mobile development with server-driven UI and advanced call management features.',
        technologies: ['iOS', 'Swift', 'Objective-C', 'TDD', 'VoIP'],
        color: const Color(0xFF8B5CF6),
        icon: Icons.phone_in_talk,
        appStoreUrl: 'https://apps.apple.com/us/app/freshcaller/id1424866045',
        playStoreUrl: null,
        rating: '3.3',
        downloads: null,
      ),
      Project(
        title: 'Freshdesk',
        description: 'Customer support software used by millions. Delivered exceptional mobile experience for helpdesk management across multiple channels.',
        technologies: ['iOS', 'Swift', 'Mobile Architecture', 'Multi-channel'],
        color: const Color(0xFFF59E0B),
        icon: Icons.support_agent,
        appStoreUrl: 'https://apps.apple.com/us/app/freshdesk/id849713306',
        playStoreUrl: 'https://play.google.com/store/apps/details?id=com.freshdesk.helpdesk',
        rating: '4.5',
        downloads: '2.7K ratings',
      ),
      Project(
        title: 'Freshchat',
        description: 'Modern messaging app for sales and customer engagement. Built continuity and experience of consumer messaging for businesses.',
        technologies: ['iOS', 'Swift', 'Real-time Chat', 'Push Notifications'],
        color: const Color(0xFFEF4444),
        icon: Icons.chat_bubble,
        appStoreUrl: 'https://apps.apple.com/us/app/freshchat/id1273666080',
        playStoreUrl: 'https://play.google.com/store/apps/details?id=com.freshdesk.messaging',
        rating: '3.6',
        downloads: '51 ratings',
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
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? rating;
  final String? downloads;

  Project({
    required this.title,
    required this.description,
    required this.technologies,
    required this.color,
    required this.icon,
    this.appStoreUrl,
    this.playStoreUrl,
    this.rating,
    this.downloads,
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
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    widget.project.color.withOpacity(0.1),
                    Colors.white.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
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
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.project.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          widget.project.icon,
                          color: widget.project.color,
                          size: 18,
                        ),
                      ),
                      const Spacer(),
                      if (widget.project.rating != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 10),
                              const SizedBox(width: 2),
                              Text(
                                widget.project.rating!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.project.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  if (widget.project.downloads != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      widget.project.downloads!,
                      style: TextStyle(
                        fontSize: 10,
                        color: widget.project.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                  const SizedBox(height: 6),
                  Expanded(
                    child: Text(
                      widget.project.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                        height: 1.3,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: widget.project.technologies.take(3).map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.white70,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      if (widget.project.appStoreUrl != null)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(widget.project.appStoreUrl!),
                            icon: Icon(Icons.apple, size: 12),
                            label: const Text('App Store', style: TextStyle(fontSize: 9)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                          ),
                        ),
                      if (widget.project.appStoreUrl != null && widget.project.playStoreUrl != null)
                        const SizedBox(width: 4),
                      if (widget.project.playStoreUrl != null)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(widget.project.playStoreUrl!),
                            icon: Icon(Icons.android, size: 12),
                            label: const Text('Play Store', style: TextStyle(fontSize: 9)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
} 