const DefaultCorbadoAuthConfig = CorbadoAuthConfig(askForPasskeyAppend: true);

class CorbadoAuthConfig {
  const CorbadoAuthConfig({this.askForPasskeyAppend = false});

  final bool askForPasskeyAppend;
}
