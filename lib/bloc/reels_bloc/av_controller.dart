import 'package:video_player/video_player.dart';

class AVController extends VideoPlayerController {
  AVController({
    required this.url,
    this.autoPlay = false,
    this.enablePlayLoop = true,
    this.disableSound = false,
  }) : super.networkUrl(Uri.parse(url));

  final String url;
  final bool enablePlayLoop;
  final bool autoPlay;
  final bool disableSound;

  bool isPaused = false;

  @override
  Future<void> initialize() async {
    if (value.isInitialized) return Future.value();

    value = value.copyWith(
      isPlaying: autoPlay,
      isLooping: enablePlayLoop,
      volume: disableSound ? 0 : 1,
    );

    await super.initialize();
  }
}
