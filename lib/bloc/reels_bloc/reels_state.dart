part of 'reels_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ReelsState with _$ReelsState {
  factory ReelsState({
    @VideoPlayerControllerConverter() VideoPlayerController? controllerVideo,
  }) = _ReelsState;

  factory ReelsState.fromJson(Map<String, dynamic> json) =>
      _$ReelsStateFromJson(json);
}
