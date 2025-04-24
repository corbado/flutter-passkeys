/// Defines how user mediation (interaction) should be handled during credential operations.
enum MediationType {
  /// Credentials are presented in a non-modal dialog. User can dismiss by clicking outside.
  /// Used for scenarios where immediate user interaction is preferred but not required.
  /// Only available if the credential interfaces support conditional mediation.
  Conditional,

  /// Allows automatic credential handover if possible, but will prompt for user
  /// mediation if required. This is the default behavior for credential retrieval.
  Optional,

  /// Always requires user mediation for credential operations, even if silent
  /// access would be possible. Useful for reauthentication or user-switching scenarios.
  Required,

  /// Suppresses user mediation. Operations will return null if user interaction
  /// would be needed. Useful for "Keep me signed in" features where automatic
  /// sign-in should be attempted without bothering the user.
  Silent,
}
