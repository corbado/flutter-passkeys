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
    private static final String CHANNEL = "corbado.com/passkeys";
    private MethodChannel channel;
    private BinaryMessenger binaryMessenger;
    private Activity activity;

    public String getSigningCertFingerprint(Activity context, String key) {
        Signature[] signs;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                signs = context.getPackageManager().getPackageInfo(context.getPackageName(),
                        PackageManager.GET_SIGNING_CERTIFICATES).signingInfo.getApkContentsSigners();
            } else {
                signs = context.getPackageManager().getPackageInfo(context.getPackageName(),
                        PackageManager.GET_SIGNATURES).signatures;
            }
            if (signs.length == 0) {
                return null;
            }

            MessageDigest md = MessageDigest.getInstance(key);
            md.update(signs[0].toByteArray());
            byte[] digest = md.digest();
            StringBuilder toRet = new StringBuilder();
            for (int x = 0; x < digest.length; x++) {
                toRet.append(String.format("%02x", digest[x]).toUpperCase());
                if (x < digest.length - 1) {
                    toRet.append(":");
                }
            }
            return toRet.toString();
        } catch (PackageManager.NameNotFoundException | NoSuchAlgorithmException e) {
            Log.e(TAG, "Exception occurred while obtaining signature " + e.getMessage());
            return null;
        }
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        binaryMessenger = binding.getBinaryMessenger();
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
        Messages.PasskeysApi.setup(binaryMessenger, new MessageHandler(activity));
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        activity = binding.getActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        activity = null;
    }


}