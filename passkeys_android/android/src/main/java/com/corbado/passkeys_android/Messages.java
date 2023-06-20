// Autogenerated from Pigeon (v10.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.corbado.passkeys_android;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression", "serial"})
public class Messages {

  /** Error class for passing custom error details to Flutter via a thrown PlatformException. */
  public static class FlutterError extends RuntimeException {

    /** The error code. */
    public final String code;

    /** The error details. Must be a datatype supported by the api codec. */
    public final Object details;

    public FlutterError(@NonNull String code, @Nullable String message, @Nullable Object details) 
    {
      super(message);
      this.code = code;
      this.details = details;
    }
  }

  @NonNull
  protected static ArrayList<Object> wrapError(@NonNull Throwable exception) {
    ArrayList<Object> errorList = new ArrayList<Object>(3);
    if (exception instanceof FlutterError) {
      FlutterError error = (FlutterError) exception;
      errorList.add(error.code);
      errorList.add(error.getMessage());
      errorList.add(error.details);
    } else {
      errorList.add(exception.toString());
      errorList.add(exception.getClass().getSimpleName());
      errorList.add(
        "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    }
    return errorList;
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class RelyingParty {
    private @NonNull String name;

    public @NonNull String getName() {
      return name;
    }

    public void setName(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"name\" is null.");
      }
      this.name = setterArg;
    }

    private @NonNull String id;

    public @NonNull String getId() {
      return id;
    }

    public void setId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"id\" is null.");
      }
      this.id = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    RelyingParty() {}

    public static final class Builder {

      private @Nullable String name;

      public @NonNull Builder setName(@NonNull String setterArg) {
        this.name = setterArg;
        return this;
      }

      private @Nullable String id;

      public @NonNull Builder setId(@NonNull String setterArg) {
        this.id = setterArg;
        return this;
      }

      public @NonNull RelyingParty build() {
        RelyingParty pigeonReturn = new RelyingParty();
        pigeonReturn.setName(name);
        pigeonReturn.setId(id);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(2);
      toListResult.add(name);
      toListResult.add(id);
      return toListResult;
    }

    static @NonNull RelyingParty fromList(@NonNull ArrayList<Object> list) {
      RelyingParty pigeonResult = new RelyingParty();
      Object name = list.get(0);
      pigeonResult.setName((String) name);
      Object id = list.get(1);
      pigeonResult.setId((String) id);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class PubKeyCredParam {
    private @NonNull String type;

    public @NonNull String getType() {
      return type;
    }

    public void setType(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"type\" is null.");
      }
      this.type = setterArg;
    }

    private @NonNull Long alg;

    public @NonNull Long getAlg() {
      return alg;
    }

    public void setAlg(@NonNull Long setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"alg\" is null.");
      }
      this.alg = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    PubKeyCredParam() {}

    public static final class Builder {

      private @Nullable String type;

      public @NonNull Builder setType(@NonNull String setterArg) {
        this.type = setterArg;
        return this;
      }

      private @Nullable Long alg;

      public @NonNull Builder setAlg(@NonNull Long setterArg) {
        this.alg = setterArg;
        return this;
      }

      public @NonNull PubKeyCredParam build() {
        PubKeyCredParam pigeonReturn = new PubKeyCredParam();
        pigeonReturn.setType(type);
        pigeonReturn.setAlg(alg);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(2);
      toListResult.add(type);
      toListResult.add(alg);
      return toListResult;
    }

    static @NonNull PubKeyCredParam fromList(@NonNull ArrayList<Object> list) {
      PubKeyCredParam pigeonResult = new PubKeyCredParam();
      Object type = list.get(0);
      pigeonResult.setType((String) type);
      Object alg = list.get(1);
      pigeonResult.setAlg((alg == null) ? null : ((alg instanceof Integer) ? (Integer) alg : (Long) alg));
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class User {
    private @NonNull String displayName;

    public @NonNull String getDisplayName() {
      return displayName;
    }

    public void setDisplayName(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"displayName\" is null.");
      }
      this.displayName = setterArg;
    }

    private @NonNull String name;

    public @NonNull String getName() {
      return name;
    }

