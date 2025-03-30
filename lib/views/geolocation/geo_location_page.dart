import 'package:flutter/material.dart';
import 'package:media_reels/core/app_channel.dart';

class GeoLocationPage extends StatefulWidget {
  const GeoLocationPage({super.key});

  @override
  State<GeoLocationPage> createState() => _GeoLocationPageState();
}

class _GeoLocationPageState extends State<GeoLocationPage> {
  Future<void> requestLocationPermission() async {
    await methodChannel.invokeMethod(methodPermissionGeoLocation);
  }

  Future<void> getCurrentLocation() async {
    final result = await methodChannel.invokeMethod(methodGETGEOLOCATION);
    if (result != null) {
      print(
          "Latitude: ${result['latitude']}, Longitude: ${result['longitude']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              requestLocationPermission();
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
          ),
          GestureDetector(
            onTap: () {
              getCurrentLocation();
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
