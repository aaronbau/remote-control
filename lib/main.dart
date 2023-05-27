import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remote_ui/pages/home_page.dart';
import 'package:remote_ui/pages/login_page.dart';
import 'package:remote_ui/pages/remote_page.dart';
import 'package:remote_ui/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(useMaterial3: true),
      routerConfig: GoRouter(
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
          ),
          GoRoute(
            path: Routes.remote.path,
            name: Routes.remote.name,
            builder: (context, state) => const RemotePage(),
          ),
        ],
      ),
    );
  }
}
