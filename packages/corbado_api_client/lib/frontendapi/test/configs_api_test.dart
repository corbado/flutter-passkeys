import 'package:test/test.dart';
import 'package:corbado_frontend_api_client/corbado_frontend_api_client.dart';

/// tests for ConfigsApi
void main() {
  final instance = CorbadoFrontendApiClient().getConfigsApi();

  group(ConfigsApi, () {
    // tbd
    //
    //Future<SessionConfigRsp> getSessionConfig() async
    test('test getSessionConfig', () async {
      // TODO
    });

    // Gets configs needed by the UserDetails component
    //
    //Future<UserDetailsConfigRsp> getUserDetailsConfig() async
    test('test getUserDetailsConfig', () async {
      // TODO
    });
  });
}
