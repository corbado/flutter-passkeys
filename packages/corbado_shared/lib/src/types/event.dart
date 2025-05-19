enum TelemetryEventType {
  EXAMPLE_APP_OPENED,
  PACKAGE_METADATA,
  METHOD_CALLED;

  @override
  String toString() {
    return name;
  }
}
