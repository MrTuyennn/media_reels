// ignore_for_file: deprecated_member_use

part of 'reels_bloc.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ReelsState with _$ReelsState {
  factory ReelsState({
    @JsonKey(ignore: true) PageController? pageControllerMedia,
    @Default([]) List<ReelModel> lsReel,
    @JsonKey(ignore: true) Map<int, AVController>? videoController,
    @Default(0) int currentVideo,
  }) = _ReelsState;

  factory ReelsState.fromJson(Map<String, dynamic> json) =>
      _$ReelsStateFromJson(json);
}
