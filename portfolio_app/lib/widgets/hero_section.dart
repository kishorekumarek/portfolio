import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback? onViewWorkPressed;
  final VoidCallback? onContactPressed;
  
  const HeroSection({
    super.key, 
    this.onViewWorkPressed,
    this.onContactPressed,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      constraints: BoxConstraints(
        minHeight: isDesktop ? 600 : 500,
      ),
      width: size.width,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: 48,
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                'Hello, I\'m',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),
              
              // Name
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                ).createShader(bounds),
                child: Text(
                  'Kishore Kumar',
                  style: isDesktop 
                    ? Theme.of(context).textTheme.displayLarge
                    : Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: 8),
              
              // Subtitle
              Text(
                'Senior Flutter Engineer',
                style: (isDesktop 
                  ? Theme.of(context).textTheme.headlineMedium
                  : Theme.of(context).textTheme.headlineSmall)?.copyWith(
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 24),
              
              // Description
              SizedBox(
                width: isDesktop ? size.width * 0.6 : size.width * 0.9,
                child: Text(
                  'I craft beautiful mobile experiences with Flutter and build scalable architectures that delight users and developers alike. Currently leading mobile initiatives at Talabat with 12+ years of expertise.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 40),
              
              // Action buttons
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton.icon(
                    onPressed: widget.onViewWorkPressed,
                    icon: const Icon(Icons.rocket_launch),
                    label: const Text('View My Work'),
                  ),
                  OutlinedButton.icon(
                    onPressed: widget.onContactPressed,
                    icon: const Icon(Icons.email),
                    label: const Text('Get In Touch'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: const BorderSide(color: Colors.white30),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 60),
              
              // Floating code snippet
              if (isDesktop) _buildFloatingCodeSnippet(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingCodeSnippet() {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'class FlutterExpert {\n  final experience = 12;\n  final passion = ∞;\n  \n  void buildAmazingApps() {\n    // Magic happens here ✨\n  }\n}',
            style: GoogleFonts.firaCode(
              fontSize: 12,
              color: Colors.white70,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }
} 