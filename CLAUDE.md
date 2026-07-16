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
| `corbado_auth` | Higher-level auth package built on `passkeys` |
| `corbado_auth_firebase` | Firebase integration |
| `corbado_api_client` | Generated Corbado API client (its `frontendapi`/`telemetry_api_client` clients are separate workspace members) |

## Architecture

- Native code catches platform exceptions → `FlutterError` with string error codes (e.g. `cancelled`, `android-no-create-option`, `domain-not-associated`)
- `authenticator.dart` maps these codes → typed Dart exceptions (`PasskeyAuthCancelledException`, `NoCreateOptionException`, etc.)
- Android uses Pigeon for Flutter↔native communication

## Key workflows

- **Native code changes**: regenerate Pigeon — `cd packages/passkeys/passkeys_android && dart run pigeon --input pigeons/messages.dart`
- **Web JS changes**: `melos run build-passkeys-web-javascript` (builds TS, copies bundle to example)
- **Corbado API client changes**: `melos run generate-corbado-api-client`. `openapi_generator` pins `analyzer <9` and can't join the workspace, so the script regenerates `corbado_api_client/lib/frontendapi` in an isolated copy with the build tool and copies the result back (requires Java for the OpenAPI generator).
- **Before committing**: `melos format --set-exit-if-changed && melos analyze --fatal-infos` (built-in Melos commands; `melos test` runs the suites)
- **PR titles**: Conventional Commits, e.g. `fix(passkeys_android): fixed a bug!`
- **`passkeys_darwin` dual-build**: ships both SwiftPM (`darwin/passkeys_darwin/Package.swift`) and CocoaPods (`darwin/passkeys_darwin.podspec`). When changing source layout, paths, or platform minimums, update **both** manifests and verify each path builds: `flutter config --enable-swift-package-manager` then `flutter build ios` (SwiftPM); `--no-enable-swift-package-manager` then `flutter build ios` (pods, must show `Running pod install`). Keep deployment targets aligned between the two; runtime API gating belongs in `@available`, not deployment target.

## Release order

`passkeys_platform_interface` → platform packages → `passkeys` → `corbado_auth`. Only bump packages with actual changes. See CONTRIBUTING.md §7 for full process.
