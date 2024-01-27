package com.falcon.has_audio

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.media.MediaMetadataRetriever

class HasAudioPlugin: FlutterPlugin, MethodCallHandler {

  private lateinit var channel : MethodChannel
  private val CHANNEL = "com.falcon.has_audio"


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "hasAudio") {
      val videoPath = call.argument<String>("videoPath")
      val hasAudio = videoPath?.let { checkAudioTrack(it) } ?: false
      result.success(hasAudio)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun checkAudioTrack(videoPath: String): Boolean {
    val retriever = MediaMetadataRetriever()
    retriever.setDataSource(videoPath)
    val hasAudioStr = retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_HAS_AUDIO)
    retriever.release()
    return "yes" == hasAudioStr
  }

}
