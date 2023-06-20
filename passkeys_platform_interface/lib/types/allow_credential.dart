///
class AllowCredentialType {
  /// Constructs a new instance.
  AllowCredentialType({
    required this.type,
    required this.id,
    required this.transports,
  });

  ///
  final String type;

  ///
  final String id;

  ///
  final List<String> transports;
}
