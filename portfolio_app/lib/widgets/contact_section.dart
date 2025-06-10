import 'package:flutter/material.dart';

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
        vertical: 80,
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
                Expanded(child: _buildContactCard('Email', 'kishorekumarek@pm.me', Icons.email)),
                const SizedBox(width: 24),
                Expanded(child: _buildContactCard('Phone', '0547868607', Icons.phone)),
                const SizedBox(width: 24),
                Expanded(child: _buildContactCard('LinkedIn', '/in/kishore-kumar', Icons.person)),
              ],
            ),
          ] else ...[
            _buildContactCard('Email', 'kishorekumarek@pm.me', Icons.email),
            const SizedBox(height: 16),
            _buildContactCard('Phone', '0547868607', Icons.phone),
            const SizedBox(height: 16),
            _buildContactCard('LinkedIn', '/in/kishore-kumar', Icons.person),
          ],
          
          const SizedBox(height: 40),
          
          ElevatedButton.icon(
            onPressed: () {
              // TODO: Implement email functionality
            },
            icon: const Icon(Icons.send),
            label: const Text('Send Message'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          
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

  Widget _buildContactCard(String title, String value, IconData icon) {
    return Container(
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
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
} 