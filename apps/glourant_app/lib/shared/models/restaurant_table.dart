enum TableStatus { free, occupied, reserved, blocked }

class RestaurantTable {
  const RestaurantTable({
    required this.name,
    required this.room,
    required this.seats,
    required this.status,
    this.session,
    this.total = 0,
  });

  final String name;
  final String room;
  final int seats;
  final TableStatus status;
  final String? session;
  final double total;
}
