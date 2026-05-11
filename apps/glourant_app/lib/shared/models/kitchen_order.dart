enum OrderStatus { pending, kitchen, ready, served }

class KitchenOrder {
  const KitchenOrder({
    required this.code,
    required this.table,
    required this.items,
    required this.status,
    required this.minutes,
  });

  final String code;
  final String table;
  final List<String> items;
  final OrderStatus status;
  final int minutes;
}
