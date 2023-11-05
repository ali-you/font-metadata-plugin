package com.example.font_metadata

import FontMetadata
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FontMetadataPlugin */
class FontMetadataPlugin : FlutterPlugin, MethodCallHandler {

    private val channelName = "alibahareh.flutter.plugins.fontmetadata/channel"

    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, channelName)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getFontName") {
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
            val path: String? = call.argument("path")
            val name: String? = FontMetadata().getFontName(filePath = path) ?: ""
            result.success(name)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
