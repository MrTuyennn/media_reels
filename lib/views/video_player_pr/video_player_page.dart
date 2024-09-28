import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  static const platform = MethodChannel('actionVideo');
  static const platformPicker = MethodChannel('iamgePickerPlatform');

  @override
  void initState() {
    super.initState();
    // Listen for status changes
    platform.setMethodCallHandler((call) async {
      if (call.method == 'videoStatusChanged') {
        final status = call.arguments as String;
        // Handle your status update (play/pause) here
        print('Video status changed: $status');
      }
    });
  }

  List<Map<String, dynamic>> imagesInfo = [];

  Future<void> pickImages() async {
    try {
      final List<dynamic> result =
          await platformPicker.invokeMethod('pickImage');
      if (result.isNotEmpty) {
        setState(() {
          imagesInfo = List<Map<String, dynamic>>.from(
              result.map((image) => Map<String, dynamic>.from(image)));
        });
      }
    } on PlatformException catch (e) {
      print("Failed to pick images: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> creationParams = <String, dynamic>{
      'link':
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('video player'),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.primary,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: Platform.isIOS
                  ? UiKitView(
                      viewType: 'videoplayer',
                      creationParams: creationParams,
                      creationParamsCodec: const StandardMessageCodec(),
                    )
                  : AndroidView(
                      viewType: 'videoplayer',
                      layoutDirection: TextDirection.ltr,
                      creationParams: creationParams,
                      creationParamsCodec: const StandardMessageCodec(),
                    ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  await platform.invokeMethod('play');
                } on PlatformException catch (e) {
                  print("Failed to play video: ${e.message}");
                }
              },
              child: const Text("Play"),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  await platform.invokeMethod('pause');
                } on PlatformException catch (e) {
                  print("Failed to play video: ${e.message}");
                }
              },
              child: const Text("Pause"),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  pickImages();
                } on PlatformException catch (e) {
                  print("Failed to play video: ${e.message}");
                }
              },
              child: const Text("image"),
            ),
            if (imagesInfo.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: imagesInfo.length,
                  itemBuilder: (context, index) {
                    final imageInfo = imagesInfo[index];
                    print(imageInfo['url']);
                    return Column(
                      children: [
                        Image.file(File(Uri.parse(imageInfo['url']).path)),
                        Text('Image URL: ${imageInfo['url']}'),
                        Text('Width: ${imageInfo['width'].toStringAsFixed(2)}'),
                        Text(
                            'Height: ${imageInfo['height'].toStringAsFixed(2)}'),
                      ],
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
