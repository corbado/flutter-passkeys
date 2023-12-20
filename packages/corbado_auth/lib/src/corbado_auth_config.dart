const DefaultCorbadoAuthConfig = CorbadoAuthConfig();

class CorbadoAuthConfig {
  const CorbadoAuthConfig({this.askForPasskeyAppend = false});

  final bool askForPasskeyAppend;
}
