import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_reels/bloc/reels_bloc/av_controller.dart';
import 'package:media_reels/core/log/log.dart';
import 'package:media_reels/model/object_model/reel_model/reel_model.dart';
import 'package:media_reels/repository/reel_repository.dart';

part 'reels_bloc.freezed.dart';
part 'reels_bloc.g.dart';
part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  ReelsBloc() : super(ReelsState()) {
    on<_GetListMultiReels>(_getListMultiReels);
    on<_OnChangeReel>(_onChangeReel);
    on<_InitVideo>(_initVideo);
    on<_PlayVideo>(_playVideo);
    on<_PauseVideo>(_pauseVideo);
    on<_DisposeVideo>(_disposeVideo);
  }

  final reelReponse = ReelRepository();

  void _getListMultiReels(_GetListMultiReels event, Emitter emit) async {
    PageController? pageController = state.pageControllerMedia;
    pageController = PageController(initialPage: 0, viewportFraction: 1.0);

    String videoUrl = event.lsReel[0].video.toString();

    final AVController controller = AVController(url: videoUrl);
    final updateMap = state.videoController ?? {};
    await controller.initialize();
    updateMap[0] = controller;

    emit(state.copyWith(videoController: updateMap));

    add(const ReelsEvent.playVideo(0));

    add(const ReelsEvent.initVideo(1));

    emit(state.copyWith(
        currentVideo: 0,
        lsReel: event.lsReel,
        pageControllerMedia: pageController));
  }

  void _initVideo(_InitVideo event, Emitter emit) {
    try {
      if (state.lsReel.isEmpty || event.index < 0) return;

      ReelModel reelVideoIndex = state.lsReel[event.index];

      String videoUrl = reelVideoIndex.video.toString();
      final AVController controller = AVController(url: videoUrl);
      final updateMap = state.videoController ?? {};
      controller.initialize();
      updateMap[event.index] = controller;

      emit(state.copyWith(videoController: updateMap));
    } catch (e) {
      Log.error("init failed ====> $e");
    }
  }

  void _playVideo(_PlayVideo event, Emitter emit) {
    if (state.lsReel.length > event.index && event.index >= 0) {
      final AVController? controller = state.videoController?[event.index];
      if (controller == null || controller.value.isPlaying) return;
      final updateMap = state.videoController ?? {};
      controller.play();
      updateMap[event.index] = controller;
      emit(state.copyWith(videoController: updateMap));
    }
  }

  void _nextVideo(int index) {
    /// Dispose [index - 2] controller
    add(ReelsEvent.disposeVideo((index - 2)));

    /// Stop [index - 1] controller
    add(ReelsEvent.pauseVideo((index - 1)));

    /// Play current video (already initialized)
    add(ReelsEvent.playVideo((index)));

    /// Initialize [index + 1] controller
    add(ReelsEvent.initVideo((index + 1)));
  }

  void _previewVideo(int index) {
    /// Dispose [index - 2] controller
    add(ReelsEvent.disposeVideo((index + 2)));

    /// Stop [index - 1] controller
    add(ReelsEvent.pauseVideo((index + 1)));

    /// Play current video (already initialized)
    add(ReelsEvent.playVideo((index)));

    /// Initialize [index + 1] controller
    add(ReelsEvent.initVideo((index - 1)));
  }

  void _pauseVideo(_PauseVideo event, Emitter emit) {
    if (state.lsReel.length > event.index && event.index >= 0) {
      final updateMap = state.videoController ?? {};
      final AVController? controller = updateMap[event.index];
      if (controller != null) {
        controller.pause();
        controller.seekTo(Duration.zero);
        updateMap[event.index] = controller;
        emit(state.copyWith(videoController: updateMap));
      }
    }
  }

  void _disposeVideo(_DisposeVideo event, Emitter emit) {
    if (state.lsReel.length > event.index && event.index >= 0) {
      final updateMap = state.videoController ?? {};
      final AVController? controller = updateMap[event.index];
      if (controller != null) {
        controller.dispose();
        controller.removeListener(() {});
        updateMap.remove(event.index);
        emit(state.copyWith(videoController: updateMap));
      }
    }
  }

  void _onChangeReel(_OnChangeReel event, Emitter emit) {
    emit(state.copyWith(currentVideo: event.index));
    if (event.index > state.currentVideo) {
      _nextVideo(event.index);
    } else {
      _previewVideo(event.index);
    }
  }
}
