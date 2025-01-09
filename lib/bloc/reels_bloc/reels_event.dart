part of 'reels_bloc.dart';

@freezed
class ReelsEvent with _$ReelsEvent {
  const factory ReelsEvent.getListMultiReels(List<ReelModel> lsReel) =
      _GetListMultiReels;
  const factory ReelsEvent.onChangeReel(int index) = _OnChangeReel;
  const factory ReelsEvent.initVideo(int index) = _InitVideo;
  const factory ReelsEvent.playVideo(int index) = _PlayVideo;
  const factory ReelsEvent.pauseVideo(int index) = _PauseVideo;
  const factory ReelsEvent.disposeVideo(int index) = _DisposeVideo;
}
