import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'link': 'video link',
      'duration': '1000'
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('video player'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SizedBox(
            height: 400,
            child: UiKitView(
              viewType: 'videoplayer',
              creationParams: creationParams,
              creationParamsCodec: const StandardMessageCodec(),
            ),
          ),
        ),
      ),
    );
  }
}
