import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/bloc/reels_bloc/reels_bloc.dart';
import 'package:media_reels/core/log/log.dart';
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
        'https://cfvod.livemalltv.com/dev/HLS/test.m3u8'));
  }

  // Tính toán tỷ lệ để video chiếm toàn bộ màn hình
  double calculateFullScreenScale(Size screenSize, Size videoSize) {
    final screenAspectRatio = screenSize.width / screenSize.height;
    final videoAspectRatio = videoSize.width / videoSize.height;

    // Nếu video rộng hơn màn hình, scale dựa trên chiều cao, ngược lại scale theo chiều rộng
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
          return Container(
            alignment: Alignment.center,
            child: state.controllerVideo != null
                ? ValueListenableBuilder(
                    valueListenable: state.controllerVideo!,
                    builder: (context, VideoPlayerValue value, child) {
                      final screenSize = MediaQuery.of(context).size;
                      final videoSize = value.size;
                      // final scale =
                      //     calculateFullScreenScale(screenSize, videoSize);
                      // Log.error("max $scale");

                      final scaleW = contranst.maxWidth / value.size.width;
                      final scaleH = contranst.maxHeight / value.size.height;

                      final resultV =
                          (contranst.maxHeight / contranst.maxWidth);
                      final resultH =
                          (contranst.maxWidth / contranst.maxHeight);

                      Log.error("max $scaleW");
                      // Log.error("max $");
                      Log.error(scaleH / scaleW);
                      return Stack(
                        children: <Widget>[
                          SizedBox.expand(
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: value.size.width,
                                height: value.size.height,
                                child: VideoPlayer(state.controllerVideo!),
                              ),
                            ),
                          ),
                          //FURTHER IMPLEMENTATION
                        ],
                      );
                      return SizedBox(
                        height: contranst.maxHeight,
                        width: contranst.maxWidth,
                        child: VideoPlayer(state.controllerVideo!),
                      );
                      // return AspectRatio(
                      //   aspectRatio: value.aspectRatio,
                      //   child: VideoPlayer(state.controllerVideo!),
                      // );
                      return Center(
                        child: Transform.scale(
                          scale: scaleH / scaleW,
                          child: AspectRatio(
                            aspectRatio: value.aspectRatio,
                            child: VideoPlayer(state.controllerVideo!),
                          ),
                        ),
                      );
                      return AspectRatio(
                        aspectRatio: value.aspectRatio,
                        child: VideoPlayer(state.controllerVideo!),
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        }),
      );
    });
  }
}
