// ignore_for_file: constant_identifier_names
enum TelemetryEventType {
  EXAMPLE_APPLICATION_OPENED,
  PACKAGE_METADATA,
  METHOD_CALLED;

  @override
  String toString() {
    return name;
  }
}