    public void setName(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"name\" is null.");
      }
      this.name = setterArg;
    }

    private @NonNull String id;

    public @NonNull String getId() {
      return id;
    }

    public void setId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"id\" is null.");
      }
      this.id = setterArg;
    }

    private @Nullable String icon;

    public @Nullable String getIcon() {
      return icon;
    }

    public void setIcon(@Nullable String setterArg) {
      this.icon = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    User() {}

    public static final class Builder {

      private @Nullable String displayName;

      public @NonNull Builder setDisplayName(@NonNull String setterArg) {
        this.displayName = setterArg;
        return this;
      }

      private @Nullable String name;

      public @NonNull Builder setName(@NonNull String setterArg) {
        this.name = setterArg;
        return this;
      }

      private @Nullable String id;

      public @NonNull Builder setId(@NonNull String setterArg) {
        this.id = setterArg;
        return this;
      }

      private @Nullable String icon;

      public @NonNull Builder setIcon(@Nullable String setterArg) {
        this.icon = setterArg;
        return this;
      }

      public @NonNull User build() {
        User pigeonReturn = new User();
        pigeonReturn.setDisplayName(displayName);
        pigeonReturn.setName(name);
        pigeonReturn.setId(id);
        pigeonReturn.setIcon(icon);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(4);
      toListResult.add(displayName);
      toListResult.add(name);
      toListResult.add(id);
      toListResult.add(icon);
      return toListResult;
    }

    static @NonNull User fromList(@NonNull ArrayList<Object> list) {
      User pigeonResult = new User();
      Object displayName = list.get(0);
      pigeonResult.setDisplayName((String) displayName);
      Object name = list.get(1);
      pigeonResult.setName((String) name);
      Object id = list.get(2);
      pigeonResult.setId((String) id);
      Object icon = list.get(3);
      pigeonResult.setIcon((String) icon);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class AllowCredential {
    private @NonNull String type;

    public @NonNull String getType() {
      return type;
    }

    public void setType(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"type\" is null.");
      }
      this.type = setterArg;
    }

    private @NonNull String id;

    public @NonNull String getId() {
      return id;
    }

    public void setId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"id\" is null.");
      }
      this.id = setterArg;
    }

    private @NonNull List<String> transports;

    public @NonNull List<String> getTransports() {
      return transports;
    }

    public void setTransports(@NonNull List<String> setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"transports\" is null.");
      }
      this.transports = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    AllowCredential() {}

    public static final class Builder {

      private @Nullable String type;

      public @NonNull Builder setType(@NonNull String setterArg) {
        this.type = setterArg;
        return this;
      }

      private @Nullable String id;

      public @NonNull Builder setId(@NonNull String setterArg) {
        this.id = setterArg;
        return this;
      }

      private @Nullable List<String> transports;

      public @NonNull Builder setTransports(@NonNull List<String> setterArg) {
        this.transports = setterArg;
        return this;
      }

      public @NonNull AllowCredential build() {
        AllowCredential pigeonReturn = new AllowCredential();
        pigeonReturn.setType(type);
        pigeonReturn.setId(id);
        pigeonReturn.setTransports(transports);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(3);
      toListResult.add(type);
      toListResult.add(id);
      toListResult.add(transports);
      return toListResult;
    }

    static @NonNull AllowCredential fromList(@NonNull ArrayList<Object> list) {
      AllowCredential pigeonResult = new AllowCredential();
      Object type = list.get(0);
      pigeonResult.setType((String) type);
      Object id = list.get(1);
      pigeonResult.setId((String) id);
      Object transports = list.get(2);
      pigeonResult.setTransports((List<String>) transports);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class AuthenticatorSelection {
    private @NonNull String authenticatorAttachment;

    public @NonNull String getAuthenticatorAttachment() {
      return authenticatorAttachment;
    }

    public void setAuthenticatorAttachment(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"authenticatorAttachment\" is null.");
      }
      this.authenticatorAttachment = setterArg;
    }

    private @NonNull Boolean requireResidentKey;

    public @NonNull Boolean getRequireResidentKey() {
      return requireResidentKey;
    }

    public void setRequireResidentKey(@NonNull Boolean setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"requireResidentKey\" is null.");
      }
      this.requireResidentKey = setterArg;
    }

    private @NonNull String residentKey;

    public @NonNull String getResidentKey() {
      return residentKey;
    }

    public void setResidentKey(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"residentKey\" is null.");
      }
      this.residentKey = setterArg;
    }

    private @NonNull String userVerification;

    public @NonNull String getUserVerification() {
      return userVerification;
    }

    public void setUserVerification(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"userVerification\" is null.");
      }
      this.userVerification = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    AuthenticatorSelection() {}

    public static final class Builder {

      private @Nullable String authenticatorAttachment;

      public @NonNull Builder setAuthenticatorAttachment(@NonNull String setterArg) {
        this.authenticatorAttachment = setterArg;
        return this;
      }

      private @Nullable Boolean requireResidentKey;

      public @NonNull Builder setRequireResidentKey(@NonNull Boolean setterArg) {
        this.requireResidentKey = setterArg;
        return this;
      }

      private @Nullable String residentKey;

      public @NonNull Builder setResidentKey(@NonNull String setterArg) {
        this.residentKey = setterArg;
        return this;
      }

      private @Nullable String userVerification;

      public @NonNull Builder setUserVerification(@NonNull String setterArg) {
        this.userVerification = setterArg;
        return this;
      }

      public @NonNull AuthenticatorSelection build() {
        AuthenticatorSelection pigeonReturn = new AuthenticatorSelection();
        pigeonReturn.setAuthenticatorAttachment(authenticatorAttachment);
        pigeonReturn.setRequireResidentKey(requireResidentKey);
        pigeonReturn.setResidentKey(residentKey);
        pigeonReturn.setUserVerification(userVerification);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(4);
      toListResult.add(authenticatorAttachment);
      toListResult.add(requireResidentKey);
      toListResult.add(residentKey);
      toListResult.add(userVerification);
      return toListResult;
    }

    static @NonNull AuthenticatorSelection fromList(@NonNull ArrayList<Object> list) {
      AuthenticatorSelection pigeonResult = new AuthenticatorSelection();
      Object authenticatorAttachment = list.get(0);
      pigeonResult.setAuthenticatorAttachment((String) authenticatorAttachment);
      Object requireResidentKey = list.get(1);
      pigeonResult.setRequireResidentKey((Boolean) requireResidentKey);
      Object residentKey = list.get(2);
      pigeonResult.setResidentKey((String) residentKey);
      Object userVerification = list.get(3);
      pigeonResult.setUserVerification((String) userVerification);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class RegisterResponse {
    private @NonNull String id;

    public @NonNull String getId() {
      return id;
    }

    public void setId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"id\" is null.");
      }
      this.id = setterArg;
    }

    private @NonNull String rawId;

    public @NonNull String getRawId() {
      return rawId;
    }

    public void setRawId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"rawId\" is null.");
      }
      this.rawId = setterArg;
    }

    private @NonNull String clientDataJSON;

    public @NonNull String getClientDataJSON() {
      return clientDataJSON;
    }

    public void setClientDataJSON(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"clientDataJSON\" is null.");
      }
      this.clientDataJSON = setterArg;
    }

    private @NonNull String attestationObject;

    public @NonNull String getAttestationObject() {
      return attestationObject;
    }

    public void setAttestationObject(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"attestationObject\" is null.");
      }
      this.attestationObject = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    RegisterResponse() {}

    public static final class Builder {

      private @Nullable String id;

      public @NonNull Builder setId(@NonNull String setterArg) {
        this.id = setterArg;
        return this;
      }

      private @Nullable String rawId;

      public @NonNull Builder setRawId(@NonNull String setterArg) {
        this.rawId = setterArg;
        return this;
      }

      private @Nullable String clientDataJSON;

      public @NonNull Builder setClientDataJSON(@NonNull String setterArg) {
        this.clientDataJSON = setterArg;
        return this;
      }

      private @Nullable String attestationObject;

      public @NonNull Builder setAttestationObject(@NonNull String setterArg) {
        this.attestationObject = setterArg;
        return this;
      }

      public @NonNull RegisterResponse build() {
        RegisterResponse pigeonReturn = new RegisterResponse();
        pigeonReturn.setId(id);
        pigeonReturn.setRawId(rawId);
        pigeonReturn.setClientDataJSON(clientDataJSON);
        pigeonReturn.setAttestationObject(attestationObject);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(4);
      toListResult.add(id);
      toListResult.add(rawId);
      toListResult.add(clientDataJSON);
      toListResult.add(attestationObject);
      return toListResult;
    }

    static @NonNull RegisterResponse fromList(@NonNull ArrayList<Object> list) {
      RegisterResponse pigeonResult = new RegisterResponse();
      Object id = list.get(0);
      pigeonResult.setId((String) id);
      Object rawId = list.get(1);
      pigeonResult.setRawId((String) rawId);
      Object clientDataJSON = list.get(2);
      pigeonResult.setClientDataJSON((String) clientDataJSON);
      Object attestationObject = list.get(3);
      pigeonResult.setAttestationObject((String) attestationObject);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static final class AuthenticateResponse {
    private @NonNull String id;

    public @NonNull String getId() {
      return id;
    }

    public void setId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"id\" is null.");
      }
      this.id = setterArg;
    }

    private @NonNull String rawId;

    public @NonNull String getRawId() {
      return rawId;
    }

    public void setRawId(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"rawId\" is null.");
      }
      this.rawId = setterArg;
    }

    private @NonNull String clientDataJSON;

    public @NonNull String getClientDataJSON() {
      return clientDataJSON;
    }

    public void setClientDataJSON(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"clientDataJSON\" is null.");
      }
      this.clientDataJSON = setterArg;
    }

    private @NonNull String authenticatorData;

    public @NonNull String getAuthenticatorData() {
      return authenticatorData;
    }

    public void setAuthenticatorData(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"authenticatorData\" is null.");
      }
      this.authenticatorData = setterArg;
    }

    private @NonNull String signature;

    public @NonNull String getSignature() {
      return signature;
    }

    public void setSignature(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"signature\" is null.");
      }
      this.signature = setterArg;
    }

    /** Constructor is non-public to enforce null safety; use Builder. */
    AuthenticateResponse() {}

    public static final class Builder {

      private @Nullable String id;

      public @NonNull Builder setId(@NonNull String setterArg) {
        this.id = setterArg;
        return this;
      }

      private @Nullable String rawId;

      public @NonNull Builder setRawId(@NonNull String setterArg) {
        this.rawId = setterArg;
        return this;
      }

      private @Nullable String clientDataJSON;

      public @NonNull Builder setClientDataJSON(@NonNull String setterArg) {
        this.clientDataJSON = setterArg;
        return this;
      }

      private @Nullable String authenticatorData;

      public @NonNull Builder setAuthenticatorData(@NonNull String setterArg) {
        this.authenticatorData = setterArg;
        return this;
      }

      private @Nullable String signature;

      public @NonNull Builder setSignature(@NonNull String setterArg) {
        this.signature = setterArg;
        return this;
      }

      public @NonNull AuthenticateResponse build() {
        AuthenticateResponse pigeonReturn = new AuthenticateResponse();
        pigeonReturn.setId(id);
        pigeonReturn.setRawId(rawId);
        pigeonReturn.setClientDataJSON(clientDataJSON);
        pigeonReturn.setAuthenticatorData(authenticatorData);
        pigeonReturn.setSignature(signature);
        return pigeonReturn;
      }
    }

    @NonNull
    ArrayList<Object> toList() {
      ArrayList<Object> toListResult = new ArrayList<Object>(5);
      toListResult.add(id);
      toListResult.add(rawId);
      toListResult.add(clientDataJSON);
      toListResult.add(authenticatorData);
      toListResult.add(signature);
      return toListResult;
    }

    static @NonNull AuthenticateResponse fromList(@NonNull ArrayList<Object> list) {
      AuthenticateResponse pigeonResult = new AuthenticateResponse();
      Object id = list.get(0);
      pigeonResult.setId((String) id);
      Object rawId = list.get(1);
      pigeonResult.setRawId((String) rawId);
      Object clientDataJSON = list.get(2);
      pigeonResult.setClientDataJSON((String) clientDataJSON);
      Object authenticatorData = list.get(3);
      pigeonResult.setAuthenticatorData((String) authenticatorData);
      Object signature = list.get(4);
      pigeonResult.setSignature((String) signature);
      return pigeonResult;
    }
  }

  public interface Result<T> {
    @SuppressWarnings("UnknownNullness")
    void success(T result);

    void error(@NonNull Throwable error);
  }

  private static class PasskeysApiCodec extends StandardMessageCodec {
    public static final PasskeysApiCodec INSTANCE = new PasskeysApiCodec();

    private PasskeysApiCodec() {}

    @Override
    protected Object readValueOfType(byte type, @NonNull ByteBuffer buffer) {
      switch (type) {
        case (byte) 128:
          return AllowCredential.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 129:
          return AuthenticateResponse.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 130:
          return AuthenticatorSelection.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 131:
          return PubKeyCredParam.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 132:
          return RegisterResponse.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 133:
          return RelyingParty.fromList((ArrayList<Object>) readValue(buffer));
        case (byte) 134:
          return User.fromList((ArrayList<Object>) readValue(buffer));
        default:
          return super.readValueOfType(type, buffer);
      }
    }

    @Override
    protected void writeValue(@NonNull ByteArrayOutputStream stream, Object value) {
      if (value instanceof AllowCredential) {
        stream.write(128);
        writeValue(stream, ((AllowCredential) value).toList());
      } else if (value instanceof AuthenticateResponse) {
        stream.write(129);
        writeValue(stream, ((AuthenticateResponse) value).toList());
      } else if (value instanceof AuthenticatorSelection) {
        stream.write(130);
        writeValue(stream, ((AuthenticatorSelection) value).toList());
      } else if (value instanceof PubKeyCredParam) {
        stream.write(131);
        writeValue(stream, ((PubKeyCredParam) value).toList());
      } else if (value instanceof RegisterResponse) {
        stream.write(132);
        writeValue(stream, ((RegisterResponse) value).toList());
      } else if (value instanceof RelyingParty) {
        stream.write(133);
        writeValue(stream, ((RelyingParty) value).toList());
      } else if (value instanceof User) {
        stream.write(134);
        writeValue(stream, ((User) value).toList());
      } else {
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter. */
  public interface PasskeysApi {

    void canAuthenticate(@NonNull Result<Boolean> result);

    void register(@NonNull String challenge, @NonNull RelyingParty relyingParty, @NonNull User user, @NonNull AuthenticatorSelection authenticatorSelection, @Nullable List<PubKeyCredParam> pubKeyCredParams, @Nullable Long timeout, @Nullable String attestation, @NonNull Result<RegisterResponse> result);

    void authenticate(@NonNull String relyingPartyId, @NonNull String challenge, @Nullable Long timeout, @Nullable String userVerification, @Nullable List<AllowCredential> allowCredentials, @NonNull Result<AuthenticateResponse> result);

    void getSignatureFingerprint(@NonNull Result<String> result);

    /** The codec used by PasskeysApi. */
    static @NonNull MessageCodec<Object> getCodec() {
      return PasskeysApiCodec.INSTANCE;
    }
    /**Sets up an instance of `PasskeysApi` to handle messages through the `binaryMessenger`. */
    static void setup(@NonNull BinaryMessenger binaryMessenger, @Nullable PasskeysApi api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PasskeysApi.canAuthenticate", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                Result<Boolean> resultCallback =
                    new Result<Boolean>() {
                      public void success(Boolean result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.canAuthenticate(resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PasskeysApi.register", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                String challengeArg = (String) args.get(0);
                RelyingParty relyingPartyArg = (RelyingParty) args.get(1);
                User userArg = (User) args.get(2);
                AuthenticatorSelection authenticatorSelectionArg = (AuthenticatorSelection) args.get(3);
                List<PubKeyCredParam> pubKeyCredParamsArg = (List<PubKeyCredParam>) args.get(4);
                Number timeoutArg = (Number) args.get(5);
                String attestationArg = (String) args.get(6);
                Result<RegisterResponse> resultCallback =
                    new Result<RegisterResponse>() {
                      public void success(RegisterResponse result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.register(challengeArg, relyingPartyArg, userArg, authenticatorSelectionArg, pubKeyCredParamsArg, (timeoutArg == null) ? null : timeoutArg.longValue(), attestationArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PasskeysApi.authenticate", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                ArrayList<Object> args = (ArrayList<Object>) message;
                String relyingPartyIdArg = (String) args.get(0);
                String challengeArg = (String) args.get(1);
                Number timeoutArg = (Number) args.get(2);
                String userVerificationArg = (String) args.get(3);
                List<AllowCredential> allowCredentialsArg = (List<AllowCredential>) args.get(4);
                Result<AuthenticateResponse> resultCallback =
                    new Result<AuthenticateResponse>() {
                      public void success(AuthenticateResponse result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.authenticate(relyingPartyIdArg, challengeArg, (timeoutArg == null) ? null : timeoutArg.longValue(), userVerificationArg, allowCredentialsArg, resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(
                binaryMessenger, "dev.flutter.pigeon.PasskeysApi.getSignatureFingerprint", getCodec());
        if (api != null) {
          channel.setMessageHandler(
              (message, reply) -> {
                ArrayList<Object> wrapped = new ArrayList<Object>();
                Result<String> resultCallback =
                    new Result<String>() {
                      public void success(String result) {
                        wrapped.add(0, result);
                        reply.reply(wrapped);
                      }

                      public void error(Throwable error) {
                        ArrayList<Object> wrappedError = wrapError(error);
                        reply.reply(wrappedError);
                      }
                    };

                api.getSignatureFingerprint(resultCallback);
              });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
}
