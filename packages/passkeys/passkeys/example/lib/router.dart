import 'package:go_router/go_router.dart';
import 'package:passkeys_example/pages/profile_page.dart';
import 'package:passkeys_example/pages/sign_in_page.dart';
import 'package:passkeys_example/pages/sign_up_page.dart';

class Routes {
  static const signUp = '/sign-up';
  static const signIn = '/sign-in';
  static const profile = '/profile';
}

final GoRouter router = GoRouter(
  initialLocation: Routes.signUp,
  routes: [
    GoRoute(
      path: Routes.signUp,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routes.signIn,
      builder: (context, state) => SignInPage(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => ProfilePage(),
    ),
  ],
);
