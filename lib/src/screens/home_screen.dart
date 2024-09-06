import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_bloc.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_event.dart';
import 'package:media_reels/src/bloc/theme_bloc/theme_state.dart';
import 'package:media_reels/src/models/user/user.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          'http://172.16.0.118:8888/mystream/index.m3u8',
        ),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      })
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (BlocProvider.of<ThemeBloc>(context).state.themeMode ==
                ThemeModeLM.light) {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeMode(themeMode: ThemeModeLM.dark));
            } else {
              context
                  .read<ThemeBloc>()
                  .add(ChangeThemeMode(themeMode: ThemeModeLM.light));
            }
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        ),
      ),
    );
  }
}
