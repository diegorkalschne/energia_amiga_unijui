import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CsYoutubePlayer extends StatefulWidget {
  const CsYoutubePlayer({
    required this.link,
    this.autoPlay = false,
    this.isLive = false,
    super.key,
  });

  final String link;
  final bool autoPlay;
  final bool isLive;

  @override
  State<CsYoutubePlayer> createState() => _CsYoutubePlayerState();
}

class _CsYoutubePlayerState extends State<CsYoutubePlayer> {
  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.link)!,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        forceHD: false,
        isLive: widget.isLive,
        loop: false,
        captionLanguage: 'pt-br',
        useHybridComposition: false,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: theme.primaryColor,
      progressColors: ProgressBarColors(
        playedColor: theme.primaryColor,
        handleColor: theme.colorScheme.secondary,
        backgroundColor: theme.scaffoldBackgroundColor,
        bufferedColor: theme.scaffoldBackgroundColor,
      ),
    );
  }
}
