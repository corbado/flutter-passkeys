#!/bin/bash
# this code only works for Nexus 5 API 29
adb shell am start -a android.settings.ADD_ACCOUNT_SETTINGS -n com.android.settings/.accounts.AddAccountSettings
sleep 1

adb shell input tap 100 600
sleep 10

adb shell input tap 100 1000
sleep 1

adb shell input text "${TEST_EMAIL}"
adb shell input keyevent 66
sleep 5

adb shell input text "${TEST_PASSWORD}"
adb shell input keyevent 66
sleep 5

adb shell input tap 800 1700
sleep 10

adb shell am start -a android.settings.SECURITY_SETTINGS
sleep 1

adb shell input tap 200 1400
sleep 1

adb shell input tap 200 700

adb shell input text "0405"
adb shell input keyevent 66

adb shell input text "0405"
adb shell input keyevent 66

adb shell input tap 800 1700
sleep 1
adb shell input tap 800 1700
sleep 1
adb shell input tap 800 1700
sleep 1

adb emu finger touch 1
sleep 1
adb emu finger touch 1
sleep 1
adb emu finger touch 1
sleep 2

adb shell input tap 800 1700
sleep 5

adb shell input keyevent 26
sleep 1
adb shell input keyevent 26
adb shell input swipe 300 1000 300 500
adb shell input text "0405"
adb shell input keyevent 66

adb shell am start -a android.intent.action.VIEW -d "market://details?id=com.google.android.gms"
sleep 20
adb shell input tap 400 600
sleep 20

flutter build apk --debug

adb install -r build/app/outputs/flutter-apk/app-debug.apk
node tests/main.js android
