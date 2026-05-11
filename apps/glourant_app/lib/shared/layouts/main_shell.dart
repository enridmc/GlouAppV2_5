import 'package:flutter/material.dart';

import '../../features/dashboard/dashboard_screen.dart';
import '../../features/kitchen/kitchen_screen.dart';
import '../../features/menu/menu_screen.dart';
import '../../features/tables/tables_screen.dart';
import '../models/demo_user.dart';
import '../models/menu_item.dart';
import 'navigation_config.dart';

class MainShell extends StatefulWidget {
  const MainShell({required this.user, required this.onLogout, super.key});

  final DemoUser user;
  final VoidCallback onLogout;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int selectedIndex = initialSectionForRole(widget.user.role);
  final cart = <MenuItem>[];

  List<int> get visibleSections => sectionsForRole(widget.user.role);

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 760;
    final visible = visibleSections;
    final compactSelectedIndex = visible.indexOf(selectedIndex);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            if (!compact)
              AppRail(
                selectedIndex: selectedIndex,
                visibleSections: visible,
                onSelected: _selectSection,
              ),
            Expanded(
              child: Column(
                children: [
                  HeaderBar(
                    title: sectionTitle(selectedIndex),
                    compact: compact,
                    selectedIndex: selectedIndex,
                    visibleSections: visible,
                    user: widget.user,
                    onLogout: widget.onLogout,
                    onSelected: _selectSection,
                  ),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 180),
                      child: _screenFor(selectedIndex),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: compact
          ? NavigationBar(
              selectedIndex: compactSelectedIndex < 0
                  ? 0
                  : compactSelectedIndex,
              onDestinationSelected: (index) => _selectSection(visible[index]),
              destinations: visible
                  .map(
                    (section) => NavigationDestination(
                      icon: Icon(sectionIcon(section)),
                      selectedIcon: Icon(sectionSelectedIcon(section)),
                      label: sectionLabel(section),
                    ),
                  )
                  .toList(),
            )
          : null,
    );
  }

  Widget _screenFor(int index) {
    final safeIndex = visibleSections.contains(index)
        ? index
        : initialSectionForRole(widget.user.role);

    switch (safeIndex) {
      case 1:
        return const TablesScreen(key: ValueKey('tables'));
      case 2:
        return MenuScreen(
          key: const ValueKey('menu'),
          cart: cart,
          onAdd: (item) => setState(() => cart.add(item)),
          onRemove: (item) => setState(() => cart.remove(item)),
        );
      case 3:
        return const KitchenScreen(key: ValueKey('kitchen'));
      default:
        return DashboardScreen(
          key: const ValueKey('dashboard'),
          cartCount: cart.length,
          onOpenQrFlow: () => _selectSection(2),
        );
    }
  }

  void _selectSection(int index) {
    if (!visibleSections.contains(index)) return;
    setState(() => selectedIndex = index);
  }
}

class AppRail extends StatelessWidget {
  const AppRail({
    required this.selectedIndex,
    required this.visibleSections,
    required this.onSelected,
    super.key,
  });

  final int selectedIndex;
  final List<int> visibleSections;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      color: const Color(0xFF153B35),
      child: Column(
        children: [
          const SizedBox(height: 22),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC857),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.qr_code_2, color: Color(0xFF153B35)),
          ),
          const SizedBox(height: 28),
          ...visibleSections.map(
            (section) => RailButton(
              icon: sectionIcon(section),
              selectedIcon: sectionSelectedIcon(section),
              selected: selectedIndex == section,
              label: sectionLabel(section),
              onPressed: () => onSelected(section),
            ),
          ),
        ],
      ),
    );
  }
}

class RailButton extends StatelessWidget {
  const RailButton({
    required this.icon,
    required this.selectedIcon,
    required this.selected,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final IconData selectedIcon;
  final bool selected;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFFFFC857) : Colors.white70;

    return Tooltip(
      message: label,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(selected ? selectedIcon : icon),
          color: color,
          style: IconButton.styleFrom(
            backgroundColor: selected ? Colors.white10 : Colors.transparent,
            fixedSize: const Size(48, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({
    required this.title,
    required this.compact,
    required this.selectedIndex,
    required this.visibleSections,
    required this.user,
    required this.onLogout,
    required this.onSelected,
    super.key,
  });

  final String title;
  final bool compact;
  final int selectedIndex;
  final List<int> visibleSections;
  final DemoUser user;
  final VoidCallback onLogout;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Glourant',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: const Color(0xFF1D6F5F),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF172622),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          if (!compact)
            SegmentedButton<int>(
              segments: visibleSections
                  .map(
                    (section) => ButtonSegment(
                      value: section,
                      icon: Icon(sectionIcon(section)),
                    ),
                  )
                  .toList(),
              selected: {selectedIndex},
              showSelectedIcon: false,
              onSelectionChanged: (value) => onSelected(value.first),
            ),
          const SizedBox(width: 10),
          Tooltip(
            message: '${user.name} · ${roleLabel(user.role)}',
            child: Chip(
              avatar: Icon(roleIcon(user.role), size: 18),
              label: Text(roleLabel(user.role)),
            ),
          ),
          IconButton(
            tooltip: 'Salir',
            onPressed: onLogout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
