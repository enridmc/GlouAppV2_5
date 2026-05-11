import 'package:flutter/material.dart';

import '../../../core/constants/formatters.dart';
import '../../../shared/models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    super.key,
  });

  final MenuItem item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: item.available
                    ? const Color(0xFFE7F2EF)
                    : const Color(0xFFF2E6E1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                item.available ? Icons.restaurant : Icons.remove_circle_outline,
                color: item.available
                    ? const Color(0xFF1D6F5F)
                    : const Color(0xFFB65C32),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.category,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: const Color(0xFF1D6F5F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(item.description),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatMoney(item.price),
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                QuantityControl(
                  enabled: item.available,
                  quantity: quantity,
                  onAdd: onAdd,
                  onRemove: onRemove,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    required this.enabled,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
    super.key,
  });

  final bool enabled;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton.outlined(
          tooltip: 'Quitar',
          onPressed: quantity > 0 ? onRemove : null,
          icon: const Icon(Icons.remove),
        ),
        SizedBox(
          width: 32,
          child: Text(
            '$quantity',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        IconButton.filledTonal(
          tooltip: 'Anadir',
          onPressed: enabled ? onAdd : null,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
