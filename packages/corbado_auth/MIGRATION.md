<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">  

# Migration Guide (v2 -> v3)

## Breaking Changes

Here is a list of the major breaking changes going into v3:

### 1. Updated Dependencies and JavaScript Bundle

- Update corbado_auth in your pubspec.yaml to ^3.x.x.
- Switch the external JavaScript bundle in web/index.html to the latest 2.4.0 version from GitHub. [Web]

---

### 2. Replace authentication pages with blocks

- Pages like sign_in_page.dart, sign_up_page.dart, base_page.dart have been removed.
- Replace them with the new block-based screens (e.g., LoginInitScreen, SignupInitScreen). 

---

### 3. Route Simplification

- Instead of multiple routes for sign-up, sign-in, token details, etc., you now only need one main route (e.g., /auth) for
  all authentication flows.
- The blocks (and the new CorbadoAuthComponent) handle internal flow transitions automatically.

---

### 4. Adoption of CorbadoAuthComponent

- A new CorbadoAuthComponent integrates directly with CorbadoAuth via a stream.
- It automatically rebuilds with the correct screen (login, signup, passkey, OTP, etc.) based on emitted Block data.
- This centralizes your authentication flow into a single widget, removing the need for manual page-by-page routing or
  state handling.

---

### 5. Removal of AuthService

- All authentication logic now resides within Block classes (e.g., `LoginInitBlock`, `SignupInitBlock`).
- Consequently, references to `auth_service.dart` must be deleted in favor of each block’s respective logic.


## Migration Steps

> **_NOTE:_** This migration guide is based on the example we provide in the `corbado_auth` package. Thus, the changes
> are based on
> the example provided in the package. If you have a different setup, you will need to adjust the changes accordingly.

### 1. Updating Dependencies

Here are the dependency changes needed to migrate from v2 to v3:

- First in `pubspec.yaml` upgrade the corbado_auth version to the latest release.

```diff pubspec.yaml
environment:  
 dependencies:
-  corbado_auth: ^2.0.8
+  corbado_auth: ^3.4.0
```  

- Update the JavaScript bundle in `web/index.html` to the latest 2.4.0 version from GitHub. [Web]

```diff web/index.html
-  <script src="https://github.com/corbado/flutter-passkeys/releases/download/2.0.0-dev.1/bundle.js" type="application/javascript"></script>
+  <script src="https://github.com/corbado/flutter-passkeys/releases/download/2.4.0/bundle.js" type="application/javascript"></script>
```

### 2. Removing AuthService and other code modificiations

Here are the code changes needed to migrate from v2 to v3:

- Remove the `AuthService` from your state provider as the logic is moved to the `Block` classes now.

```diff lib/auth_provider.dart
-import 'package:corbado_auth_example/auth_service.dart';

-final authServiceProvider = Provider<AuthService>((ref) {
-  final corbado = ref.watch(corbadoProvider);
-
-  return AuthService(corbado);
-});
```

- Delete `lib/auth_service.dart` as the logic is moved to the `Block` classes now.
- Delete `lib/pages/base_page.dart`, `lib/pages/sign_in_page.dart`, `lib/pages/sign_up_page.dart`


- Modify `lib/router.dart` to get rid of unused routes and add the new `auth` (which we will implement in section 4)
  route as we only need one route right now
  and the flows will be handled by the blocks/components themselves

```diff /lib/router.dart
+import 'package:corbado_auth_example/pages/auth_page.dart';
-import 'package:corbado_auth_example/pages/sign_in_page.dart';
-import 'package:corbado_auth_example/pages/sign_up_page.dart';

class Routes {
-  static const signUp = '/sign-up';
-  static const signIn = '/sign-in';
+  static const auth = '/auth';
   static const profile = '/profile';
}

GoRoute _defaultTransitionGoRoute({
  final routerProvider = Provider<GoRouter>((ref) {
   final authState = ref.watch(authStateProvider);

   return GoRouter(
-      initialLocation: Routes.signUp,
+      initialLocation: Routes.auth,
       routes: [
         _defaultTransitionGoRoute(
-          path: Routes.signUp,
-          builder: (context, state) => SignUpPage(),
-        ),
-        _defaultTransitionGoRoute(
-          path: Routes.signIn,
-          builder: (context, state) => SignInPage(),
+          path: Routes.auth,
+          builder: (context, state) => AuthPage(),
         ),
       ],
       redirect: (BuildContext context, GoRouterState state) {
         final onLoggedOutRoutes = [
-          Routes.signIn,
-          Routes.signUp,
+          Routes.auth,
         ].contains(state.fullPath);

         if (authState.value == null) {
             // if the user is not logged in but currently on a page that should
             // only be visible for logged in users => redirect to auth page.
             if (!onLoggedOutRoutes) {
-              return Routes.signIn;
+              return Routes.auth;
             }
-            break;
           case AuthState.SignedIn:
             // if the user is logged in but currently on a page that should
             // only be visible for logged out users => redirect to profile page.
             if (onLoggedOutRoutes) {
               return Routes.profile;
             }
-            break;
-          case AuthState.AskForPasskeyAppend:
-            // we are not handling passkey append in this example (yet)
-            return Routes.signIn;
         }
```

