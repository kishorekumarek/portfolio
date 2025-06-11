import 'package:flutter/material.dart';
import 'package:portfolio_app/models/job_model.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
            'Experience',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'My professional journey in mobile engineering',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 40),
          
          _buildTimeline(context, isDesktop),
        ],
      ),
    );
  }

  Widget _buildTimeline(BuildContext context, bool isDesktop) {
    final jobs = _getJobs();
    
    return Column(
      children: jobs.asMap().entries.map((entry) {
        final index = entry.key;
        final job = entry.value;
        final isLast = index == jobs.length - 1;
        
        return ExperienceCard(
          job: job,
          isLast: isLast,
          isDesktop: isDesktop,
        );
      }).toList(),
    );
  }

  List<Job> _getJobs() {
    return [
      Job(
        title: 'Freelance Mobile Developer',
        company: 'Independent',
        duration: '2017 - Present',
        description: 'Providing freelance mobile app development services specializing in iOS and Flutter. Delivered 20+ custom mobile applications for startups and enterprises across various industries including FinTech, Healthcare, and E-commerce.',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Talabat',
        duration: '2022 - Present',
        description: 'Spearhead mobile initiatives for the PostPaid Team within the FinTech tribe by leveraging data-driven insights and a strong product focus. Collaborate closely with Product, Data, Design, and other technical teams to drive initiatives from conception to delivery.',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'G42 Analytics',
        duration: '2019 - 2022',
        description: 'Developed native mobile apps to visualize data using Kibana. Created crowdsourcing annotation app for audio and image annotation with payment systems. Made architectural decisions for mobile applications.',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Freshworks',
        duration: '2018 - 2019',
        description: 'Led Mobile app development for Freshcaller app. Embraced TDD and advocated for 100% test coverage. Mentored junior engineers and led server-driven UI development for all forms in Freshworks products.',
      ),
      Job(
        title: 'Senior Mobile Engineer',
        company: 'Verizon',
        duration: '2016 - 2018',
        description: 'Involved in all phases of software development life cycle. Conducted technical requirement analysis and translated requirements to development tasks. Reviewed code and ensured clean coding guidelines.',
      ),
      Job(
        title: 'Mobile Engineer',
        company: 'Athenahealth',
        duration: '2015 - 2016',
        description: 'Ensured timely deliverables and promoted software development best practices. Conducted code reviews and refactored legacy code with comprehensive unit tests.',
      ),
      Job(
        title: 'Mobile Engineer',
        company: 'Tringapps',
        duration: '2012 - 2014',
        description: 'Started my mobile engineering journey focusing on iOS development. Learned best practices and established foundation for scalable mobile solutions.',
      ),
    ];
  }
}

class ExperienceCard extends StatefulWidget {
  final Job job;
  final bool isLast;
  final bool isDesktop;

  const ExperienceCard({
    super.key,
    required this.job,
    required this.isLast,
    required this.isDesktop,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard>
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
      end: 1.02,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Timeline
                Column(
                  children: [
                    Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: _isHovered 
                          ? const Color(0xFF6366F1)
                          : Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFF6366F1),
                          width: 2,
                        ),
                      ),
                    ),
                    if (!widget.isLast)
                      Container(
                        width: 2,
                        height: 140,
                        color: Colors.white.withOpacity(0.2),
                      ),
                  ],
                ),
                const SizedBox(width: 24),
                
                // Content
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(_isHovered ? 0.08 : 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: _isHovered
                          ? const Color(0xFF6366F1).withOpacity(0.3)
                          : Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.job.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.job.company,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF6366F1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.job.duration,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6366F1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.job.description,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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