import 'dart:io';

/// Syncs the hardcoded [sdkVersion] in `telemetry.dart` with the version
/// declared in `pubspec.yaml`. Run automatically by the melos version
/// preCommit hook so the two never drift.
void main() {
  final packageRoot = File.fromUri(Platform.script).parent.parent;

  final pubspec = File('${packageRoot.path}/pubspec.yaml');
  final versionMatch = RegExp(r'^version:\s*(.+)$', multiLine: true)
      .firstMatch(pubspec.readAsStringSync());
  if (versionMatch == null) {
    stderr.writeln('Could not find a version in ${pubspec.path}');
    exit(1);
  }
  final version = versionMatch.group(1)!.trim();

  final telemetry =
      File('${packageRoot.path}/lib/src/services/telemetry/telemetry.dart');
  final original = telemetry.readAsStringSync();
  final updated = original.replaceAll(
    RegExp("const String sdkVersion = '.*';"),
    "const String sdkVersion = '$version';",
  );

  if (updated == original) {
    stdout.writeln('telemetry.dart sdkVersion already at $version');
    return;
  }

  telemetry.writeAsStringSync(updated);
  stdout.writeln('Updated telemetry.dart sdkVersion to $version');
}
