// Regression test for https://github.com/corbado/flutter-passkeys/issues/294
// ua_client_hints uses dart:html which breaks flutter build web --wasm.
// This package never imports it; the dependency was vestigial.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('pubspec must not depend on ua_client_hints (breaks WASM builds)', () {
    final pubspec = File('pubspec.yaml').readAsStringSync();
    expect(pubspec, isNot(contains('ua_client_hints')));
  });
}
