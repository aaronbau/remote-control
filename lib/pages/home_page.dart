import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remote_ui/providers/auth_provider.dart';
import 'package:remote_ui/routes.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<bool> selected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Column(
          children: [
            ToggleButtons(
              isSelected: selected,
              onPressed: (index) => setState(() {
                if (index == 0) {
                  selected = [true, false];
                } else {
                  selected = [false, true];
                }
              }),
              children: const [Text('Points'), Text('Badges')],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (value) {
          if (value == 4) context.goNamed(Routes.remote.name);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
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
