import 'dart:io';

class DomainNotAssociatedException implements Exception {
  @override
  String toString() {
    if (Platform.isAndroid) {
      return 'Your app is not associated with your relying party server.';
    } else if (Platform.isIOS) {
      return '''
Your app is not associated with your relying party server. You have to add "Associated Domains" as a capability in Xcode and add the domain of your relying party server (webcredentials:example.com).
Also make sure that your relying party server hosts the apple-app-site-association file under https://example.com/.well-known/apple-app-site-association.
''';
    }

    return 'Your app is not associated with your relying party server.';
  }
}
