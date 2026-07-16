#!/usr/bin/env bash
# Runs the patrol integration tests on a connected device / emulator.
#
# Pass "true" as the first argument to also run the passkey ceremonies, which
# need a screen-lock PIN and a host side biometric injector (see the example
# README). They are off by default because they hang on a bare emulator that
# has no credential provider.
set -euo pipefail

run_ceremonies="${1:-false}"

adb wait-for-device

if [ "$run_ceremonies" = "true" ]; then
  # A screen-lock PIN lets the credential manager use a device credential; the
  # test enters it when the lock screen is shown.
  adb shell locksettings set-pin 1234
  # Continuously inject a fingerprint match so any biometric prompt shown
  # during the ceremonies is accepted from the host.
  (while true; do adb emu finger touch 1; sleep 2; done) &
  trap 'kill $!' EXIT
fi

# The Android test orchestrator occasionally drops a test process on CI
# emulators, so retry the run a couple of times before giving up.
for attempt in 1 2 3; do
  if patrol test \
    --target integration_test/passkeys_test.dart \
    --dart-define=TEST_MODE=true \
    --dart-define="RUN_CEREMONIES=${run_ceremonies}"; then
    exit 0
  fi
  echo "patrol test attempt ${attempt} failed"
done

exit 1
