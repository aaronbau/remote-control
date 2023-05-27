import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remote_ui/providers/auth_provider.dart';
import 'package:remote_ui/routes.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        leading: TextButton(
          onPressed: () => context.goNamed(Routes.home.name),
          child: const Text('Home'),
        ),
        leadingWidth: 60,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(authProvider).logout();
              context.goNamed(Routes.login.name);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: const SafeArea(child: Text('Home')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          if (value == 4) context.goNamed(Routes.remote.name);
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_android),
            label: 'Remote',
          ),
        ],
      ),
    );
  }
}
