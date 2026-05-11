import 'package:flutter/material.dart';

import '../../../shared/models/kitchen_order.dart';
import '../../../shared/widgets/status_pill.dart';

class KitchenOrderCard extends StatelessWidget {
  const KitchenOrderCard({required this.order, super.key});

  final KitchenOrder order;

  @override
  Widget build(BuildContext context) {
    final tone = orderStatusColor(order.status);

    return SizedBox(
      width: 330,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${order.code} · ${order.table}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  StatusPill(
                    label: orderStatusLabel(order.status),
                    color: tone,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ...order.items.map(
                (item) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Row(
                    children: [
                      const Icon(Icons.check_box_outline_blank, size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(item)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Icon(Icons.timer_outlined, size: 18, color: tone),
                  const SizedBox(width: 6),
                  Text('${order.minutes} min'),
                  const Spacer(),
                  IconButton.filledTonal(
                    tooltip: 'Cambiar estado',
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String orderStatusLabel(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return 'Pendiente';
    case OrderStatus.kitchen:
      return 'En cocina';
    case OrderStatus.ready:
      return 'Listo';
    case OrderStatus.served:
      return 'Servido';
  }
}

Color orderStatusColor(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      return const Color(0xFFB65C32);
    case OrderStatus.kitchen:
      return const Color(0xFF3C4F76);
    case OrderStatus.ready:
      return const Color(0xFF1D6F5F);
    case OrderStatus.served:
      return const Color(0xFF6E6E6E);
  }
}
