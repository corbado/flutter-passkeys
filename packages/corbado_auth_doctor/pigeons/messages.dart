import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/messages.g.dart',
    javaOut: 'android/src/main/java/com/corbado/corbado_auth_doctor/Messages.java',
    javaOptions: JavaOptions(
      package: 'com.corbado.corbado_auth_doctor',
    ),
  ),
)

@HostApi()
abstract class WebCredentialsApi {
  List<String> getFingerprints();
}
