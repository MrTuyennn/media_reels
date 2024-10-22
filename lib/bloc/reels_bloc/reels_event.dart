part of 'reels_bloc.dart';

@freezed
class ReelsEvent with _$ReelsEvent {
  const factory ReelsEvent.initReels(String url) = _InitReels;
  const factory ReelsEvent.disposeReels() = _DisposeReels;
  const factory ReelsEvent.getListMultiReels() = _GetListMultiReels;
}
