import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/pages/profile_page.dart';
import 'package:corbado_auth_example/pages/sign_in_page.dart';
import 'package:corbado_auth_example/pages/sign_up_page.dart';
import 'package:corbado_auth_example/pages/tokendetails_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const signUp = '/sign-up';
  static const signIn = '/sign-in';
  static const profile = '/profile';
  static const tokenDetails = '/tokendetails';
}

GoRoute _defaultTransitionGoRoute({
  required String path,
  required Widget Function(BuildContext, GoRouterState) builder,
}) {
  return GoRoute(
    path: path,
    pageBuilder: (context, state) =>
        _customPageBuilder(builder, context, state),
  );
}

Page<dynamic> _customPageBuilder(
  Widget Function(BuildContext, GoRouterState) builder,
  BuildContext context,
  GoRouterState state,
) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    transitionDuration: const Duration(milliseconds: 150),
    child: builder(context, state),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeIn).animate(animation),
        child: child,
      );
    },
  );
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
      initialLocation: Routes.signUp,
      routes: [
        _defaultTransitionGoRoute(
          path: Routes.signUp,
          builder: (context, state) => SignUpPage(),
        ),
        _defaultTransitionGoRoute(
          path: Routes.signIn,
          builder: (context, state) => SignInPage(),
        ),
        _defaultTransitionGoRoute(
          path: Routes.profile,
          builder: (context, state) => ProfilePage(),
        ),
        _defaultTransitionGoRoute(
          path: Routes.tokenDetails,
          builder: (context, state) => TokenDetailsPage(),
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final onLoggedOutRoutes = [
          Routes.signIn,
          Routes.signUp,
        ].contains(state.fullPath);

        if (authState.value == null) {
          return null;
        }

        switch (authState.value!) {
          case AuthState.None:
            // if the user is not logged in but currently on a page that should
            // only be visible for logged in users => redirect to signIn page.
            if (!onLoggedOutRoutes) {
              return Routes.signIn;
            }
            break;
          case AuthState.SignedIn:
            // if the user is logged in but currently on a page that should
            // only be visible for logged out users => redirect to profile page.
            if (onLoggedOutRoutes) {
              return Routes.profile;
            }
            break;
        }

        return null;
      });
});
