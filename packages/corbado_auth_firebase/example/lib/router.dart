import 'package:example/auth_provider.dart';
import 'package:example/pages/email_otp_page.dart';
import 'package:example/pages/loading_page.dart';
import 'package:example/pages/profile_page.dart';
import 'package:example/pages/sign_in_page.dart';
import 'package:example/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const signUp = '/sign-up';
  static const signIn = '/sign-in';
  static const emailOtp = '/email-otp/:email';
  static const profile = '/profile';
  static const loading = '/loading';

  static String buildEmailOtp(String email) => '/email-otp/$email';
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
      initialLocation: Routes.signIn,
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
          builder: (context, state) => const ProfilePage(),
        ),
        _defaultTransitionGoRoute(
          path: Routes.loading,
          builder: (context, state) => const LoadingPage(),
        ),
        GoRoute(
            path: Routes.emailOtp,
            pageBuilder: (context, state) {
              final email = state.pathParameters['email'];
              if (email == null) {
                throw Exception();
              }

              return _customPageBuilder(
                  (context, state) => EmailOTPPage(email: email),
                  context,
                  state);
            }),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final onLoggedOutRoutes = [
          Routes.signIn,
          Routes.signUp,
          Routes.emailOtp,
        ].contains(state.fullPath);

        if (authState.isLoading) {
          return Routes.loading;
        }

        if (authState.value == null && !onLoggedOutRoutes) {
          return Routes.signIn;
        }

        if (authState.value != null && onLoggedOutRoutes) {
          return Routes.profile;
        }

        return null;
      });
});
