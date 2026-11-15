# Flutter Passkeys

## Structure

Melos monorepo on [pub workspaces](https://dart.dev/tools/pub/workspaces). `melos bootstrap` (a single workspace-wide `flutter pub get`) to set up, then `melos run <script>` (custom scripts live under the `melos:` key in the root `pubspec.yaml`). The `workspace:` list there enumerates every member, and each member declares `resolution: workspace` (no `pubspec_overrides.yaml`).

| Package | Purpose |
|---|---|
| `passkeys` | Main Flutter plugin (Dart layer, exception mapping) |
| `passkeys_android` | Android (Credential Manager via Pigeon) |
| `passkeys_darwin` | iOS + macOS (Swift) — note: NOT `passkeys_ios` |
| `passkeys_web` | Web (JS interop, has TypeScript build step) |
| `passkeys_windows` | Windows |
| `passkeys_platform_interface` | Shared types + platform interface |
| `passkeys_doctor` | Debug checks (AASA / assetlinks / RP ID) used by `passkeys` in debug mode |
| `corbado_telemetry_api_client` | Telemetry client used by the `passkeys` example |

## Architecture

- Native code catches platform exceptions → `FlutterError` with string error codes (e.g. `cancelled`, `android-no-create-option`, `domain-not-associated`)
- `authenticator.dart` maps these codes → typed Dart exceptions (`PasskeyAuthCancelledException`, `NoCreateOptionException`, etc.)
- Android uses Pigeon for Flutter↔native communication

## Key workflows

- **Native code changes**: regenerate Pigeon — `cd packages/passkeys/passkeys_android && dart run pigeon --input pigeons/messages.dart` (same for `passkeys_darwin`, `passkeys_windows`, `passkeys_doctor`). Commit the output as Pigeon writes it: every generated file starts with a `dart format off` marker from `pigeons/header.txt`, so `melos format` leaves it alone and regeneration never produces a formatting diff.
- **Web JS changes**: `melos run build-passkeys-web-javascript` (builds TS, copies bundle to example)
- **Before committing**: `dart format --set-exit-if-changed . && flutter analyze --fatal-infos .` from the repository root (one run covers the whole pub workspace, which is what CI does; `melos test` runs the suites)
- **PR titles**: Conventional Commits, e.g. `fix(passkeys_android): fixed a bug!`
- **`passkeys_darwin` dual-build**: ships both SwiftPM (`darwin/passkeys_darwin/Package.swift`) and CocoaPods (`darwin/passkeys_darwin.podspec`). When changing source layout, paths, or platform minimums, update **both** manifests and verify each path builds: `flutter config --enable-swift-package-manager` then `flutter build ios` (SwiftPM); `--no-enable-swift-package-manager` then `flutter build ios` (pods, must show `Running pod install`). Keep deployment targets aligned between the two; runtime API gating belongs in `@available`, not deployment target.

## Release order

`passkeys_platform_interface` → platform packages (incl. `passkeys_doctor`) → `passkeys`. Only bump packages with actual changes. See CONTRIBUTING.md §7 for full process.