### 3. New Screens and implementing Blocks

We will need to create a bunch of new screens to implement the new block logic. As of v3 the logic is moved from the
`CorbadoAuthService` to the `Block` classes. Here is a list of the new blocks and their corresponding screens that need
to be created/implemented:

<details>
<summary>LoginInitBlock</summary>

We will need to create `lib/screens/login_init.dart` that implements `CorbadoScreen<LoginInitBlock>` which also
contains the logic allowed to this screen

#### Documentation

##### LoginInitBlockData

Stores login initialization details.

###### Properties

- `loginIdentifier`: User’s login identifier (email, phone, or username).
- `loginIdentifierError`: Potential error in login identifier.
- `conditionalUIChallenge`: Challenge string for conditional UI.
- `isPhoneFocused`: Whether phone input is focused.
- `emailEnabled`: If email login is available.
- `usernameEnabled`: If username login is available.
- `phoneEnabled`: If phone login is available.
- `primaryLoading`: Indicates if a login request is in progress.

---

##### LoginInitBlock

Handles the login initialization process.

###### Methods

- `navigateToSignup()`: Switches to the signup block.
- `submitLogin({required String loginIdentifier, bool isPhone = false}) async`: Submits the login identifier for
  authentication.
- `initConditionalUI() async`: Initiates conditional UI verification if a challenge is available.

---

This block integrates with Corbado authentication and manages login initialization workflows.

#### Example

Here is also a small example on how to use the new block logic in the screen:

```dart /lib/screens/login_init.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginInitScreen extends HookWidget implements CorbadoScreen<LoginInitBlock> {
  final LoginInitBlock block;

  LoginInitScreen(this.block);

  Widget build(BuildContext context) {
    final emailController = useTextEditingController(text: block.data.loginIdentifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          // Handle error
        ...
      }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: TextField(
            controller: emailController,
            autofillHints: [_getAutofillHint()],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email address',
            ),
          ),
        ),
        // Get the error message using `block.data.loginIdentifierError`
        MaybeGenericError(message: block.data.loginIdentifierError?.translatedError),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            // You can get the loading state using `block.data.primaryLoading`
            isLoading: block.data.primaryLoading,
            onTap: () async {
              final email = emailController.value.text;
              // You can submit the login using `block.submitLogin`
              await block.submitLogin(loginIdentifier: email);
            },
            content: 'Login',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            // You can navigate to the signup screen using `block.navigateToSignup`
            onTap: block.navigateToSignup,
            content: 'Create a new account',
          ),
        ),
      ],
    );
  }

  String _getAutofillHint() {
    if (kIsWeb) {
      // On web, only the first hint will be included in autocomplete
      // See: https://api.flutter.dev/flutter/widgets/EditableText/autofillHints.html
      return 'username webauthn';
    } else {
      return AutofillHints.username;
    }
  }
}
```

</details>

---

<details>
<summary>SignupInitBlock</summary>

We will need to create `lib/screens/signup_init.dart` that implements `CorbadoScreen<SignupInitBlock>` which also
contains the logic allowed to this screen

#### Documentation

### SignupInitBlockData

Stores signup initialization details.

#### Properties

- `fullName`: Full name field with potential validation errors.
- `email`: Email field with potential validation errors.
- `primaryLoading`: Indicates if a signup request is in progress.

---

### SignupInitBlock

Handles the signup initialization process.

#### Methods

- `navigateToLogin()`: Redirects the user to the login flow.
- `submitSignupInit({String? email, String? fullName}) async`: Initiates the signup process with optional email and full
  name.

---

This block integrates with Corbado authentication and manages signup initialization workflows.

#### Example

Here is also a small example on how to use the new block logic in the screen:

