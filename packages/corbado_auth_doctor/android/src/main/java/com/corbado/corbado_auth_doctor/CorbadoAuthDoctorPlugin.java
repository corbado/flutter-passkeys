package com.corbado.corbado_auth_doctor;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;
import android.util.Base64;

import androidx.annotation.NonNull;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

/** CorbadoAuthDoctorPlugin */
public class CorbadoAuthDoctorPlugin implements FlutterPlugin, WebCredentialsApi.WebCredentialsApiInterface {

  private Context applicationContext;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    applicationContext = flutterPluginBinding.getApplicationContext();

    WebCredentialsApi.WebCredentialsApiInterface.setUp(flutterPluginBinding.getBinaryMessenger(), this);
  }

  public WebCredentialsApi.DomainsResult getWebCredentialsDomains() {
    // 1) Gather all your SHA-256 fingerprints into a plain List<String>
    List<String> fps = new ArrayList<>();
    try {
      PackageManager pm = applicationContext.getPackageManager();
      PackageInfo pkgInfo;
      Signature[] sigs;

      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
        pkgInfo = pm.getPackageInfo(
                applicationContext.getPackageName(),
                PackageManager.GET_SIGNING_CERTIFICATES
        );
        sigs = pkgInfo.signingInfo.getApkContentsSigners();
      } else {
        pkgInfo = pm.getPackageInfo(
                applicationContext.getPackageName(),
                PackageManager.GET_SIGNATURES
        );
        //noinspection deprecation
        sigs = pkgInfo.signatures;
      }

      // Use SHA-256 now
      MessageDigest md = MessageDigest.getInstance("SHA-256");
      for (Signature sig : sigs) {
        byte[] digest = md.digest(sig.toByteArray());
        // Convert to uppercase hex with colons
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < digest.length; i++) {
          sb.append(String.format("%02X", digest[i]));
          if (i < digest.length - 1) {
            sb.append(':');
          }
        }
        fps.add(sb.toString());
      }
    } catch (Exception e) {
      e.printStackTrace();
      // You might choose to return an empty list or include error info
    }

    // 2) Wrap it in DomainsResult via the generated Builder
    return new WebCredentialsApi.DomainsResult.Builder()
            .setDomains(fps)
            .build();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    WebCredentialsApi.WebCredentialsApiInterface.setUp(binding.getBinaryMessenger(), null);
  }
}
