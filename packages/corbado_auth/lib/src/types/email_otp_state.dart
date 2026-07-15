// ignore_for_file: constant_identifier_names

/// Type of an email based OTP flow.
enum EmailOTPFlow {
  /// The flow signs an existing user in.
  SignIn,

  /// The flow signs a new user up.
  SignUp,
}

/// Holds all information regarding an ongoing email based OTP flow.
class EmailOTPState {
  /// Constructor
  const EmailOTPState(this.flow, this.token);

  /// Type of flow:
  final EmailOTPFlow flow;

  /// Token that identifies the flow (mainly used to complete the flow)
  final String token;
}
