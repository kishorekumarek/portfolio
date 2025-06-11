import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
            'Skills & Technologies',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Technologies and methodologies I excel at',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white60,
            ),
          ),
          const SizedBox(height: 40),
          
          if (isDesktop) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildSkillCategory('Mobile Development', _getMobileSkills())),
                const SizedBox(width: 32),
                Expanded(child: _buildSkillCategory('Architecture & Design', _getArchitectureSkills())),
                const SizedBox(width: 32),
                Expanded(child: _buildSkillCategory('Tools & Methodologies', _getToolsSkills())),
              ],
            ),
          ] else ...[
            _buildSkillCategory('Mobile Development', _getMobileSkills()),
            const SizedBox(height: 32),
            _buildSkillCategory('Architecture & Design', _getArchitectureSkills()),
            const SizedBox(height: 32),
            _buildSkillCategory('Tools & Methodologies', _getToolsSkills()),
          ],
        ],
      ),
    );
  }

  Widget _buildSkillCategory(String title, List<Skill> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((skill) => SkillBubble(skill: skill)).toList(),
        ),
      ],
    );
  }

  List<Skill> _getMobileSkills() {
    return [
      Skill('Flutter', 0.95, const Color(0xFF02569B)),
      Skill('Dart', 0.95, const Color(0xFF0175C2)),
      Skill('iOS', 0.90, const Color(0xFF007AFF)),
      Skill('Swift', 0.88, const Color(0xFFFA7343)),
      Skill('Objective-C', 0.85, const Color(0xFF438EFF)),
      Skill('Android', 0.80, const Color(0xFF3DDC84)),
    ];
  }

  List<Skill> _getArchitectureSkills() {
    return [
      Skill('Mobile Architecture', 0.95, const Color(0xFF6366F1)),
      Skill('SOLID Principles', 0.92, const Color(0xFF8B5CF6)),
      Skill('Clean Architecture', 0.92, const Color(0xFF06B6D4)),
      Skill('Design Patterns', 0.88, const Color(0xFF10B981)),
      Skill('State Management', 0.90, const Color(0xFFF59E0B)),
      Skill('Dependency Injection', 0.85, const Color(0xFFEF4444)),
    ];
  }

  List<Skill> _getToolsSkills() {
    return [
      Skill('TDD', 0.90, const Color(0xFF8B5CF6)),
      Skill('CI/CD', 0.85, const Color(0xFF06B6D4)),
      Skill('Git', 0.92, const Color(0xFFF1502F)),
      Skill('Firebase', 0.88, const Color(0xFFFFA000)),
      Skill('REST APIs', 0.90, const Color(0xFF10B981)),
      Skill('GraphQL', 0.80, const Color(0xFFE10098)),
    ];
  }
}

class Skill {
  final String name;
  final double proficiency;
  final Color color;

  Skill(this.name, this.proficiency, this.color);
}

class SkillBubble extends StatefulWidget {
  final Skill skill;

  const SkillBubble({super.key, required this.skill});

  @override
  State<SkillBubble> createState() => _SkillBubbleState();
}

class _SkillBubbleState extends State<SkillBubble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.skill.color.withOpacity(0.2),
                    widget.skill.color.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: _isHovered
                      ? widget.skill.color
                      : widget.skill.color.withOpacity(0.3),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: widget.skill.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.skill.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: _isHovered ? Colors.white : Colors.white70,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${(widget.skill.proficiency * 100).round()}%',
                    style: TextStyle(
                      fontSize: 12,
                      color: widget.skill.color,
                      fontWeight: FontWeight.w600,
                    ),
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