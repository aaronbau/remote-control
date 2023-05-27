import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provides an [Auth] to other widgets.
final authProvider = ChangeNotifierProvider<Auth>((ref) => Auth());

// Contains the user's current authentication state.
class Auth extends ChangeNotifier {
  bool _isSignedIn = false;

  bool get isSignedIn => _isSignedIn;

  void login() async {
    _isSignedIn = true;
    notifyListeners();
  }
}
