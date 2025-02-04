import * as wdio from 'webdriverio';
import {byValueKey, byText} from 'appium-flutter-finder';
import {describe, test, beforeAll, afterAll, expect} from '@jest/globals';
import {delay} from './util';

// Desired capabilities for the iOS simulator
const capsAndroid =
    {
        'platformName': 'Android',
        'appium:deviceName': 'emulator-5554',
        'appium:appPackage': "com.corbado.passkeys.pub",
        'appium:appActivity': ".MainActivity",
        'appium:noReset': true,
        'appium:automationName': 'Flutter',
        'appium:retryBackoffTime': 500
    };

const opts = {
    port: 4567,
    host: '127.0.0.1',
    capabilities: capsAndroid
};

describe('Android Tests', () => {
    let driver;

    beforeAll(async () => {
        driver = await wdio.remote(opts);

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

            // Fill in details
            const emailField = byValueKey('email-field');
            await driver.elementClick(emailField);
            await driver.execute('flutter:enterText', 'test+1@example.com');
            const signUpButton = byValueKey("sign-up-button");
            await driver.elementClick(signUpButton);

            // Simulate fingerprint authentication
            await delay(1000);
            await driver.switchContext('NATIVE_APP');

            await driver.tap({x: 850, y: 1300});

            await delay(1000);

            await driver.fingerPrint(1);

            await driver.switchContext('FLUTTER');
            // Wait for the new screen to appear
            await driver.execute('flutter:waitFor', byValueKey('welcome-text'));

            await driver.elementClick(byValueKey('sign-out-button'));
        });

        test('5s Timeout', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('5s Timeout'));

            // Fill in details
            const emailField = byValueKey('email-field');
            await driver.elementClick(emailField);
            await driver.execute('flutter:enterText', 'test+2@example.com');
            const signUpButton = byValueKey("sign-up-button");
            await driver.elementClick(signUpButton);

            // Simulate fingerprint authentication
            await delay(6000);

            // Wait for the error to appear
            const error = byValueKey('error-text');
            const errorText = await driver.getElementText(error);

            expect(errorText).toContain('TYPE_TIMEOUT_ERROR');
        });

        test('Exclude Credentials', async () => {
            await driver.elementClick(byValueKey('test-selector'));
            await driver.elementClick(byText('ExcludeCredentials'));

            // Fill in details
            await driver.elementClick(byValueKey('email-field'));
            await driver.execute('flutter:enterText', 'test+3@example.com');
            await driver.elementClick(byValueKey("sign-up-button"));

            // Simulate fingerprint authentication
            await delay(1000);
            await driver.switchContext('NATIVE_APP');

            await driver.tap({x: 850, y: 1300});

            await delay(1000);

            await driver.fingerPrint(1);

            await delay(1000);

            await driver.switchContext('FLUTTER');

            // Wait for the error to appear
            const error = byValueKey('error-text');
            const errorText = await driver.getElementText(error);

            expect(errorText).toContain('ExcludeCredentialsCanNotBeRegisteredException');
        });
    });
});