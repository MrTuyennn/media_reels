package com.example.media_reels

import com.example.media_reels.VideoPlayerPr.VideoPlayerFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("videoplayer",
                VideoPlayerFactory(activity))
    }
}
