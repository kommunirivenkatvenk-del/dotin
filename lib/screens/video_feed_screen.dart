// Import at top:
import '../widgets/video_player_card.dart';

// Replace the ListView.builder body with:
Expanded(
  child: ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return VideoPlayerCard(
        title: 'dotin Featured Video #${index + 1}',
        videoUrl: 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      );
    },
  ),
),// Import chat_screen.dart at top:
import 'chat_screen.dart';

// Add inside AppBar actions:
IconButton(
  icon: const Icon(Icons.send),
  tooltip: 'Private Messages',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  },
),import 'package:flutter/material.dart';
import '../widgets/banner_ad_widget.dart';
import 'paywall_screen.dart';
import 'ai_vfx_editor_screen.dart';

class VideoFeedScreen extends StatelessWidget {
  final bool isSubscriber;
  final bool isProCreator;

  const VideoFeedScreen({
    super.key,
    this.isSubscriber = false,
    this.isProCreator = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dotin Feed'),
        actions: [
          // AI-VFX Studio Button
          IconButton(
            icon: const Icon(Icons.auto_fix_high),
            tooltip: 'AI-VFX Studio',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AiVfxEditorScreen(isProCreator: isProCreator),
                ),
              );
            },
          ),
          // Upgrade / Paywall Button
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            tooltip: 'Upgrade Tier',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaywallScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text('Video Post #${index + 1}', style: const TextStyle(fontSize: 18)),
                  ),
                );
              },
            ),
          ),
          // Show banner ad only for non-subscribers
          if (!isSubscriber) const BannerAdWidget(),
        ],
      ),
    );
  }
}import 'package:flutter/material.dart';
import '../widgets/banner_ad_widget.dart';
import 'paywall_screen.dart';

class VideoFeedScreen extends StatelessWidget {
  final bool isSubscriber; // Pass true if user holds Basic or Pro subscription

  const VideoFeedScreen({super.key, this.isSubscriber = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dotin Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.star, color: Colors.amber),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaywallScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200,
                    alignment: Alignment.center,
                    child: Text('Video Post #${index + 1}', style: const TextStyle(fontSize: 18)),
                  ),
                );
              },
            ),
          ),
          // Show banner ad only for non-subscribers
          if (!isSubscriber) const BannerAdWidget(),
        ],
      ),
    );
  }
}
