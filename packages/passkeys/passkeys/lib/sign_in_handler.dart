/// Enables autocomplete supported passkey login.
/// Call [complete] to show autocompletion to the user.
class SignInHandler {
  /// Constructor
  const SignInHandler({
    required this.complete,
  });

  /// Show autocompletion to the user.
  final Future<void> Function(void Function(Exception) onError) complete;
}
