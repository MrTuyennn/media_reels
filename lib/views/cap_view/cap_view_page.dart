import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CapViewPage extends StatefulWidget {
  const CapViewPage({super.key});

  @override
  State<CapViewPage> createState() => _CapViewPageState();
}

class _CapViewPageState extends State<CapViewPage> {
  static const platform = MethodChannel('iamgePickerPlatform');

  final GlobalKey _globalKey = GlobalKey();

  Future<void> captureView() async {
    try {
      // Trigger native code to capture the view
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage();
      final byteData = await image.toByteData(format: ImageByteFormat.png);

      // Send image bytes to native for saving
      await platform.invokeMethod('captureView', {
        'imageBytes': byteData?.buffer.asUint8List(), // ByteArray
      });
    } on PlatformException catch (e) {
      print("Failed to capture view: ${e.message}");
    }
  }

  Future<void> pickerImage() async {
    try {
      // Send image bytes to native for saving
      await platform.invokeMethod('pickImage');
    } on PlatformException catch (e) {
      print("Failed to capture view: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capture View Example')),
      body: Column(
        children: [
          RepaintBoundary(
            key: _globalKey,
            child: Container(
              height: 200,
              width: double.infinity,
              color: Colors.blue,
              child: Column(
                children: [
                  const Text(
                    'This is the view to capture',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/wheel.png'))),
                  )
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: captureView,
            child: const Text("Capture View"),
          ),
          ElevatedButton(
            onPressed: pickerImage,
            child: const Text("Capture View"),
          ),
        ],
      ),
    );
  }
}
