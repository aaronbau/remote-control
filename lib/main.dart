import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remote_ui/pages/home_page.dart';
import 'package:remote_ui/pages/login_page.dart';
import 'package:remote_ui/pages/remote_page.dart';
import 'package:remote_ui/providers/auth_provider.dart';
import 'package:remote_ui/routes.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData(
          useMaterial3: true,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(),
            errorBorder: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            disabledBorder: OutlineInputBorder(),
            focusedErrorBorder: OutlineInputBorder(),
          )),
      routerConfig: GoRouter(
        refreshListenable: ref.read(authProvider),
        initialLocation: Routes.home.path,
        routes: [
          GoRoute(
            path: Routes.login.path,
            name: Routes.login.name,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
              path: Routes.home.path,
              name: Routes.home.name,
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: Routes.remote.name,
                  name: Routes.remote.name,
                  builder: (context, state) => const RemotePage(),
                ),
              ]),
        ],
        redirect: (context, state) {
          print(state.location);
          var auth = ref.read(authProvider);
          if (!auth.isSignedIn) return Routes.login.path;
          return null;
        },
      ),
    );
  }
}
