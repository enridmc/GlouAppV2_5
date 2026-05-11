import 'package:flutter/material.dart';

import '../../shared/layouts/main_shell.dart';
import '../../shared/models/demo_user.dart';
import 'login_screen.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  DemoUser? currentUser;

  @override
  Widget build(BuildContext context) {
    final user = currentUser;

    if (user == null) {
      return LoginScreen(
        onLogin: (selectedUser) => setState(() => currentUser = selectedUser),
      );
    }

    return MainShell(
      user: user,
      onLogout: () => setState(() => currentUser = null),
    );
  }
}