```dart /lib/screens/signup_init.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/screens/helper.dart';
import 'package:corbado_auth_example/widgets/filled_text_button.dart';
import 'package:corbado_auth_example/widgets/generic_error.dart';
import 'package:corbado_auth_example/widgets/outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupInitScreen extends HookWidget implements CorbadoScreen<SignupInitBlock> {
  final SignupInitBlock block;

  // Block initialization
  SignupInitScreen(this.block);

  Widget build(BuildContext context) {
    // Get the email from the block
    final email = block.data.email;
    
    final emailController = useTextEditingController(text: email.value);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          showNotificationError(context, maybeError.translatedError);
        }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // You can show the error message using `block.error`
        MaybeGenericError(message: block.error?.translatedError),
        ...
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            // You can get the loading state using `block.data.primaryLoading`
            isLoading: block.data.primaryLoading,
            onTap: () async {
              // You can submit the signup using `block.submitSignupInit`
              await block.submitSignupInit(email: emailController.text, fullName: 'fixed');
            },
            content: 'Sign up',
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            // You can navigate to the login screen using `block.navigateToLogin`
            onTap: block.navigateToLogin,
            content: 'I already have an account',
          ),
        ),
      ]
      ,
    );
  }
}
```

</details>

---
<details>
<summary>PasskeyAppendBlock</summary>

We will need to create `lib/screens/passkey_append.dart` that implements `CorbadoScreen<PasskeyAppendBlock>` which also
contains the logic allowed to this screen

#### Documentation

##### PasskeyAppendBlockData

Stores passkey append details.

###### Properties

- `availableFallbacks`: List of available fallback authentication methods.
- `canBeSkipped`: Indicates if passkey append can be skipped.
- `identifierValue`: User identifier value.
- `identifierType`: Type of identifier (email, phone, etc.).
- `preferredFallback`: Preferred fallback authentication method.
- `autoSubmit`: Whether passkey append should be auto-submitted.
- `primaryLoading`: Indicates if a passkey append operation is in progress.

---

##### PasskeyAppendBlock

Handles the passkey append process.

###### Methods

- `passkeyAppend() async`: Initiates the passkey append process.
- `initFallbackEmailOtp() async`: Sends an OTP email as a fallback authentication method.
- `skipPasskeyAppend() async`: Skips the passkey append process.

---

This block integrates with Corbado authentication and manages passkey appending workflows.

#### Example

Here is also a small example on how to use the new block logic in the screen:

```dart /lib/screens/passkey_append.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasskeyAppendScreen extends HookWidget implements CorbadoScreen<PasskeyAppendBlock> {
  final PasskeyAppendBlock block;

  // Block initialization
  PasskeyAppendScreen(this.block);

  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          // Handle error
        ...
      }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            // You can get the loading state using `block.data.primaryLoading`
            isLoading: block.data.primaryLoading,
            onTap: () async {
              // You can initiate the passkey append using `block.passkeyAppend`
              await block.passkeyAppend();
            },
            content: 'Create passkey',
          ),
        ),
        const SizedBox(height: 10),
        if (block.data.preferredFallback != null) SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            // You can navigate to the fallback screen using `block.data.preferredFallback.onTap`
            onTap: () => block.data.preferredFallback!.onTap(),
            // You can show the fallback label using `block.data.preferredFallback.label`
            content: block.data.preferredFallback!.label,
          ),
        ) else
          Container(),
        if (block.data.canBeSkipped) SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            // You can skip the passkey append using `block.skipPasskeyAppend`
            onTap: block.skipPasskeyAppend,
            content: 'Maybe later',
          ),
        ) else
          Container(),
      ],
    );
  }
}
```

</details>

---
<details>
<summary>PasskeyVerifyBlock</summary>

We will need to create `lib/screens/passkey_verify.dart` that implements `CorbadoScreen<PasskeyVerifyBlock>` which also
contains the logic allowed to this screen

#### Documentation

##### PasskeyVerifyBlockData

Stores passkey verification details.

###### Properties

- `availableFallbacks`: List of available fallback authentication methods.
- `identifierValue`: User identifier value.
- `preferredFallback`: Preferred fallback authentication method.
- `primaryLoading`: Indicates if a passkey verification operation is in progress.

---

#### PasskeyVerifyBlock

Handles the passkey verification process.

###### Methods

- `passkeyVerify() async`: Initiates the passkey verification process.
- `initFallbackEmailOtp() async`: Sends an OTP email as a fallback authentication method.
- `skipPasskeyAppend()`: Placeholder method (not yet implemented).

---

This block integrates with Corbado authentication and manages passkey verification workflows.

#### Example

Here is also a small example on how to use the new block logic in the screen:

