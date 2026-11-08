import 'revenue_dashboard_screen.dart';

// Inside AiVfxEditorScreen button handler:
ElevatedButton.icon(
  icon: const Icon(Icons.analytics),
  label: const Text('View 56% Creator Revenue Analytics'),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RevenueDashboardScreen()),
    );
  },
),import 'package:flutter/material.dart';
import 'paywall_screen.dart';

class AiVfxEditorScreen extends StatelessWidget {
  final bool isProCreator; // True if user is subscribed to the $30/mo Pro Creator tier

  const AiVfxEditorScreen({super.key, this.isProCreator = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dotin AI-VFX Studio'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: isProCreator
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Pro Creator Tools Unlocked',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  const SizedBox(height: 10),
                  const Text('Select an AI-VFX module to apply to your video stream:'),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.movie_filter),
                    label: const Text('AI Style Transfer & Enhancer'),
                    onPressed: () {
                      // Apply AI VFX filter logic
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.auto_fix_high),
                    label: const Text('Algorithmic Background Replacer'),
                    onPressed: () {
                      // Background replacement logic
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.analytics),
                    label: const Text('View 56% Creator Revenue Analytics'),
                    onPressed: () {
                      // Analytics dashboard
                    },
                  ),
                ],
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.lock, size: 64, color: Colors.deepPurple),
                    const SizedBox(height: 16),
                    const Text(
                      'Pro Creator Feature Locked',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Unlock advanced AI-VFX editing tools and your 56% Creator Revenue Split with the \$30/mo Pro Creator tier.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PaywallScreen()),
                        );
                      },
                      child: const Text('Upgrade to Pro Creator (\$30/mo)'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
