package com.example.media_reels

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.util.Log
import android.webkit.MimeTypeMap
import android.widget.Toast
import androidx.activity.result.PickVisualMediaRequest
import androidx.activity.result.contract.ActivityResultContracts
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.example.media_reels.ImagePicker.ImagePicker
import com.example.media_reels.ImagePicker.ImagePicker.Companion
import com.example.media_reels.VideoPlayerPr.VideoPlayerFactory
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream
import java.io.IOException
import java.io.InputStream
import java.io.OutputStream


class MainActivity : FlutterFragmentActivity() {
    private lateinit var methodChannelResult: MethodChannel.Result
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "iamgePickerPlatform")
        methodChannel.setMethodCallHandler { call, result ->
            methodChannelResult = result
            when (call.method) {
                "pickImage" -> {
                    if (Build.VERSION.SDK_INT >= 30) {
                        launchNewPhotoPicker()
                    } else {
                        if (allPermissionsGranted()) {
                            launchOldPhotoPicker()
                        } else {
                            ActivityCompat.requestPermissions(
                                this, REQUIRED_PERMISSIONS,
                                REQUEST_CODE_PERMISSIONS
                            )
                        }
                    }
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory(
                "videoplayer",
                VideoPlayerFactory(this, flutterEngine.dartExecutor.binaryMessenger)
            )
    }

    private fun allPermissionsGranted() = REQUIRED_PERMISSIONS.all {
        ContextCompat.checkSelfPermission(
            this, it
        ) == PackageManager.PERMISSION_GRANTED
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_CODE_PERMISSIONS) {
            if (allPermissionsGranted()) {
                launchOldPhotoPicker()
            } else {
                Toast.makeText(this, "Permission not granted by the user.", Toast.LENGTH_SHORT)
                    .show()
                finish()
            }
        }
    }

    companion object {
        private const val REQUEST_CODE_PERMISSIONS = 10
        private val REQUIRED_PERMISSIONS =
            mutableMapOf(android.Manifest.permission.READ_EXTERNAL_STORAGE to 1).keys.toTypedArray()
    }

    private val newPhotoPicker =
        registerForActivityResult(ActivityResultContracts.PickMultipleVisualMedia(10)) { uris: List<Uri>? ->
            if (uris.isNullOrEmpty()) {
                methodChannelResult.error("NO_IMAGES", "No images were selected", null)
            } else {
                val imageList = uris.map { uri ->
                    val result = fileFromContentUri(this, uri)
                    mapOf(
                        "url" to result.absolutePath,
                        "width" to 100, // Replace with actual image width if needed
                        "height" to 100 // Replace with actual image height if needed
                    )
                }
                methodChannelResult.success(imageList)
            }
        }

    private fun launchNewPhotoPicker() {
        try {
            newPhotoPicker.launch(PickVisualMediaRequest(ActivityResultContracts.PickVisualMedia.ImageOnly))
        } catch (e: Exception) {
            Log.e("error --->", "$e")
        }
    }

    private fun launchOldPhotoPicker() {
        val intent = Intent(Intent.ACTION_GET_CONTENT)
        intent.addCategory(Intent.CATEGORY_OPENABLE)
        intent.type = "image/*"
        resultLauncher.launch(intent)
    }

    private var resultLauncher =
        registerForActivityResult(ActivityResultContracts.StartActivityForResult()) { result ->
            if (result.resultCode == Activity.RESULT_OK) {
                var uri = result.data!!.data
                methodChannelResult.success(uri.toString())
            }
        }

    private fun fileFromContentUri(context: Context, contentUri: Uri): File {
        val fileName = getFileNameFromUri(context, contentUri) ?: "temporary_file"
        val fileExtension = getFileExtension(context, contentUri)
        val tempFile = File(
            context.cacheDir,
            "$fileName${if (fileExtension != null) ".$fileExtension" else ""}"
        )

        tempFile.createNewFile()

        try {
            val oStream = FileOutputStream(tempFile)
            val inputStream = context.contentResolver.openInputStream(contentUri)

            inputStream?.let {
                copy(inputStream, oStream)
            }

            oStream.flush()
        } catch (e: Exception) {
            e.printStackTrace()
        }

        return tempFile
    }

    private fun getFileExtension(context: Context, uri: Uri): String? {
        val fileType: String? = context.contentResolver.getType(uri)
        return MimeTypeMap.getSingleton().getExtensionFromMimeType(fileType)
    }

    private fun getFileNameFromUri(context: Context, uri: Uri): String? {
        var fileName: String? = null
        val cursor = context.contentResolver.query(uri, null, null, null, null)
        cursor?.use {
            if (it.moveToFirst()) {
                fileName = it.getString(it.getColumnIndexOrThrow("_display_name"))
            }
        }
        return fileName
    }

    @Throws(IOException::class)
    private fun copy(source: InputStream, target: OutputStream) {
        val buf = ByteArray(8192)
        var length: Int
        while (source.read(buf).also { length = it } > 0) {
            target.write(buf, 0, length)
        }
    }
}
