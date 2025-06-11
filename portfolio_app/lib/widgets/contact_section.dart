import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Let\'s Work Together',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: isDesktop ? size.width * 0.6 : size.width * 0.9,
            child: Text(
              'Ready to bring your mobile app vision to life? Whether you need a Flutter expert, iOS architect, or mobile team lead, I\'m here to help create exceptional mobile experiences.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          
          if (isDesktop) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _buildContactCard(
                  context,
                  'Email', 
                  'kishorekumarek@pm.me', 
                  Icons.email,
                  null,
                  isEmail: true,
                )),
                const SizedBox(width: 24),
                Expanded(child: _buildContactCard(
                  context,
                  'LinkedIn', 
                  'kishorekumarek', 
                  Icons.person,
                  () => _launchLinkedIn(),
                )),
              ],
            ),
          ] else ...[
            _buildContactCard(
              context,
              'Email', 
              'kishorekumarek@pm.me', 
              Icons.email,
              null,
              isEmail: true,
            ),
            const SizedBox(height: 16),
            _buildContactCard(
              context,
              'LinkedIn', 
              'kishorekumarek', 
              Icons.person,
              () => _launchLinkedIn(),
            ),
          ],
          
          const SizedBox(height: 60),
          
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.white.withOpacity(0.1)),
              ),
            ),
            child: Column(
              children: [
                Text(
                  '© 2024 Kishore Kumar. Built with Flutter 💙',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Crafted with passion for mobile excellence',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, String title, String value, IconData icon, VoidCallback? onTap, {bool isEmail = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF6366F1).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF6366F1),
                size: 24,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                if (isEmail) ...[
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () => _copyToClipboard(context, value),
                    child: Icon(
                      Icons.copy,
                      size: 20,
                      color: Colors.white60,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _copyToClipboard(BuildContext context, String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email copied to clipboard!'),
          duration: Duration(seconds: 2),
          backgroundColor: Color(0xFF6366F1),
        ),
      );
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'kishorekumarek@pm.me',
      query: 'subject=Flutter Project Inquiry&body=Hi Kishore,\n\nI would like to discuss a Flutter project opportunity with you.\n\nBest regards,',
    );
    
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> _launchLinkedIn() async {
    final Uri linkedInLaunchUri = Uri.parse('https://www.linkedin.com/in/kishorekumarek');
    
    if (!await launchUrl(linkedInLaunchUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch LinkedIn');
    }
  }
} 