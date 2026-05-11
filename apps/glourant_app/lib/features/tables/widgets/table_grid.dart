import 'package:flutter/material.dart';

import '../../../core/constants/formatters.dart';
import '../../../core/constants/mock_data.dart';
import '../../../shared/models/restaurant_table.dart';
import '../../../shared/widgets/status_pill.dart';

class TableGrid extends StatelessWidget {
  const TableGrid({required this.compactCards, super.key});

  final bool compactCards;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth > 980
            ? (constraints.maxWidth - 42) / 4
            : constraints.maxWidth > 680
            ? (constraints.maxWidth - 28) / 3
            : constraints.maxWidth > 460
            ? (constraints.maxWidth - 14) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: 14,
          runSpacing: 14,
          children: tables
              .map(
                (table) => SizedBox(
                  width: cardWidth,
                  child: TableCard(table: table, compact: compactCards),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({required this.table, required this.compact, super.key});

  final RestaurantTable table;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tone = statusColor(table.status);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: tone.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.table_bar, color: tone),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        table.name,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      Text('${table.room} · ${table.seats} pax'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            StatusPill(label: tableStatusLabel(table.status), color: tone),
            if (!compact) ...[
              const SizedBox(height: 14),
              Text('Sesion: ${table.session ?? 'Sin sesion activa'}'),
              const SizedBox(height: 6),
              Text('Consumo: ${formatMoney(table.total)}'),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.qr_code_2),
                      label: const Text('QR'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: FilledButton.tonalIcon(
                      onPressed: () {},
                      icon: const Icon(Icons.lock_open),
                      label: const Text('Cerrar'),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

String tableStatusLabel(TableStatus status) {
  switch (status) {
    case TableStatus.free:
      return 'Libre';
    case TableStatus.occupied:
      return 'Ocupada';
    case TableStatus.reserved:
      return 'Reservada';
    case TableStatus.blocked:
      return 'Bloqueada';
  }
}

Color statusColor(TableStatus status) {
  switch (status) {
    case TableStatus.free:
      return const Color(0xFF1D6F5F);
    case TableStatus.occupied:
      return const Color(0xFFB65C32);
    case TableStatus.reserved:
      return const Color(0xFF3C4F76);
    case TableStatus.blocked:
      return const Color(0xFF6E6E6E);
  }
}
