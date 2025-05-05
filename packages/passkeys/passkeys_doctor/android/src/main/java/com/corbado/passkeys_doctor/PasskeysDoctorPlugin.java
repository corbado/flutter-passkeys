package packages.passkeys.passkeys_doctor.android.src.main.java.com.corbado.passkeys_doctor;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.os.Build;

import androidx.annotation.NonNull;

import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

import io.flutter.embedding.engine.plugins.FlutterPlugin;

/** CorbadoAuthDoctorPlugin */
public class PasskeysDoctorPlugin implements FlutterPlugin, Messages.WebCredentialsApi {

  private Context applicationContext;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    applicationContext = flutterPluginBinding.getApplicationContext();

    Messages.WebCredentialsApi.setUp(flutterPluginBinding.getBinaryMessenger(), this);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    Messages.WebCredentialsApi.setUp(binding.getBinaryMessenger(), null);
  }

  @NonNull
  @Override
  public List<String> getFingerprints() {
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
        sigs = pkgInfo.signatures;
      }

      MessageDigest md = MessageDigest.getInstance("SHA-256");
      for (Signature sig : sigs) {
        byte[] digest = md.digest(sig.toByteArray());
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
      throw new Messages.FlutterError(String.valueOf(e.hashCode()), e.toString(), e);
    }

    return fps;
  }
}
