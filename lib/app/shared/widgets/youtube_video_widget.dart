import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoWidget extends StatefulWidget {
  final String videoUrl; // URL or Video ID

  const YoutubeVideoWidget({super.key, required this.videoUrl});

  @override
  State<YoutubeVideoWidget> createState() => _YoutubeVideoWidgetState();
}

class _YoutubeVideoWidgetState extends State<YoutubeVideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extract video ID from the provided URL
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl)!;

    // Initialize the YouTube Player Controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false, // Don't auto-play when loaded
        mute: false, // Start with sound enabled
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true, // Show progress bar
      progressIndicatorColor: Colors.red, // Color of the progress bar
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
      ),
      onReady: () {
        debugPrint("YouTube Player Ready!");
      },
      onEnded: (metaData) {
        debugPrint("Video Ended!");
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose controller to free resources
    super.dispose();
  }
}
