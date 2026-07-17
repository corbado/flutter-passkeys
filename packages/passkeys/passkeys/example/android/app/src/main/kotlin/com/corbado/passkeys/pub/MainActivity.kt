package com.corbado.passkeys.pub

import android.content.Intent
import android.os.Build
import android.provider.Settings
import androidx.core.net.toUri
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.example.passkeys/settings"
        ).setMethodCallHandler { call, result ->
            if (call.method == "openCredentialProviderSettings") {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.VANILLA_ICE_CREAM) {
                    val intent = Intent(Settings.ACTION_CREDENTIAL_PROVIDER).apply {
                        data = "package:${packageName}".toUri()
                        addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    }
                    startActivity(intent)
                    result.success(true)
                } else {
                    // Fallback: open general settings on older Android
                    startActivity(Intent(Settings.ACTION_SETTINGS))
                    result.success(false)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
