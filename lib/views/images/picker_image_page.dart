import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PickerImagePage extends StatefulWidget {
  const PickerImagePage({super.key});

  @override
  State<PickerImagePage> createState() => _PickerImagePageState();
}

class _PickerImagePageState extends State<PickerImagePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  static const platformPicker = MethodChannel('iamgePickerPlatform');

  List<Map<String, dynamic>> imagesInfo = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  Future<void> pickImages() async {
    try {
      final List<dynamic> result = await platformPicker.invokeMethod('pickImage');
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
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image picker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              onTap: () async {
                try {
                  pickImages();
                } on PlatformException catch (e) {
                  print("Failed to play video: ${e.message}");
                }
              },
              child: const Text("image"),
            ),
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
                      Text('Height: ${imageInfo['height'].toStringAsFixed(2)}'),
                    ],
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
