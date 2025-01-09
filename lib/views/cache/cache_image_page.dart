import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CacheImagePage extends StatefulWidget {
  const CacheImagePage({super.key});

  @override
  State<CacheImagePage> createState() => _CacheImagePageState();
}

class _CacheImagePageState extends State<CacheImagePage> {
  final String imageUrl =
      'https://cfimg.letsgostage.com/live_dev/userphoto/u240222064502944-001/u240222064502944-001.jpg';

  Future<File?> _fetchImage({bool refresh = false}) async {
    // if (refresh) {
    //   await CustomCacheManager.instance.removeFile(imageUrl);
    // }
    // final urlWithTimestamp =
    //     '$imageUrl?timestamp=${DateTime.now().millisecondsSinceEpoch}';
    final fileInfo = await CustomCacheManager._instance.getSingleFile(imageUrl);
    return fileInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache image'),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            cacheManager:
                CustomCacheManager(), // Sử dụng CacheManager tùy chỉnh
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          // GestureDetector(
          //   onTap: () {
          //     setState(() {
          //       _fetchImage(refresh: true);
          //     });
          //   },
          //   child: Container(
          //     height: 100,
          //     width: 100,
          //     color: Colors.amber,
          //   ),
          // )
        ],
      ),
    );
  }
}

class CustomCacheManager extends CacheManager {
  static const key = 'customCache';

  static final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._()
      : super(
          Config(
            key,
            stalePeriod:
                const Duration(seconds: 20), // Thời gian cache là 1 ngày
            maxNrOfCacheObjects: 100, // Giới hạn số lượng file cache
          ),
        );
}
