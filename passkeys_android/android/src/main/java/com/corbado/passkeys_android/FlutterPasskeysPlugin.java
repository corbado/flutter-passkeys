package com.corbado.passkeys_android;

import android.app.Activity;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Log;

import androidx.annotation.NonNull;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class FlutterPasskeysPlugin extends FlutterActivity implements FlutterPlugin, ActivityAware {
    private static final String TAG = "MainActivity";
    private BinaryMessenger binaryMessenger;
    private Activity activity;

    public FlutterPasskeysPlugin() {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE FlutterPasskeysPlugin constructor called");
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onAttachedToEngine called");
        binaryMessenger = binding.getBinaryMessenger();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onDetachedFromEngine called");
        binaryMessenger = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onAttachedToActivity called");
        activity = binding.getActivity();
        Messages.PasskeysApi.setup(binaryMessenger, new MessageHandler(this));
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onDetachedFromActivityForConfigChanges called");
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onReattachedToActivityForConfigChanges called");
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        Log.e(TAG, "HEEEEEEEEEEEEEEEEEEEEEEEEEE onDetachedFromActivity called");
        activity = null;
    }

    public Activity getCustomActivity() {
        return activity;
    }
}