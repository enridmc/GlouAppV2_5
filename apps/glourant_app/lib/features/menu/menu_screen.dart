import 'package:flutter/material.dart';

import '../../core/constants/mock_data.dart';
import '../../shared/layouts/app_scroll.dart';
import '../../shared/models/menu_item.dart';
import '../../shared/widgets/section_title.dart';
import 'widgets/cart_panel.dart';
import 'widgets/menu_item_card.dart';
import 'widgets/qr_session_banner.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    required this.cart,
    required this.onAdd,
    required this.onRemove,
    super.key,
  });

  final List<MenuItem> cart;
  final ValueChanged<MenuItem> onAdd;
  final ValueChanged<MenuItem> onRemove;

  @override
  Widget build(BuildContext context) {
    return AppScroll(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final twoColumns = constraints.maxWidth > 900;
          final menuList = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const QrSessionBanner(),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Carta publicada'),
              const SizedBox(height: 10),
              ...menu.map(
                (item) => MenuItemCard(
                  item: item,
                  quantity: cart.where((entry) => entry == item).length,
                  onAdd: () => onAdd(item),
                  onRemove: () => onRemove(item),
                ),
              ),
            ],
          );

          final cartPanel = CartPanel(cart: cart);

          if (!twoColumns) {
            return Column(
              children: [menuList, const SizedBox(height: 16), cartPanel],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: menuList),
              const SizedBox(width: 16),
              SizedBox(width: 340, child: cartPanel),
            ],
          );
        },
      ),
    );
  }
}
