import 'dart:io';

/// Syncs the hardcoded `sdkVersion` in `lib/src/version.dart` with the version
/// declared in `pubspec.yaml`. Run automatically by the melos version
/// preCommit hook so the two never drift.
void main() {
  final packageRoot = File.fromUri(Platform.script).parent.parent;

  final pubspec = File('${packageRoot.path}/pubspec.yaml');
  final versionMatch = RegExp(
    r'^version:\s*(.+)$',
    multiLine: true,
  ).firstMatch(pubspec.readAsStringSync());
  if (versionMatch == null) {
    stderr.writeln('Could not find a version in ${pubspec.path}');
    exit(1);
  }
  final version = versionMatch.group(1)!.trim();

  final versionFile = File('${packageRoot.path}/lib/src/version.dart');
  final original = versionFile.readAsStringSync();
  final updated = original.replaceAll(
    RegExp("const String sdkVersion = '.*';"),
    "const String sdkVersion = '$version';",
  );

  if (updated == original) {
    stdout.writeln('version.dart sdkVersion already at $version');
    return;
  }

  versionFile.writeAsStringSync(updated);
  stdout.writeln('Updated version.dart sdkVersion to $version');
}
