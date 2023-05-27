import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:remote_ui/providers/auth_provider.dart';
import 'package:remote_ui/routes.dart';

// Displays the login form.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // Used to identify the login form.
  GlobalKey<FormState> formKey = GlobalKey();

  // Stores the current email input.
  String email = '';

  // Stores the current password input.
  String password = '';

  // Used to determine if the password input should be obscured. This value is passed to [TextFormField.obscureText].
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log In'),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Email'),
                autofillHints: const [AutofillHints.email],
                onChanged: (value) => email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter a valid email';
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: TextButton(
                    onPressed: () => setState(() => isPasswordVisible = !isPasswordVisible),
                    child: isPasswordVisible ? const Text('Hide') : const Text('Show'),
                  ),
                ),
                autofillHints: const [AutofillHints.password],
                obscureText: !isPasswordVisible,
                onChanged: (value) => password = value,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter a valid password';
                  return null;
                },
              ),
              FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == false) return;
                  if (ref.read(authProvider).login(email: email, password: password)) {
                    context.goNamed(Routes.home.name);
                  } else {
                    ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid credentials. Please try again.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: const Text('Log In'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot your password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
