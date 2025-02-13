
<img width="1070" alt="GitHub Repo Cover" src="https://raw.githubusercontent.com/corbado/flutter-passkeys/main/.github/images/root_headline.png">  

# Migration Guide (v2 -> v3)

## Breaking Change

Here is a list of the major breaking changes in v3:

## Migration Steps

Here are the code changes needed to migrate from v2 to v3:

```diff pubspec.yaml
environment:  
 dependencies:
-  corbado_auth: ^2.0.8
+  corbado_auth: ^3.2.2
```  

```diff web/index.html
-  <script src="https://github.com/corbado/flutter-passkeys/releases/download/2.0.0-dev.1/bundle.js" type="application/javascript"></script>
+  <script src="https://github.com/corbado/flutter-passkeys/releases/download/2.4.0/bundle.js" type="application/javascript"></script>
```

```diff lib/auth_provider.dart
-import 'package:corbado_auth_example/auth_service.dart';

-final authServiceProvider = Provider<AuthService>((ref) {
-  final corbado = ref.watch(corbadoProvider);
-
-  return AuthService(corbado);
-});
```

- Delete `lib/auth_service.dart`
- Delete `lib/pages/base_page.dart`
- Delete `lib/pages/sign_in_page.dart`
- Delete `lib/pages/sign_up_page.dart`
- Delete `lib/pages/tokendetails_page.dart`

```diff /lib/router.dart
+import 'package:corbado_auth_example/pages/auth_page.dart';
-import 'package:corbado_auth_example/pages/sign_in_page.dart';
-import 'package:corbado_auth_example/pages/sign_up_page.dart';
-import 'package:corbado_auth_example/pages/tokendetails_page.dart';

 class Routes {
-  static const signUp = '/sign-up';
-  static const signIn = '/sign-in';
+  static const auth = '/auth';
   static const profile = '/profile';
-  static const tokenDetails = '/tokendetails';
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
         _defaultTransitionGoRoute(
           path: Routes.profile,
           builder: (context, state) => ProfilePage(),
         ),
-        _defaultTransitionGoRoute(
-          path: Routes.tokenDetails,
-          builder: (context, state) => TokenDetailsPage(),
-        ),
       ],
       redirect: (BuildContext context, GoRouterState state) {
         final onLoggedOutRoutes = [
-          Routes.signIn,
-          Routes.signUp,
+          Routes.auth,
         ].contains(state.fullPath);
 
         if (authState.value == null) {
             // if the user is not logged in but currently on a page that should
             // only be visible for logged in users => redirect to signIn page.
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
 
         return null;
```