import 'package:flutter/material.dart';

class AppScroll extends StatelessWidget {
  const AppScroll({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: child,
    );
  }
}
