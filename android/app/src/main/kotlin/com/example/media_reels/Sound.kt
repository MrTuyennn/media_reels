package com.example.media_reelsimport android.app.Activityimport android.media.MediaPlayerimport androidx.appcompat.app.AppCompatActivityimport io.flutter.plugin.common.BinaryMessengerimport io.flutter.plugin.common.MethodChannelclass Sound(private val activity: Activity, private val binaryMessenger: BinaryMessenger) : AppCompatActivity() {    private var player: MediaPlayer? = null    private val methodChannel: MethodChannel = MethodChannel(binaryMessenger, "actionSong")    init {        setupMediaPlayer()        setupMethodChannel()    }    private fun setupMediaPlayer() {        player = MediaPlayer.create(activity, R.raw.song)        player?.setOnCompletionListener {            stopMediaPlayer()        }        player?.setOnErrorListener { _, what, extra ->            stopMediaPlayer()            true        }    }    private fun playSong() {        if (player == null) {            setupMediaPlayer()        }        player?.let {            if (!it.isPlaying) {                it.start()            } else {                // Handle if the song is already playing            }        }    }    private fun pauseSong() {        player?.let {            if (it.isPlaying) {                it.pause()            }        }    }    private fun stopMediaPlayer() {        player?.let {            if (it.isPlaying) {                it.stop()            }            it.reset()        }    }    private fun releasePlayer() {        player?.release()        player = null    }    private fun setupMethodChannel() {        methodChannel.setMethodCallHandler { call, result ->            when (call.method) {                "playSong" -> {                    playSong()                    result.success(null)                }                "pauseSong" -> {                    pauseSong()                    result.success(null)                }                "releaseSong" -> {                    releasePlayer()                    result.success(null)                }                else -> {                    result.notImplemented()                }            }        }    }}