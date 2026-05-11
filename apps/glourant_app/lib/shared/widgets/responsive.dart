import 'package:flutter/material.dart';

class ExpandedIf extends StatelessWidget {
  const ExpandedIf({required this.enabled, required this.child, super.key});

  final bool enabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return enabled ? Expanded(child: child) : child;
  }
}
