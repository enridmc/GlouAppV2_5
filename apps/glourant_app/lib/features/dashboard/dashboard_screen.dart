import 'package:flutter/material.dart';

import '../../shared/layouts/app_scroll.dart';
import '../../shared/widgets/responsive.dart';
import '../../shared/widgets/section_title.dart';
import '../../features/tables/widgets/table_grid.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({
    required this.cartCount,
    required this.onOpenQrFlow,
    super.key,
  });

  final int cartCount;
  final VoidCallback onOpenQrFlow;

  @override
  Widget build(BuildContext context) {
    return AppScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              StatCard(
                icon: Icons.table_restaurant,
                label: 'Mesas ocupadas',
                value: '2/6',
                tone: const Color(0xFF1D6F5F),
              ),
              StatCard(
                icon: Icons.receipt_long,
                label: 'Comandas activas',
                value: '3',
                tone: const Color(0xFFB65C32),
              ),
              StatCard(
                icon: Icons.payments_outlined,
                label: 'Consumo abierto',
                value: '103,30 EUR',
                tone: const Color(0xFF3C4F76),
              ),
              StatCard(
                icon: Icons.shopping_cart_outlined,
                label: 'Pedido QR demo',
                value: '$cartCount items',
                tone: const Color(0xFF7C6A0A),
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final twoColumns = constraints.maxWidth > 920;
              return Flex(
                direction: twoColumns ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandedIf(
                    enabled: twoColumns,
                    child: DemoFlowCard(onOpenQrFlow: onOpenQrFlow),
                  ),
                  SizedBox(
                    width: twoColumns ? 16 : 0,
                    height: twoColumns ? 0 : 16,
                  ),
                  ExpandedIf(enabled: twoColumns, child: const ActivityCard()),
                ],
              );
            },
          ),
          const SizedBox(height: 18),
          const SectionTitle(title: 'Estado rapido de mesas'),
          const SizedBox(height: 10),
          const TableGrid(compactCards: true),
        ],
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.tone,
    super.key,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color tone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: tone),
              const SizedBox(height: 16),
              Text(
                value,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 4),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class DemoFlowCard extends StatelessWidget {
  const DemoFlowCard({required this.onOpenQrFlow, super.key});

  final VoidCallback onOpenQrFlow;

  @override
  Widget build(BuildContext context) {
    final steps = [
      'QR en mesa',
      'Sesion temporal',
      'Carta y carrito',
      'Comanda a cocina',
      'Estado al cliente',
      'Cierre de mesa',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Demo principal'),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: steps
                  .map(
                    (step) => Chip(
                      avatar: const Icon(Icons.check_circle, size: 18),
                      label: Text(step),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onOpenQrFlow,
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Abrir flujo QR'),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    const events = [
      'Mesa 2 envio pedido #1024',
      'Cocina marco #1021 como listo',
      'Mesa 4 solicito postres',
      'Mesa 1 quedo libre',
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Actividad reciente'),
            const SizedBox(height: 8),
            ...events.map(
              (event) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.bolt_outlined),
                title: Text(event),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
