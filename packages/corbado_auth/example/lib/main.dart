import 'package:corbado_auth_example/auth_service.dart';
import 'package:corbado_auth_example/app_locator.dart';
import 'package:corbado_auth_example/login_page.dart';
import 'package:corbado_auth_example/profile_page.dart';
import 'package:corbado_auth_example/tokendetails_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
      refreshListenable: getIt<AuthService>(),
      initialLocation: '/',
      routes: [
        GoRoute(
          path: "/",
          builder: (context, state) => LoadingPage(),
        ),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: "/profile",
          builder: (context, state) => ProfilePage(),
        ),
        GoRoute(
          path: "/tokendetails",
          builder: (context, state) => TokenDetailsPage(),
        )
      ],
      redirect: (BuildContext context, GoRouterState state) async {
        final _authService = getIt<AuthService>();
        if (_authService.authState == AuthState.LoggedOut &&
            state.matchedLocation != '/login') {
          return '/login';
        } else if (_authService.authState == AuthState.LoggedIn &&
            (state.matchedLocation == '/login' ||
                state.matchedLocation == '/')) {
          return '/profile';
        }
        return null;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF1953ff),
          onPrimary: Colors.white,
          secondary: Colors.white,
          onSecondary: Colors.black,
          error: Colors.redAccent,
          onError: Colors.white,
          background: Color(0xFF1953ff),
          onBackground: Colors.white,
          surface: Color(0xFF1953ff),
          onSurface: Color(0xFF1953ff),
        ),
      ),
    );
  }
}

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final AuthService _authService = getIt<AuthService>();

  void initState() {
    _authService.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
