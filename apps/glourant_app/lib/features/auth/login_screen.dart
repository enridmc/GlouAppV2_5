import 'package:flutter/material.dart';

import '../../core/constants/mock_data.dart';
import '../../shared/models/demo_user.dart';
import '../../shared/widgets/responsive.dart';
import '../../shared/layouts/navigation_config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({required this.onLogin, super.key});

  final ValueChanged<DemoUser> onLogin;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DemoUser selectedUser = demoUsers.first;
  final pinController = TextEditingController(text: demoUsers.first.pin);
  bool showError = false;

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 860;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1040),
              child: Flex(
                direction: wide ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandedIf(enabled: wide, child: const LoginIntroPanel()),
                  SizedBox(width: wide ? 18 : 0, height: wide ? 0 : 18),
                  ExpandedIf(
                    enabled: wide,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Acceso demo',
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Elige un rol hardcodeado. Despues lo sustituiremos por autenticacion real.',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 18),
                            ...demoUsers.map(
                              (user) => DemoUserTile(
                                user: user,
                                selected: selectedUser == user,
                                onTap: () {
                                  setState(() {
                                    selectedUser = user;
                                    pinController.text = user.pin;
                                    showError = false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: pinController,
                              obscureText: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'PIN demo',
                                prefixIcon: const Icon(Icons.password),
                                errorText: showError
                                    ? 'PIN incorrecto para este rol'
                                    : null,
                                border: const OutlineInputBorder(),
                              ),
                              onSubmitted: (_) => _submit(),
                            ),
                            const SizedBox(height: 14),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: _submit,
                                icon: const Icon(Icons.login),
                                label: Text(
                                  'Entrar como ${roleLabel(selectedUser.role)}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (pinController.text.trim() != selectedUser.pin) {
      setState(() => showError = true);
      return;
    }

    widget.onLogin(selectedUser);
  }
}

class LoginIntroPanel extends StatelessWidget {
  const LoginIntroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF153B35),
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: const Color(0xFFFFC857),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.qr_code_2, color: Color(0xFF153B35)),
            ),
            const SizedBox(height: 28),
            Text(
              'Glourant',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Acceso por roles para probar la demo: administracion, sala, cocina y cliente QR.',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 24),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                LoginFeatureChip(
                  icon: Icons.admin_panel_settings,
                  label: 'Admin',
                ),
                LoginFeatureChip(icon: Icons.table_bar, label: 'Sala'),
                LoginFeatureChip(icon: Icons.soup_kitchen, label: 'Cocina'),
                LoginFeatureChip(
                  icon: Icons.qr_code_scanner,
                  label: 'Cliente QR',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginFeatureChip extends StatelessWidget {
  const LoginFeatureChip({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, color: Colors.white, size: 18),
      label: Text(label),
      labelStyle: const TextStyle(color: Colors.white),
      backgroundColor: Colors.white12,
      side: BorderSide.none,
    );
  }
}

class DemoUserTile extends StatelessWidget {
  const DemoUserTile({
    required this.user,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final DemoUser user;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFFE7F2EF) : const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected
                  ? const Color(0xFF1D6F5F)
                  : const Color(0xFFE4E1DA),
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: selected
                    ? const Color(0xFF1D6F5F)
                    : const Color(0xFFE4E1DA),
                foregroundColor: selected ? Colors.white : Colors.black87,
                child: Icon(roleIcon(user.role)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                    Text('${roleLabel(user.role)} · PIN ${user.pin}'),
                  ],
                ),
              ),
              if (selected) const Icon(Icons.check_circle),
            ],
          ),
        ),
      ),
    );
  }
}
