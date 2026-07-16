#!/usr/bin/env bash
# Runs the patrol integration tests for the passkeys example on a connected
# device / emulator.
#
# Pass "true" as the first argument to also run the passkey ceremonies, which
# need a screen-lock PIN and a host side biometric injector (see the README).
# They are off by default because they hang on a device without a credential
# provider. The ceremony setup below is Android emulator specific.
set -euo pipefail

run_ceremonies="${1:-false}"

if [ "$run_ceremonies" = "true" ]; then
  adb wait-for-device
  # A screen-lock PIN lets the credential manager use a device credential; the
  # test enters it when the lock screen is shown.
  adb shell locksettings set-pin 1234
  # Continuously inject a fingerprint match so any biometric prompt shown
  # during the ceremonies is accepted from the host.
  (while true; do adb emu finger touch 1; sleep 2; done) &
  trap 'kill $!' EXIT
fi

patrol test \
  --target integration_test/passkeys_test.dart \
  --dart-define=TEST_MODE=true \
  --dart-define="RUN_CEREMONIES=${run_ceremonies}"
