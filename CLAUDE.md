# Flutter Passkeys

## Structure

Melos monorepo. `melos bootstrap` to set up, then `melos run <script>` (see `melos.yaml`).

| Package | Purpose |
|---|---|
| `passkeys` | Main Flutter plugin (Dart layer, exception mapping) |
| `passkeys_android` | Android (Credential Manager via Pigeon) |
| `passkeys_darwin` | iOS + macOS (Swift) — note: NOT `passkeys_ios` |
| `passkeys_web` | Web (JS interop, has TypeScript build step) |
| `passkeys_windows` | Windows |
| `passkeys_platform_interface` | Shared types + platform interface |
| `corbado_auth` | Higher-level auth package built on `passkeys` |
| `corbado_auth_firebase` | Firebase integration — **currently broken, no ETA** |
| `corbado_api_client` | Generated Corbado API client |

## Architecture

- Native code catches platform exceptions → `FlutterError` with string error codes (e.g. `cancelled`, `android-no-create-option`, `domain-not-associated`)
- `authenticator.dart` maps these codes → typed Dart exceptions (`PasskeyAuthCancelledException`, `NoCreateOptionException`, etc.)
- Android uses Pigeon for Flutter↔native communication

## Key workflows

- **Native code changes**: regenerate Pigeon — `cd packages/passkeys/passkeys_android && dart run pigeon --input pigeons/messages.dart`
- **Web JS changes**: `melos run build-passkeys-web-javascript` (builds TS, copies bundle to example)
- **Before committing**: `melos run format:check && melos run analyze`
- **PR titles**: Conventional Commits, e.g. `fix(passkeys_android): fixed a bug!`

## Release order

`passkeys_platform_interface` → platform packages → `passkeys` → `corbado_auth`. Only bump packages with actual changes. See CONTRIBUTING.md §7 for full process.
