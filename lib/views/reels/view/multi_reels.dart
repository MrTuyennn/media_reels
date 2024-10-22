import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/bloc/reels_bloc/reels_bloc.dart';
import 'package:video_player/video_player.dart';

class MultiReels extends StatefulWidget {
  const MultiReels({super.key});

  @override
  State<MultiReels> createState() => _MultiReelsState();
}

class _MultiReelsState extends State<MultiReels> {
  ReelsBloc? _reelsBloc;

  @override
  void initState() {
    super.initState();
    _reelsBloc = context.read<ReelsBloc>();
    _reelsBloc!.add(const ReelsEvent.initReels(
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReelsBloc, ReelsState>(builder: (context, state) {
      return state.controllerVideo != null
          ? AspectRatio(
              aspectRatio: state.controllerVideo!.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(state.controllerVideo!),
                  VideoProgressIndicator(state.controllerVideo!,
                      allowScrubbing: true),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
