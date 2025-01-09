import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/bloc/reels_bloc/reels_bloc.dart';
import 'package:media_reels/model/object_model/reel_model/reel_model.dart';
import 'package:video_player/video_player.dart';

List<ReelModel> lsReel = [
  const ReelModel(
      state: "F",
      video: "https://cfvod.livemalltv.com/dev/HLS/test.m3u8",
      viewMode: "V",
      imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test.0000000.jpg"),
  const ReelModel(
    state: "F",
    video: "https://cfvod.livemalltv.com/dev/HLS/test1.m3u8",
    viewMode: "H",
    imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test1.0000000.jpg",
  ),
  const ReelModel(
    state: "F",
    video: "https://cfvod.livemalltv.com/dev/HLS/test2.m3u8",
    viewMode: "V",
    imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test2.0000000.jpg",
  ),
  const ReelModel(
    state: "F",
    video: "https://cfvod.livemalltv.com/dev/HLS/test3.m3u8",
    viewMode: "H",
    imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test3.0000000.jpg",
  ),
  const ReelModel(
    state: "F",
    video: "https://cfvod.livemalltv.com/dev/HLS/test4.m3u8",
    viewMode: "V",
    imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test4.0000000.jpg",
  ),
  const ReelModel(
    state: "F",
    video: "https://cfvod.livemalltv.com/dev/HLS/test5.m3u8",
    viewMode: "V",
    imageUrl: "https://cfvod.livemalltv.com/dev/HLS/test5.0000000.jpg",
  ),
  // const ReelModel(
  //   state: "Y",
  //   video: "https://youtube.com/shorts/CYTgd1VehDc?si=o0VVtJ8DJ2PpIXBI",
  //   viewMode: "V",
  // ),
  // const ReelModel(
  //   state: "Y",
  //   video: "https://youtube.com/shorts/CYTgd1VehDc?si=o0VVtJ8DJ2PpIXBI",
  //   viewMode: "H",
  // ),
  // const ReelModel(
  //   state: "Y",
  //   video: "https://www.youtube.com/watch?v=cxAgxyFuwMs",
  //   viewMode: "H",
  // ),
];

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
    _reelsBloc!.add(ReelsEvent.getListMultiReels(lsReel));
  }

  double calculateFullScreenScale(Size screenSize, Size videoSize) {
    final screenAspectRatio = screenSize.width / screenSize.height;
    final videoAspectRatio = videoSize.width / videoSize.height;

    if (videoAspectRatio > screenAspectRatio) {
      return screenSize.height / videoSize.height;
    } else {
      return screenSize.width / videoSize.width;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReelsBloc, ReelsState>(builder: (context, state) {
      return Scaffold(
        body: LayoutBuilder(builder: (context, contranst) {
          return PageView.builder(
            controller: state.pageControllerMedia,
            allowImplicitScrolling: true,
            scrollDirection: Axis.vertical,
            itemCount: state.lsReel.length,
            itemBuilder: (context, index) {
              return index == state.currentVideo
                  ? state.videoController![index] != null
                      ? ValueListenableBuilder(
                          valueListenable: state.videoController![index]!,
                          builder:
                              (context, VideoPlayerValue valueVideo, child) {
                            return valueVideo.isPlaying
                                ? SizedBox(
                                    height: contranst.maxHeight,
                                    width: contranst.maxWidth,
                                    child: state.lsReel[index].viewMode == 'H'
                                        ? LMHVideo(
                                            controller:
                                                state.videoController![index]!,
                                            valueVideo: valueVideo,
                                          )
                                        : LMVVideo(
                                            valueVideo: valueVideo,
                                            controller:
                                                state.videoController![index]!),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: state.lsReel[index].imageUrl);
                          })
                      : CachedNetworkImage(
                          imageUrl: state.lsReel[index].imageUrl)
                  : CachedNetworkImage(imageUrl: state.lsReel[index].imageUrl);
            },
            onPageChanged: (value) {
              _reelsBloc!.add(ReelsEvent.onChangeReel(value));
            },
          );
        }),
      );
    });
  }
}

class LMVVideo extends StatelessWidget {
  const LMVVideo({
    super.key,
    required this.valueVideo,
    required this.controller,
  });
  final VideoPlayerValue valueVideo;
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: valueVideo.size.width,
              height: valueVideo.size.height,
              child: VideoPlayer(controller),
            ),
          ),
        ),
      ],
    );
  }
}

class LMHVideo extends StatelessWidget {
  const LMHVideo({
    super.key,
    required this.controller,
    required this.valueVideo,
  });

  final VideoPlayerController controller;
  final VideoPlayerValue valueVideo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AspectRatio(
          aspectRatio: valueVideo.aspectRatio,
          child: Stack(
            alignment: Alignment.center,
            children: [
              VideoPlayer(controller),
            ],
          ),
        ),
        ItemRotation(
          orientaion: () {},
        )
      ],
    );
  }
}

class ItemRotation extends StatelessWidget {
  final Function? orientaion;
  const ItemRotation({super.key, required this.orientaion});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        orientaion!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withOpacity(0.1),
        ),
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.screen_rotation,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 5),
            Text('rotate'),
          ],
        ),
      ),
    );
  }
}
