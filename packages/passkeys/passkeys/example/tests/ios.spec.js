import * as wdio from 'webdriverio';
import {byValueKey, byText} from 'appium-flutter-finder';
import {describe, test, beforeAll, afterAll, expect, beforeEach} from '@jest/globals';
import {delay} from './util';

const deviceName = process.argv.find(arg => arg.startsWith('--device='))?.split('=')[1] || "iPhone 16 Pro";

// Desired capabilities for the iOS simulator
const capsIos =
    {
        "platformName": "iOS",
        "appium:deviceName": deviceName,
        "appium:bundleId": "com.corbado.passkeys.pub",
        "appium:noReset": true,
        "appium:fullReset": false,
        "appium:automationName": "Flutter",
        "appium:showXcodeLog": true
    };

const opts = {
    port: 4567,
    host: '127.0.0.1',
    capabilities: capsIos
};

describe('iOS Tests', () => {
    let driver;

    beforeAll(async () => {
        driver = await wdio.remote(opts);

        await driver.switchContext('NATIVE_APP');

        // Enroll biometric (Face ID or Touch ID)
        await driver.execute('mobile: enrollBiometric', {isEnabled: true});

        await driver.switchContext('FLUTTER');
    });

    afterAll(async () => {
        await driver.terminateApp("com.corbado.passkeys.pub");
        await driver.deleteSession();
    });

    describe('Signup Tests', () => {

        test('Default Signup', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('Default'));

            await delay(10000); // Wait for apple to download apple-app-site-association

            // Fill in details
            const emailField = byValueKey('email-field');
            await driver.elementClick(emailField);
            await driver.execute('flutter:enterText', 'test+1@example.com');
            const signUpButton = byValueKey("sign-up-button");
            await driver.elementClick(signUpButton);

            // Simulate fingerprint authentication
            await delay(2000);
            await driver.switchContext('NATIVE_APP');

            const windowSize = await driver.getWindowSize(); // Get screen dimensions
            const screenWidth = windowSize.width;
            const screenHeight = windowSize.height;

            // Example: Tap at the center of the screen
            const centerX = screenWidth / 2;

            // Perform a tap at the center of the screen
            await driver.execute('mobile:tap', {
                x: centerX,
                y: screenHeight - 100,
            });

            await driver.execute('mobile: sendBiometricMatch', {match: true});

            await driver.switchContext('FLUTTER');
            // Wait for the new screen to appear
            await driver.execute('flutter:waitFor', byValueKey('welcome-text'));

            await driver.elementClick(byValueKey('sign-out-button'));
        });

        test('Exclude Credentials', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('ExcludeCredentials'));

            // Fill in details
            await driver.elementClick(byValueKey('email-field'));
            await driver.execute('flutter:enterText', 'test+2@example.com');
            await driver.elementClick(byValueKey("sign-up-button"));

            // Simulate fingerprint authentication
            await delay(2000);
            await driver.switchContext('NATIVE_APP');

            const windowSize = await driver.getWindowSize(); // Get screen dimensions
            const screenWidth = windowSize.width;
            const screenHeight = windowSize.height;

            // Example: Tap at the center of the screen
            const centerX = screenWidth / 2;

            // Perform a tap at the center of the screen
            await driver.execute('mobile:tap', {
                x: centerX,
                y: screenHeight - 100,
            });

            await driver.execute('mobile: sendBiometricMatch', {match: true});

            await driver.switchContext('FLUTTER');

            // Wait for the error to appear
            const error = byValueKey('error-text');
            const errorText = await driver.getElementText(error);

            expect(errorText).toContain('AuthorizationError');
        });
    });

    describe('Login Tests', () => {
        beforeAll(async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('Default'));

            // Fill in details
            const emailField = byValueKey('email-field');
            await driver.elementClick(emailField);
            await driver.execute('flutter:enterText', 'test+login@gmail.com');
            const signUpButton = byValueKey("sign-up-button");
            await driver.elementClick(signUpButton);

            // Simulate fingerprint authentication
            await delay(2000);
            await driver.switchContext('NATIVE_APP');

            const windowSize = await driver.getWindowSize(); // Get screen dimensions
            const screenWidth = windowSize.width;
            const screenHeight = windowSize.height;

            // Example: Tap at the center of the screen
            const centerX = screenWidth / 2;

            // Perform a tap at the center of the screen
            await driver.execute('mobile:tap', {
                x: centerX,
                y: screenHeight - 100,
            });

            await driver.execute('mobile: sendBiometricMatch', {match: true});

            await driver.switchContext('FLUTTER');
            // Wait for the new screen to appear
            await driver.execute('flutter:waitFor', byValueKey('welcome-text'));

            await driver.elementClick(byValueKey('sign-out-button'));
        });

        beforeEach(async () => {
            await driver.elementClick(byValueKey("go-to-login-button"));
        })

        test('Default Login', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('Default'));

            // Fill in details
            await driver.elementClick(byValueKey('email-field'));
            await driver.execute('flutter:enterText', 'test+login@gmail.com');
            await driver.elementClick(byValueKey('sign-in-button'));

            await delay(1000);
            await driver.switchContext('NATIVE_APP');

            const windowSize = await driver.getWindowSize(); // Get screen dimensions
            const screenWidth = windowSize.width;
            const screenHeight = windowSize.height;

            // Example: Tap at the center of the screen
            const centerX = screenWidth / 2;

            // Perform a tap at the center of the screen
            await driver.execute('mobile:tap', {
                x: centerX,
                y: screenHeight - 50,
            });

            await delay(1000);

            await driver.execute('mobile: sendBiometricMatch', {match: true});

            await driver.switchContext('FLUTTER');
            // Wait for the new screen to appear
            await driver.execute('flutter:waitFor', byValueKey('welcome-text'));

            await driver.elementClick(byValueKey('sign-out-button'));
        });

        test('allowCredentials', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('AllowCredentials And PreferImmediatelyAvailableCredentials'));

            // Fill in details
            await driver.elementClick(byValueKey('email-field'));
            await driver.execute('flutter:enterText', 'test+login@gmail.com');
            await driver.elementClick(byValueKey('sign-in-button'));
            // Wait for the new screen to appear
            const errorText = await driver.getElementText(byValueKey('error-text-login'));

            expect(errorText).toContain('NoCredentialsAvailableException');

            await driver.elementClick(byValueKey("go-to-sign-up-button"));
        });
    });
});