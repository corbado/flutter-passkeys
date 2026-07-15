/// Response returned after a successful authentication.
class AuthResponse {
  /// Constructor
  AuthResponse({
    required this.token,
    this.refreshToken,
  });

  /// Short lived token that authenticates the user.
  final String token;

  /// Token used to obtain a new [token] once it expires.
  final String? refreshToken;
}
