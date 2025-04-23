import 'package:pigeon/pigeon.dart';

class DomainsResult {
  late List<String?> domains;
}

@HostApi()
abstract class WebCredentialsApi {
  /// Returns all `webcredentials:` domains from embedded.mobileprovision.
  DomainsResult getWebCredentialsDomains();
}
