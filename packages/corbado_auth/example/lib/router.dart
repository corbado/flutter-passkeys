import 'package:corbado_auth/corbado_auth.dart';
import 'package:corbado_auth_example/auth_provider.dart';
import 'package:corbado_auth_example/pages/auth_page.dart';
import 'package:corbado_auth_example/pages/edit_profile_page.dart';
import 'package:corbado_auth_example/pages/passkey_list_page.dart';
import 'package:corbado_auth_example/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Named route paths used throughout the example app.
class Routes {
  /// Route showing the authentication (sign up / login) flow.
  static const auth = '/auth';

  /// Route showing the logged in user's profile.
  static const profile = '/profile';

  /// Route for editing the user's profile.
  static const editProfile = '/edit-profile';

  /// Route listing the user's passkeys.
  static const passkeyList = '/passkey-list';
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

/// Provides the [GoRouter] that drives navigation for the example app.
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.auth,
    routes: [
      _defaultTransitionGoRoute(
        path: Routes.auth,
        builder: (context, state) => const AuthPage(),
      ),
      _defaultTransitionGoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      _defaultTransitionGoRoute(
        path: Routes.editProfile,
        builder: (context, state) => const EditProfilePage(),
      ),
      _defaultTransitionGoRoute(
        path: Routes.passkeyList,
        builder: (context, state) => const PasskeyListPage(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final onLoggedOutRoutes = [Routes.auth].contains(state.fullPath);

      if (authState.value == null) {
        return null;
      }

      return switch (authState.value!) {
        // if the user is not logged in but currently on a page that should
        // only be visible for logged in users => redirect to signIn page.
        AuthState.None when !onLoggedOutRoutes => Routes.auth,
        // if the user is logged in but currently on a page that should
        // only be visible for logged out users => redirect to profile page.
        AuthState.SignedIn when onLoggedOutRoutes => Routes.profile,
        _ => null,
      };
    },
  );
});
