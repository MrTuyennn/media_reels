import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerControllerConverter
    extends JsonConverter<VideoPlayerController?, String?> {
  const VideoPlayerControllerConverter();

  @override
  VideoPlayerController? fromJson(String? json) {
    if (json == null) return null;
    return VideoPlayerController.networkUrl(Uri.parse(json));
  }

  @override
  String? toJson(VideoPlayerController? object) {
    return object?.dataSource;
  }
}
