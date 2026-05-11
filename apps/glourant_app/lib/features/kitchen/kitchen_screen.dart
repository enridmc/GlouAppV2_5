import 'package:flutter/material.dart';

import '../../core/constants/mock_data.dart';
import '../../shared/layouts/app_scroll.dart';
import '../../shared/widgets/section_title.dart';
import 'widgets/kitchen_order_card.dart';

class KitchenScreen extends StatelessWidget {
  const KitchenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScroll(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(title: 'Comandas activas'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: kitchenOrders
                .map((order) => KitchenOrderCard(order: order))
                .toList(),
          ),
        ],
      ),
    );
  }
}
