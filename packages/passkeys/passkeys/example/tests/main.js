const wdio = require('webdriverio');
const {byValueKey} = require('appium-flutter-finder');

// Appium server configuration
const server = {
    host: "localhost",
    port: 4723,
};

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

const capsIos =
    {
        "platformName": "iOS",
        "appium:deviceName": "iPhone 14 Pro",
        "appium:platformVersion": "17.0",
        "appium:bundleId": "com.corbado.passkeys.pub",
        "appium:noReset": true,
        "appium:fullReset": false,
        "appium:automationName": "Flutter",
        "appium:retryBackoffTime": 500
    };

const platform = process.argv[2]?.toLowerCase();
if (!platform || !['android', 'ios'].includes(platform)) {
    console.error("Please specify the platform: 'android' or 'ios'");
    process.exit(1);
}

// Select the capabilities based on the platform
const caps = platform === 'ios' ? capsIos : capsAndroid;

const opts = {
    port: 4723,
    capabilities: caps
};

(async () => {
    const driver = await wdio.remote(opts);

    try {
        const platformName = opts.capabilities.platformName.toLowerCase();


        if (platformName === 'ios') {
            await driver.switchContext('NATIVE_APP');

            // Enroll biometric (Face ID or Touch ID)
            await driver.execute('mobile: enrollBiometric', {isEnabled: true});
        }
        await driver.switchContext('FLUTTER');

        // Interact with Flutter widgets
        const emailField = byValueKey('email-field');
        await driver.elementClick(emailField);
        await driver.execute('flutter:enterText', 'test@example.com');
        const signUpButton = byValueKey("sign-up-button");
        await driver.elementClick(signUpButton);

        // Simulate fingerprint authentication
        await delay(5000);
        await driver.switchContext('NATIVE_APP');

        if (platformName === 'ios') {
            const windowSize = await driver.getWindowSize(); // Get screen dimensions
            const screenWidth = windowSize.width;
            const screenHeight = windowSize.height;

            // Example: Tap at the center of the screen
            const centerX = screenWidth / 2;
            const centerY = screenHeight / 2;

            // Perform a tap at the center of the screen
            await driver.execute('mobile:tap', {
                x: centerX,
                y: screenHeight - 100,
            });

            console.log(`Tapped at: (${centerX}, ${centerY})`);

            await driver.execute('mobile: sendBiometricMatch', {match: true});
        } else {
            // Simulate fingerprint authentication
            await driver.fingerPrint(1);
        }

        await driver.switchContext('FLUTTER');
        // Wait for the new screen to appear
        await driver.execute('flutter:waitFor', byValueKey('welcome-text'));
    } catch (error) {
        console.error("Test failed:", error);
    } finally {
        await driver.terminateApp("com.corbado.passkeys.pub");
        await driver.deleteSession();
    }
})();

function delay(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}