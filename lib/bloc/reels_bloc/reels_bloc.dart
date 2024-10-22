import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:media_reels/model/object_model/video_controller/video_player_controller_converter.dart';
import 'package:video_player/video_player.dart';

part 'reels_bloc.freezed.dart';
part 'reels_bloc.g.dart';
part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  ReelsBloc() : super(ReelsState()) {
    on<_InitReels>(_initReels);
  }

  void _initReels(_InitReels event, Emitter emit) {
    try {
      VideoPlayerController? videoController =
          VideoPlayerController.networkUrl(Uri.parse(event.url));
      videoController.initialize();
      videoController.play();
      emit(state.copyWith(controllerVideo: videoController));
    } catch (e) {}
  }
}
