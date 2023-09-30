enum EmailOTPFlow {
  SignIn,
  SignUp
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