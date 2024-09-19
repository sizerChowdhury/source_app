package com.example.source_app

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.embedding.engine.FlutterEngine

import ExampleHostApi
import FlutterError

class PigeonApiImplementation(private val context: Context) : ExampleHostApi {
    override fun getHostLanguage(): String {
        return "Kotlin"
    }

    override fun sendMessage(message: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse("example://destination?message=$message"))
        intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
        context.startActivity(intent)
    }

}

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val binaryMessenger: BinaryMessenger = flutterEngine.dartExecutor.binaryMessenger

        ExampleHostApi.setUp(binaryMessenger, PigeonApiImplementation(this))

    }


}
