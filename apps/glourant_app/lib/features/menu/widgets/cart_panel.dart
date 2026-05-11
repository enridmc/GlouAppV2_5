import 'package:flutter/material.dart';

import '../../../core/constants/formatters.dart';
import '../../../shared/models/menu_item.dart';
import '../../../shared/widgets/section_title.dart';

class CartPanel extends StatelessWidget {
  const CartPanel({required this.cart, super.key});

  final List<MenuItem> cart;

  @override
  Widget build(BuildContext context) {
    final total = cart.fold<double>(0, (sum, item) => sum + item.price);
    final grouped = <MenuItem, int>{};
    for (final item in cart) {
      grouped[item] = (grouped[item] ?? 0) + 1;
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Carrito de mesa'),
            const SizedBox(height: 12),
            if (grouped.isEmpty)
              const Text('Todavia no hay productos en el pedido QR.')
            else
              ...grouped.entries.map(
                (entry) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(entry.key.name),
                  subtitle: Text(
                    '${entry.value} x ${formatMoney(entry.key.price)}',
                  ),
                  trailing: Text(
                    formatMoney(entry.value * entry.key.price),
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            const Divider(height: 28),
            Row(
              children: [
                const Expanded(child: Text('Total provisional')),
                Text(
                  formatMoney(total),
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900),
                ),
              ],
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: cart.isEmpty ? null : () {},
                icon: const Icon(Icons.send),
                label: const Text('Enviar comanda'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
