import 'package:flutter/material.dart';

import '../features/auth/auth_gate.dart';
import 'theme.dart';

class GlourantApp extends StatelessWidget {
  const GlourantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Glourant',
      debugShowCheckedModeBanner: false,
      theme: GlourantTheme.light(),
      home: const AuthGate(),
    );
  }
}