```dart /lib/screens/passkey_verify.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PasskeyVerifyScreen extends HookWidget implements CorbadoScreen<PasskeyVerifyBlock> {
  final PasskeyVerifyBlock block;

  // Block initialization
  PasskeyVerifyScreen(this.block);

  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          // Handle error
        ...
      }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // You can show the error message using `block.error`
        MaybeGenericError(message: block.error?.translatedError),
        ...
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            // You can get the loading state using `block.data.primaryLoading`
            isLoading: block.data.primaryLoading,
            onTap: () async {
              // You can initiate the passkey verification using `block.passkeyVerify`
              await block.passkeyVerify();
            },
            content: 'Login with passkey',
          ),
        ),
        const SizedBox(height: 10),
        if (block.data.preferredFallback != null) SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            // You can navigate to the fallback screen using `block.data.preferredFallback.onTap`
            onTap: () => block.data.preferredFallback!.onTap(),
            // You can show the fallback label using `block.data.preferredFallback.label`
            content: block.data.preferredFallback!.label,
          ),
        ) else
          Container(),
      ],
    );
  }
}
```

</details>

---
<details>
<summary>EmailVerifyBlock</summary>

We will need to create `lib/screens/email_verify_otp.dart` that implements `CorbadoScreen<EmailVerifyBlock>` which also
contains the logic allowed to this screen

#### Documentation

##### EmailVerifyBlockData

Stores email verification details.

###### Properties

- `email`: Email address to verify.
- `verificationMethod`: `emailOTP` or `emailLink` **(emailLink is not fully supported yet)**.
- `retryNotBefore`: Next retry timestamp.
- `isPostLoginVerification`: Whether post-login verification is needed.

##### EmailVerifyBlock

Manages the email verification process.

###### Methods

- `navigateToEditEmail()`: Redirects to email edit screen.
- `navigateToVerifyEmail()`: Redirects to verification screen based on method.
- `submitOtpCode(String otpCode) async`: Submits OTP, verifies with `corbadoService.verifyEmailOtpCode(otpCode)`.
- `resendEmail() async`: Resends email (OTP or link) using `corbadoService`.
- `updateEmail(String newValue) async`: Updates email using `corbadoService.updateEmail(newValue)`.
- `primaryLoading`: Indicates if a verification operation is in progress.

---

This class integrates with Corbado authentication and manages email verification workflows.

#### Example

Here is also a small example on how to use the new block logic in the screen:

```dart /lib/screens/email_verify_otp.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EmailVerifyOtpScreen extends HookWidget implements CorbadoScreen<EmailVerifyBlock> {
  // Block initialization
  final EmailVerifyBlock block;

  // Block initialization
  EmailVerifyOtpScreen(this.block);

  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final maybeError = block.error;
        if (maybeError != null) {
          // Handle error
        ...
      }
      });
    }, [block.error]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...
        // You can show the email using `block.data.email`
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'We have sent you a 6 digit code to ${block.data.email}. Please enter the code below.',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        ...
        // You can get the loading state using `block.data.primaryLoading`
        SizedBox(
          width: double.infinity,
          height: 50,
          child: FilledTextButton(
            isLoading: block.data.primaryLoading,
            // You can submit the code using `block.submitOtpCode`
            onTap: () async {
              await block.submitOtpCode(emailController.text);
            },
            content: 'Submit',
          ),
        ),
        const SizedBox(height: 10),
        // You can resent the code using `block.resendEmail`
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedTextButton(
            onTap: block.resendEmail,
            content: 'Resend code',
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
```

</details>

### 4. Implementing New CorbadoAuthComponent

Finally after creating the screens, we will need to also implement `CorbadoAuthComponent` which is a
stateful widget that automatically listens to a stream of screens (blocks) coming from the `CorbadoAuth` instance. Each
emitted ComponentWithData indicates which authentication screen (e.g., SignupInit, LoginInit, etc.) should be displayed.
By providing the newly created screens (via the CorbadoScreens parameter), you can easily wire up UI for each
authentication flow without manually handling routing or state transitions.

Here is an example of how to implement the `CorbadoAuthComponent`:

```dart /lib/components/auth_page.dart
import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/screens/email_verify_otp.dart';
import 'package:corbado_auth_example/screens/login_init.dart';
import 'package:corbado_auth_example/screens/passkey_append.dart';
import 'package:corbado_auth_example/screens/passkey_verify.dart';
import 'package:corbado_auth_example/screens/signup_init.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthPage extends HookConsumerWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the CorbadoAuth instance from Riverpod
    final corbadoAuth = ref.watch(corbadoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Corbado Authentication')),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CorbadoAuthComponent(
              corbadoAuth: corbadoAuth,
              components: CorbadoScreens(
                signupInit: SignupInitScreen.new,
                loginInit: LoginInitScreen.new,
                emailVerifyOtp: EmailVerifyOtpScreen.new,
                passkeyAppend: PasskeyAppendScreen.new,
                passkeyVerify: PasskeyVerifyScreen.new,
              ),
              // Optional loading widget. If omitted, a default CircularProgressIndicator is shown.
              loading: const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}

```