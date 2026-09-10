import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    copyrightHeader: 'pigeons/header.txt',
    dartOut: 'lib/src/messages.g.dart',
    javaOut: 'android/src/main/java/com/corbado/passkeys_doctor/Messages.java',
    javaOptions: JavaOptions(package: 'com.corbado.passkeys_doctor'),
  ),
)
@HostApi()
abstract class WebCredentialsApi {
  List<String> getFingerprints();
}
